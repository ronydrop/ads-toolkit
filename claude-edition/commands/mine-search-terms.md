# /mine-search-terms — Mineração de Search Terms Google Ads

Carregar: ~/.claude/skills/ads/references/mine-search-terms.md e search-term-methodology.md

## Workflow
1. Executar query de search terms (últimos 30 dias, status NONE, ordenado por custo)
2. Para cada termo: cross-reference search term + keyword ativada + campanha/adgroup
3. Classificar: NEGAR / MANTER / ADICIONAR_KEYWORD
4. Priorizar pelos que têm maior custo sem conversão
5. Entregar CSV com: search_term, ação, justificativa, campanha, custo_brl, conversões

Conta padrão: 7812295635
