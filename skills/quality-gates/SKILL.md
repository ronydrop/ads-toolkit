---
name: quality-gates
description: Regras absolutas de qualidade aplicadas em TODA análise de ads. Carregar junto com qualquer outra skill de análise. Nunca violar estas regras independente do contexto.
---

## Regras Absolutas (nunca violar)

### 3x Kill Rule
Qualquer campanha ou adset com CPA/CPL > 3x a meta → flaggar para pausa imediata.
- Ex: meta de CPL R$80 → acima de R$240 = pause imediato
- Não esperar 7 dias. Esta regra tem prioridade sobre "aguardar dados"

### Budget Sufficiency (Meta)
Meta requer dados suficientes para otimizar:
- ABO: mínimo 5x o CPL alvo por adset/dia
  - Ex: CPL alvo R$80 → mínimo R$400/dia por adset
- CBO: mínimo 5x o CPL alvo por campanha/dia
- Adset com budget abaixo disso: algoritmo não consegue otimizar → recomendar aumentar ou consolidar

### Learning Phase — Nunca editar
Durante a fase de aprendizado (< 50 eventos de otimização):
- NÃO pausar
- NÃO editar budget (mais de 20% quebra o aprendizado)
- NÃO trocar criativo
- NÃO alterar targeting
- Exceção: 3x Kill Rule tem prioridade se CPL explodir

### Frequência (Meta)
- Aquisição fria: máximo 2.5 antes de trocar criativo
- Retargeting: máximo 5.0 antes de renovar
- Acima disso: CPM sobe, CTR cai, algoritmo penaliza entrega

### Smart Bidding (Google)
- Nunca recomendar Broad Match sem Smart Bidding ativo
- Smart Bidding requer mínimo 15 conversões/mês para funcionar
- Abaixo de 15 conv/mês: usar CPC manual ou Max Clicks

### Compliance
- Sempre verificar se campanha envolve categorias especiais (crédito, financeiro)
- Aprovei Pay = produto financeiro → pode ter restrições de targeting por idade/localização
- Nunca prometer retorno financeiro específico no copy

### Atribuição Padrão
- Meta: 7-day click / 1-day view (padrão)
- Google: data-driven attribution (quando disponível)
- Não comparar métricas entre janelas de atribuição diferentes

## Scoring A-F (para auditorias)

| Grade | Score | Interpretação |
|-------|-------|---------------|
| A | 90-100 | Excelente — apenas otimizações menores |
| B | 75-89 | Bom — algumas oportunidades de melhoria |
| C | 60-74 | Atenção — problemas notáveis a resolver |
| D | 40-59 | Ruim — problemas significativos presentes |
| F | < 40 | Crítico — intervenção urgente necessária |

## Alertas Automáticos (disparar sem ser perguntado)

Sempre alertar proativamente se:
- CPL > R$120 por 2 dias consecutivos em qualquer campanha ativa
- Spend > R$200/dia com zero leads
- Frequência > 2.5 em campanha de aquisição fria
- Budget esgotado (campanha vai pausar automaticamente)
- Campanha saindo da learning phase (oportunidade de editar com segurança)
- 3x Kill Rule ativada
