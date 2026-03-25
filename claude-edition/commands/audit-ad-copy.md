# /audit-ad-copy — Auditoria de Copy de Anúncios

Carregar: ~/.claude/skills/ads/references/audit-ad-copy.md, ad-copy-principles.md e account-conventions.md

## Workflow
1. Puxar todos os criativos ativos (Google: get_ad_creatives / Meta: analyze_meta_ad_performance)
2. Para cada anúncio: pontuar 0-10 contra os critérios de copy
3. Identificar problemas: chars fora do limite, erros de português, headlines repetidas, sem CTA
4. Ranquear: top 3 melhores e piores 3
5. Entregar: score por anúncio + problemas + sugestões de melhoria + prioridade de ação
