# ads-toolkit

Performance marketing toolkit para **Google Ads** e **Meta Ads** — dois plugins Claude Code independentes num único repositório.

---

## Estrutura

```
ads-toolkit/
├── .claude-plugin/
│   └── marketplace.json       ← aponta para ./google e ./meta
│
├── google/                    ← Google Ads Toolkit (9 skills, 7 commands)
│   ├── .claude-plugin/plugin.json
│   ├── .mcp.json              ← mcp-google-ads
│   ├── CLAUDE.md
│   ├── skills/
│   └── commands/
│
└── meta/                      ← Meta Ads Toolkit (10 skills, 9 commands)
    ├── .claude-plugin/plugin.json
    ├── .mcp.json              ← fb-ads-mcp-server
    ├── CLAUDE.md
    ├── skills/
    └── commands/
```

---

## Instalação

```bash
claude plugin marketplace add ronydrop/ads-toolkit
claude plugin install google-ads-toolkit
claude plugin install meta-ads-toolkit
```

---

## Comandos

### Google Ads (`google-ads-toolkit`)

| Comando | Descrição |
|---------|-----------|
| `/google-performance` | Panorama de performance Google Ads |
| `/weekly-review` | Revisão semanal Google Ads |
| `/mine-search-terms` | Mineração de search terms para negativar |
| `/rsa` | Criar/renovar copy Google RSA |
| `/audit-ad-copy` | Auditoria de copy com score |
| `/budget` | Otimização de orçamento |
| `/investigate` | Diagnóstico de campanha |

### Meta Ads (`meta-ads-toolkit`)

| Comando | Descrição |
|---------|-----------|
| `/meta-performance` | Panorama de performance Meta Ads |
| `/copy-meta` | Criar copy para Meta Ads |
| `/audience-audit` | Auditoria de audiências |
| `/bleed-check` | Detectar adsets sangrando |
| `/fatigue-scan` | Monitor de fadiga criativa |
| `/rebalance` | Realocação de budget entre adsets |
| `/spy` | Inteligência competitiva via Ad Library |
| `/deploy-ads` | Deploy em massa de campanhas |
| `/hooks` | Gerar variações de copy e hooks |

---

## Connectors (MCP)

| Plugin | MCP Server | Variáveis de ambiente |
|--------|-----------|----------------------|
| Google | `mcp-google-ads` | `GOOGLE_ADS_DEVELOPER_TOKEN`, `GOOGLE_ADS_CLIENT_ID`, `GOOGLE_ADS_CLIENT_SECRET`, `GOOGLE_ADS_REFRESH_TOKEN`, `GOOGLE_ADS_CUSTOMER_ID` |
| Meta | `fb-ads-mcp-server` | `FB_ACCESS_TOKEN`, `FB_APP_ID`, `FB_APP_SECRET`, `FB_AD_ACCOUNT_ID` |
