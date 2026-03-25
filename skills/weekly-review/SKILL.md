---
name: weekly-review
description: Revisão semanal completa de performance Meta Ads + Google Ads. Triggers on "revisão semanal", "weekly review", "como foi a semana", "relatório semanal", "segunda-feira".
---

Revisão semanal completa de performance — Meta Ads + Google Ads.
Carregar performance-analysis e account-conventions antes de iniciar.
Executar toda segunda-feira de manhã (ou quando solicitado).

## Workflow Completo

### 1. Meta Ads — Semana vs Semana Anterior
1. `get_meta_campaign_performance` (lookback_days=7)
2. Comparar com semana anterior (lookback_days=14, calcular delta)
3. Para cada campanha ativa: CPL atual vs CPL semana anterior
4. `analyze_meta_wasted_spend` (detectar spend sem retorno)
5. `detect_meta_creative_fatigue` (frequência + queda de CTR)

### 2. Google Ads — Semana vs Semana Anterior
```sql
SELECT campaign.name, metrics.clicks, metrics.conversions,
       metrics.cost_micros, metrics.cost_per_conversion,
       metrics.impressions, metrics.ctr
FROM campaign
WHERE segments.date DURING LAST_7_DAYS
AND campaign.status = 'ENABLED'
ORDER BY metrics.cost_micros DESC
```
Comparar com semana anterior manualmente calculando deltas.

### 3. Análise de Criativos
- `analyze_meta_ad_performance` — top 3 e piores 3 da semana
- `get_ad_creatives` (Google) — ver se há anúncios novos ou pausados

### 4. Budget Review
- Seguir budget-optimize para verificar redistribuição necessária
- Identificar campanhas "limited by budget" com bom CPL

### 5. Search Terms (Google)
- Seguir mine-search-terms para identificar keywords a negativar
- Rápido: focar só nos que gastaram >R$20 sem conversão

## Formato do Relatório

```
REVISAO SEMANAL DE ADS — [DATA]

META ADS
--------
[CBO Toguro] CPL: R$XX (var% vs semana anterior)
[TOPO F] CPL: R$XX (var% vs semana anterior)
...

Total gasto Meta: R$XX | Total leads: X | CPL médio: R$XX

Alertas: [listar problemas]
Destaques: [listar o que melhorou]

GOOGLE ADS
----------
[SR][Gateway]: X conv | CPA R$XX | CPC R$XX
[BLUE][LEADS]: X conv | CPA R$XX | CPC R$XX

Total gasto Google: R$XX | Total conv: X | CPA médio: R$XX

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
