---
name: budget-optimize
description: Otimização e realocação de orçamento entre campanhas Google Ads. Triggers on "otimiza budget", "redistribui orçamento", "limited by budget", "escalar campanha", "cortar campanha".
---

Otimização e realocação de orçamento entre campanhas Google Ads.
Carregar performance-analysis e account-conventions antes.

## Princípios de Budget

1. **Nunca cortar o que está funcionando** — se CPA está bom e volume é suficiente, aumentar
2. **Dados mínimos antes de decisão** — pelo menos 3 dias de dados para pausar; 7 dias para escalar
3. **Realocação > corte** — tirar budget de campanha ruim e colocar na boa
4. **Escala gradual** — aumentar no máximo 20-30% por vez para não desestabilizar o algoritmo

## Quality Gates

### 3x Kill Rule
Campanha com CPA > 3x a meta → flaggar para pausa imediata. Prioridade sobre "aguardar dados".

### Smart Bidding
- Nunca recomendar Broad Match sem Smart Bidding ativo
- Smart Bidding requer mínimo 15 conversões/mês
- Abaixo de 15 conv/mês: usar CPC manual ou Max Clicks

## Regras de Decisão Google Ads

| Situação | Ação |
|----------|------|
| "Limited by budget" + CPA bom | Aumentar budget da campanha |
| Alto spend + zero conversão 7d | Pausar, revisar keywords e copy |
| Impression Share < 50% + bom CPA | Aumentar lance ou budget |
| Quality Score < 6 | NÃO aumentar budget — corrigir primeiro |

## Workflow de Otimização Semanal

1. Puxar performance dos últimos 7 dias
2. Converter micros para BRL (÷ 1.000.000)
3. Calcular CPA de cada campanha ativa
4. Ordenar do melhor ao pior CPA
5. Identificar campanhas "limited by budget"
6. Calcular redistribuição:
   - Tirar X% das campanhas com CPA ruim
   - Colocar nas campanhas com CPA bom e limitação de budget
7. Apresentar tabela antes/depois para aprovação do Rony
8. **Nunca executar mudança de budget sem confirmação**

## Query Google Ads para Budget Analysis
```sql
SELECT campaign.name,
       campaign.status,
       campaign_budget.amount_micros,
       campaign_budget.explicitly_shared,
       metrics.cost_micros,
       metrics.conversions,
       metrics.cost_per_conversion
FROM campaign
WHERE segments.date DURING LAST_7_DAYS
AND campaign.status = 'ENABLED'
ORDER BY metrics.cost_micros DESC
```

## Campanhas Atuais (referência)

| Campanha | Budget Atual | CPA | Status |
|----------|-------------|-----|--------|
| [SR][Gateway] Aprovei.ai | verificar | R$10,47/conv (30d) | ENABLED |
| [BLUE][LEADS][INSTITUCIONAL] | verificar | R$2,99/conv (30d) | ENABLED |

Nota: conversões Google podem não = leads qualificados. Validar com dados da Aprovei.
