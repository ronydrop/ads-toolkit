---
name: ads
description: Performance marketing toolkit para Meta Ads e Google Ads. Skills de análise, copy, otimização e auditoria para Aprovei Pay, Aprovei Checkout e ofertas escaladas. Invoked by: /ads, /rsa, /copy-meta, /meta-performance, /google-performance, /weekly-review, /investigate, /mine-search-terms, /budget
version: 1.0.0
---

# Ads Toolkit

Skills de referência em `~/.claude/skills/ads/references/`.
Comandos em `~/.claude/commands/`.

## Sub-skills (carregar conforme necessidade)

| Arquivo | Quando carregar |
|---------|----------------|
| `references/account-conventions.md` | Sempre — nomeclatura das contas |
| `references/ad-copy-principles.md` | Ao gerar ou auditar copy |
| `references/performance-analysis.md` | Ao analisar métricas |
| `references/search-term-methodology.md` | Ao analisar search terms |
| `references/audit-ad-copy.md` | Auditoria de criativos |
| `references/budget-optimize.md` | Otimização de orçamento |
| `references/investigate-campaign.md` | Diagnóstico de campanha |
| `references/mine-search-terms.md` | Mineração de keywords |
| `references/weekly-review.md` | Revisão semanal |

## Connectors necessários

- **Meta Ads MCP**: `@modelcontextprotocol/server-meta` (requer META_ACCESS_TOKEN)
- **Google Ads MCP**: `google-ads-mcp-server` (requer oauth + developer token)

## Contas

- Meta: act_1930115874158365
- Google principal: 7812295635
