---
name: search-term-methodology
description: Metodologia de avaliação de search terms por relevância ao tema da campanha Google Ads. Triggers on "search terms", "negative keywords", "search term report", "mine", "wasted spend", "irrelevant queries", "keyword opportunities".
---

## Search Term Mining Methodology

How to evaluate search terms in this account. The goal is not just "zero conversions = bad" — it's **relevance to the campaign theme**.

## Core Approach

1. **Filter to unactioned terms** — only look at search terms with status `NONE` (not already added as a keyword or negative). Query already applies this filter.

2. **Sort by spend descending** — prioritize where money is going. A term with 200 clicks at $0.10 CPC matters less than one with 20 clicks at $5 CPC.

3. **Cross-reference three things** for every candidate:
   - The **search term** itself (what the user typed)
   - The **matched keyword** (what triggered the ad)
   - The **campaign + ad group name** (what theme this lives in)

   The question is always: *does the search term fit the theme?*

## Relevance Evaluation

This is the judgment call. A term can be:

### Clear Negative
- Obviously off-topic: competitor names, job searches, unrelated products
- Wrong intent: "free", "empregos", "como funciona" when campaign is conversion-focused
- Ex (Aprovei Pay): "gateway grátis", "vagas gateway", "gateway netflix"

### Probably Negative
- Tangentially related but not the right audience
- Informational intent when we want transactional
- Too broad to be qualified (single generic word)

### Relevance Over Conversions
A term can have **zero conversions and still be correct to keep** if:
- It's on-theme with the campaign
- It represents genuine purchase intent
- It's a branded or product term
- Low volume (< 5 clicks) — not enough data to judge

### Clear Opportunity (add as keyword)
- High intent + relevant + converting
- Branded variant not yet captured as exact match
- Variation of existing converting keyword

## Query
```sql
SELECT search_term_view.search_term,
       search_term_view.status,
       metrics.clicks,
       metrics.impressions,
       metrics.conversions,
       metrics.cost_micros,
       campaign.name,
       ad_group.name
FROM search_term_view
WHERE segments.date DURING LAST_30_DAYS
AND search_term_view.status = 'NONE'
AND metrics.clicks >= 1
ORDER BY metrics.cost_micros DESC
LIMIT 2000
```

## Decision Framework

| Situation | Action |
|-----------|--------|
| Off-topic + any spend | NEGAR |
| Wrong intent + >R$10 spend | NEGAR |
| On-theme + zero conv + <5 clicks | MANTER (insufficient data) |
| On-theme + zero conv + >20 clicks | Investigate landing page |
| Converting + not yet exact keyword | ADICIONAR como exata |
| Brand variant not captured | ADICIONAR como exata |

## Output Format
CSV com colunas:
- `search_term`
- `ação` (NEGAR / MANTER / ADICIONAR_KEYWORD)
- `justificativa`
- `campanha`
- `custo_brl` (cost_micros ÷ 1.000.000)
- `conversoes`

Filename: `search-term-negatives-YYYY-MM-DD.csv`
Resumo final: X termos para negar | Y oportunidades de keyword | Z mantidos
