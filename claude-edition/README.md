# ads-toolkit — Claude Code Edition

Performance marketing toolkit para Meta Ads + Google Ads.
Versão para Claude Code (desktop/terminal).

## Instalação

```bash
# 1. Clonar o repositório
git clone https://github.com/ronydrop/ads-toolkit.git /tmp/ads-toolkit

# 2. Rodar o script de instalação
bash /tmp/ads-toolkit/claude-edition/install.sh
```

Ou manualmente:

```bash
# Copiar skills
mkdir -p ~/.claude/skills/ads/references
cp -r claude-edition/skills/ads/* ~/.claude/skills/ads/

# Copiar comandos
mkdir -p ~/.claude/commands
cp claude-edition/commands/* ~/.claude/commands/
```

## Comandos Disponíveis

| Comando | Descrição |
|---------|-----------|
| `/meta-performance` | Panorama Meta Ads (7d e 30d) |
| `/google-performance` | Panorama Google Ads (7d e 30d) |
| `/weekly-review` | Revisão semanal Meta + Google |
| `/rsa` | Criar/renovar copy Google RSA |
| `/copy-meta` | Criar copy para Meta Ads |
| `/audit-ad-copy` | Auditoria de criativos |
| `/mine-search-terms` | Mineração de search terms |
| `/budget` | Otimização de orçamento |
| `/investigate` | Diagnóstico de campanha |

## Requisitos

### Meta Ads MCP
```bash
# Adicionar ao ~/.claude/settings.json
{
  "mcpServers": {
    "meta-ads": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-meta"],
      "env": {
        "META_ACCESS_TOKEN": "seu_token_aqui",
        "META_ACCOUNT_ID": "act_1930115874158365"
      }
    }
  }
}
```

### Google Ads MCP
```bash
# Já configurado na VPS
# Para PC local: clonar https://github.com/googleads/google-ads-mcp
# e configurar OAuth conforme README do repo
```

## Atualizar

```bash
cd /tmp/ads-toolkit && git pull && bash claude-edition/install.sh
```
