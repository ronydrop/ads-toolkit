#!/bin/bash
# ads-toolkit — Claude Code Edition installer

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🚀 Instalando ads-toolkit para Claude Code..."

# Skills
mkdir -p ~/.claude/skills/ads/references
cp -r "$SCRIPT_DIR/skills/ads/"* ~/.claude/skills/ads/
echo "✅ Skills instaladas em ~/.claude/skills/ads/"

# Commands
mkdir -p ~/.claude/commands
cp "$SCRIPT_DIR/commands/"*.md ~/.claude/commands/
echo "✅ Comandos instalados em ~/.claude/commands/"

echo ""
echo "✅ ads-toolkit instalado com sucesso!"
echo ""
echo "Comandos disponíveis no Claude Code:"
echo "  /meta-performance  /google-performance  /weekly-review"
echo "  /rsa               /copy-meta           /audit-ad-copy"
echo "  /mine-search-terms /budget              /investigate"
echo ""
echo "⚠️  Lembre de configurar os MCPs em ~/.claude/settings.json"
echo "   Ver README.md para instruções."
