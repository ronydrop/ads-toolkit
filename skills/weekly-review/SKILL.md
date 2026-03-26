---
name: weekly-review
description: Revisão semanal completa de performance Google Ads. Triggers on "revisão semanal", "weekly review", "como foi a semana", "relatório semanal", "segunda-feira".
---

Revisão semanal completa de performance Google Ads.
Carregar performance-analysis e account-conventions antes de iniciar.
Executar toda segunda-feira de manhã (ou quando solicitado).

## Workflow Completo

### 1. Google Ads — Semana vs Semana Anterior
```sql
SELECT campaign.name, metrics.clicks, metrics.conversions,
       metrics.cost_micros, metrics.cost_per_conversion,
       metrics.impressions, metrics.ctr
FROM campaign
WHERE segments.date DURING LAST_7_DAYS
AND campaign.status = 'ENABLED'
ORDER BY metrics.cost_micros DESC
```
Comparar com semana anterior calculando deltas.

### 2. Budget Review
- Seguir budget-optimize para verificar redistribuição necessária
- Identificar campanhas "limited by budget" com bom CPA

### 3. Search Terms
- Seguir mine-search-terms para identificar keywords a negativar
- Rápido: focar só nos que gastaram >R$20 sem conversão

### 4. Criativos / RSA
- Verificar se há anúncios novos ou pausados
- Checar Ad Strength e Quality Score das campanhas ativas

## Formato do Relatório

```
REVISAO SEMANAL GOOGLE ADS — [DATA]

GOOGLE ADS
----------
[SR][Gateway]: X conv | CPA R$XX | CPC R$XX (var% vs semana anterior)
[BLUE][LEADS]: X conv | CPA R$XX | CPC R$XX (var% vs semana anterior)

Total gasto: R$XX | Total conv: X | CPA médio: R$XX

Alertas: [listar problemas]
Destaques: [listar o que melhorou]

RECOMENDACOES
-------------
1. [Ação mais urgente]
2. [Segunda ação]
3. [Terceira ação]
```

## Periodicidade
- **Semanal**: toda segunda-feira
- **Revisão manual**: quando alguma automação disparar alerta
- **Mensal**: primeiro dia do mês — adicionar análise de mês completo
