---
name: ads-toolkit
description: Performance marketing toolkit para Meta Ads e Google Ads. Skills de análise, copy, otimização e auditoria para Aprovei Pay, Aprovei Checkout e ofertas escaladas. Use quando precisar de análise de campanhas, copy de anúncios, auditoria, otimização de budget, search terms ou revisão semanal.
---

# Ads Toolkit — Google Ads + Meta Ads

Plugin de performance marketing calibrado para a operação do Rony Oliveira.

## Connectors

| Connector | Tipo | Status |
|-----------|------|--------|
| Meta Ads | Plugin nativo (openclaw-meta-ads) | ✅ Ativo |
| Google Ads | MCP server Python (/root/mcp-google-ads) | ✅ Ativo |

## Skills Disponíveis

Cada skill é um arquivo em `/root/.openclaw/extensions/ads-toolkit/openclaw/skills/`.

### Skills de Base (carregar sempre que relevante)
| Skill | Descrição |
|-------|-----------|
| `account-conventions` | Nomenclatura e estrutura das contas |
| `ad-copy-principles` | Regras e ângulos de copy |
| `performance-analysis` | Metodologia de análise de métricas |
| `search-term-methodology` | Critérios para negativar/manter search terms |
| `quality-gates` | Regras absolutas de qualidade (3x Kill Rule, Learning Phase, etc.) |

### Skills de Workflow
| Skill | Descrição | Depende de |
|-------|-----------|------------|
| `audit-ad-copy` | Auditoria de copy existente | account-conventions, ad-copy-principles |
| `budget-optimize` | Otimização de orçamento | performance-analysis, account-conventions |
| `investigate-campaign` | Diagnóstico aprofundado de campanha | account-conventions, performance-analysis |
| `mine-search-terms` | Mineração de search terms Google | search-term-methodology, account-conventions |
| `weekly-review` | Revisão semanal completa | performance-analysis, account-conventions |

### Skills de Operação Avançada
| Skill | Descrição | Depende de |
|-------|-----------|------------|
| `spy` | Inteligência competitiva via Meta Ad Library | account-conventions |
| `bleed-check` | Detecta adsets sangrando (spend sem lead) | quality-gates |
| `fatigue-scan` | Monitora fadiga criativa com análise de tendência | ad-copy-principles |
| `rebalance` | Realocação de budget por CPL | performance-analysis, quality-gates |
| `hooks` | Gera N variações de copy com frameworks PAS/BAB/AIDA | ad-copy-principles, account-conventions |
| `audience-audit` | Auditoria de arquitetura de audiências e sobreposições | account-conventions |
| `deploy-ads` | Deploy em massa de campanhas via manifest JSON | account-conventions |
| `benchmarks` | Benchmarks de mercado 2026 (carregar automaticamente) | — |

## Slash Commands

| Comando | O que faz | Skills carregadas |
|---------|-----------|-------------------|
| `/rsa` | Cria/renova copy Google RSA (15 headlines + 4 descrições) | ad-copy-principles, account-conventions |
| `/copy-meta` | Cria copy para Meta Ads | ad-copy-principles, account-conventions |
| `/meta-performance` | Panorama de performance Meta (7d e 30d) | performance-analysis, quality-gates |
| `/google-performance` | Panorama de performance Google (7d e 30d) | performance-analysis, quality-gates |
| `/meta-audit` | Auditoria completa Meta Ads | budget-optimize, audit-ad-copy, quality-gates |
| `/google-audit` | Auditoria completa Google Ads | mine-search-terms, audit-ad-copy, quality-gates |
| `/weekly-review` | Revisão semanal Meta + Google | weekly-review, quality-gates |
| `/investigate [campanha]` | Diagnóstico de campanha específica | investigate-campaign |
| `/mine-search-terms` | Analisa search terms para negativar | mine-search-terms |
| `/budget` | Sugere realocação de orçamento | budget-optimize |
| `/spy` | Inteligência competitiva de concorrentes | spy |
| `/bleed-check` | Verifica adsets sangrando agora | bleed-check, quality-gates |
| `/fatigue-scan` | Análise de fadiga criativa (14 dias) | fatigue-scan |
| `/rebalance` | Plano de realocação de budget por CPL | rebalance, quality-gates |
| `/hooks` | Gera variações de copy com frameworks PAS/BAB/AIDA | hooks, ad-copy-principles |
| `/audience-audit` | Auditoria de sobreposição de audiências | audience-audit |
| `/deploy-ads` | Deploy em massa via manifest JSON (dry-run por padrão) | deploy-ads |

## Como Usar

Quando o usuário invocar qualquer comando acima:
1. Ler a skill principal correspondente deste diretório
2. Carregar as skills dependentes indicadas
3. Executar o workflow descrito na skill
4. Nunca executar mudanças (pausar, editar, escalar) sem confirmação do Rony

## Contas

- **Meta**: act_1930115874158365 (padrão)
- **Google principal**: 7812295635 (Aprovei.ai)
- **Outras Google**: 7463577725, 3826677437, 1661726884, 7496711288, 8996438094
