# investigate-campaign

Investigação aprofundada de uma campanha específica.
Carregar account-conventions e performance-analysis antes.

## Quando usar
- Campanha com performance inesperada (boa ou ruim)
- Antes de escalar uma campanha
- Quando CPL piorou sem motivo aparente
- Diagnóstico de campanha nova sem resultados

## Workflow Completo

### Meta Ads — Investigação
1. `get_campaign_insights` (campaign_id, lookback_days=30)
2. `get_adsets_by_campaign` (listar todos os adsets)
3. Para cada adset: `get_adset_insights` (ver qual está performando)
4. `get_ads_by_campaign` (listar todos os anúncios)
5. `analyze_meta_ad_performance` (ver CTR e CPL por criativo)
6. `get_meta_audience_insights` (ver quem está convertendo: idade, gênero, device)
7. `optimize_meta_placements` (onde está entregando: Feed, Stories, Reels)

### Google Ads — Investigação
```sql
-- 1. Performance geral da campanha
SELECT campaign.name, metrics.clicks, metrics.impressions,
       metrics.ctr, metrics.conversions, metrics.cost_micros,
       metrics.cost_per_conversion
FROM campaign
WHERE campaign.id = '$CAMPAIGN_ID'
AND segments.date DURING LAST_30_DAYS

-- 2. Performance por adgroup
SELECT ad_group.name, metrics.clicks, metrics.conversions,
       metrics.cost_micros, metrics.average_cpc
FROM ad_group
WHERE campaign.id = '$CAMPAIGN_ID'
AND segments.date DURING LAST_30_DAYS

-- 3. Keywords da campanha
SELECT keyword.text, keyword.match_type,
       ad_group_criterion.quality_info.quality_score,
       metrics.clicks, metrics.conversions, metrics.cost_micros
FROM keyword_view
WHERE campaign.id = '$CAMPAIGN_ID'
AND segments.date DURING LAST_30_DAYS
ORDER BY metrics.cost_micros DESC

-- 4. Search terms (o que realmente ativou)
SELECT search_term_view.search_term, metrics.clicks,
       metrics.conversions, metrics.cost_micros
FROM search_term_view
WHERE campaign.id = '$CAMPAIGN_ID'
AND segments.date DURING LAST_30_DAYS
ORDER BY metrics.cost_micros DESC
LIMIT 100
```

## Checklist de Diagnóstico

### Se CPL piorou:
- [ ] Concorrência aumentou? (CPM subindo)
- [ ] Criativo fatigado? (frequência alta, CTR caindo)
- [ ] Público saturado? (alcance diminuindo)
- [ ] Landing page mudou? (CVR caiu mas CTR manteve)
- [ ] Sazonalidade? (período específico do mês/semana)
- [ ] Budget foi cortado? (volume menor = menos otimização do algoritmo)

### Se CPL melhorou inesperadamente:
- [ ] Qual criativo/adset está puxando?
- [ ] Qual público está convertendo mais?
- [ ] Replicar o que funcionou em outras campanhas

### Se campanha não entrega:
- [ ] Status de aprovação dos anúncios?
- [ ] Público muito restrito?
- [ ] Lance muito baixo para o leilão?
- [ ] Quality Score baixo (Google)?

## Output
Relatório de investigação com:
- Causa raiz identificada
- Evidências (dados que suportam a conclusão)
- Ação recomendada
- Impacto esperado
