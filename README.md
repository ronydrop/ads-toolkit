# ads-toolkit

Performance marketing toolkit para **Meta Ads + Google Ads**.
Skills de análise, copy, auditoria e otimização — calibradas para a operação Aprovei.

Disponível para **OpenClaw** (Jarvis/VPS) e **Claude Code** (desktop).

---

## Estrutura do Repositório

```
ads-toolkit/
├── openclaw/                    ← Plugin para OpenClaw (Jarvis)
│   ├── SKILL.md                 ← Entrada principal do plugin
│   ├── openclaw.plugin.json     ← Manifest do plugin
│   ├── package.json
│   └── skills/                  ← 9 skills de referência
│       ├── account-conventions.md
│       ├── ad-copy-principles.md
│       ├── performance-analysis.md
│       ├── search-term-methodology.md
│       ├── audit-ad-copy.md
│       ├── budget-optimize.md
│       ├── investigate-campaign.md
│       ├── mine-search-terms.md
│       └── weekly-review.md
│
└── claude/                      ← Plugin para Claude Code (desktop)
    ├── CLAUDE.md                ← Contexto da operação (copiar pro projeto)
    ├── install.sh               ← Script de instalação automática
    ├── README.md                ← Instruções detalhadas
    ├── skills/ads/              ← Skills carregadas sob demanda
    │   └── references/          ← 9 arquivos de referência (mesmos do OpenClaw)
    └── commands/                ← Slash commands (/rsa, /budget, etc.)
        ├── rsa.md
        ├── copy-meta.md
        ├── meta-performance.md
        ├── google-performance.md
        ├── weekly-review.md
        ├── audit-ad-copy.md
        ├── mine-search-terms.md
        ├── budget.md
        └── investigate.md
```

---

## Comandos Disponíveis

| Comando | Descrição |
|---------|-----------|
| `/rsa` | Criar/renovar copy Google RSA (15 headlines + 4 descrições) |
| `/copy-meta` | Criar copy para Meta Ads (3 variações A/B/C) |
| `/meta-performance` | Panorama de performance Meta Ads (7d e 30d) |
| `/google-performance` | Panorama de performance Google Ads (7d e 30d) |
| `/weekly-review` | Revisão semanal completa Meta + Google |
| `/audit-ad-copy` | Auditoria de criativos com score 0-10 |
| `/mine-search-terms` | Mineração de search terms para negativar |
| `/budget` | Otimização e realocação de orçamento |
| `/investigate [campanha]` | Diagnóstico aprofundado de campanha |

---

## Instalação — OpenClaw

**Windows (PowerShell):**
```powershell
git clone https://github.com/ronydrop/ads-toolkit.git "$env:USERPROFILE\.openclaw\extensions\ads-toolkit"
openclaw gateway restart
```

**Linux/macOS:**
```bash
git clone https://github.com/ronydrop/ads-toolkit.git ~/.openclaw/extensions/ads-toolkit
openclaw gateway restart
```

> O OpenClaw carrega automaticamente plugins de `~/.openclaw/extensions/`.

---

## Instalação — Claude Code

**Windows (PowerShell):**
```powershell
git clone https://github.com/ronydrop/ads-toolkit.git "$env:TEMP\ads-toolkit"
Set-Location "$env:TEMP\ads-toolkit"
.\claude\install.ps1
```

**Linux/macOS:**
```bash
git clone https://github.com/ronydrop/ads-toolkit.git /tmp/ads-toolkit
bash /tmp/ads-toolkit/claude/install.sh
```

O script instala:
- Skills em `~/.claude/skills/ads/` (Linux/macOS) ou `%USERPROFILE%\.claude\skills\ads\` (Windows)
- Comandos em `~/.claude/commands/` ou `%USERPROFILE%\.claude\commands\`
- `CLAUDE.md` na pasta atual (contexto da operação)

Ver `claude/README.md` para configuração dos MCPs.

---

## Atualizar

**Windows (PowerShell):**
```powershell
# OpenClaw
Set-Location "$env:USERPROFILE\.openclaw\extensions\ads-toolkit"; git pull; openclaw gateway restart

# Claude Code
Set-Location "$env:TEMP\ads-toolkit"; git pull; .\claude\install.ps1
```

**Linux/macOS:**
```bash
# OpenClaw
cd ~/.openclaw/extensions/ads-toolkit && git pull && openclaw gateway restart

# Claude Code
cd /tmp/ads-toolkit && git pull && bash claude/install.sh
```

---

## Connectors necessários

| Connector | OpenClaw | Claude Code |
|-----------|----------|-------------|
| Meta Ads | Plugin `openclaw-meta-ads` (nativo) | MCP `@modelcontextprotocol/server-meta` |
| Google Ads | MCP Python `/root/mcp-google-ads` | MCP `google-ads-mcp-server` |
