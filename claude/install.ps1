# ads-toolkit — Claude Code Edition installer (Windows PowerShell)
# Executar: .\install.ps1

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Instalando ads-toolkit para Claude Code..." -ForegroundColor Cyan

# Skills
$skillsPath = "$env:USERPROFILE\.claude\skills\ads\references"
New-Item -ItemType Directory -Force -Path $skillsPath | Out-Null
Copy-Item "$ScriptDir\skills\ads\*" "$env:USERPROFILE\.claude\skills\ads\" -Recurse -Force
Write-Host "Skills instaladas em $env:USERPROFILE\.claude\skills\ads\" -ForegroundColor Green

# Commands
$commandsPath = "$env:USERPROFILE\.claude\commands"
New-Item -ItemType Directory -Force -Path $commandsPath | Out-Null
Copy-Item "$ScriptDir\commands\*.md" $commandsPath -Force
Write-Host "Comandos instalados em $commandsPath" -ForegroundColor Green

# CLAUDE.md
if (-Not (Test-Path "CLAUDE.md")) {
    Copy-Item "$ScriptDir\CLAUDE.md" ".\CLAUDE.md"
    Write-Host "CLAUDE.md criado no diretório atual" -ForegroundColor Green
} else {
    Write-Host "CLAUDE.md ja existe — nao sobrescrevendo. Verifique manualmente." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "ads-toolkit instalado com sucesso!" -ForegroundColor Green
Write-Host ""
Write-Host "Comandos disponiveis no Claude Code:"
Write-Host "  /meta-performance  /google-performance  /weekly-review"
Write-Host "  /rsa               /copy-meta           /audit-ad-copy"
Write-Host "  /mine-search-terms /budget              /investigate"
Write-Host "  /spy               /bleed-check         /fatigue-scan"
Write-Host "  /rebalance         /hooks               /audience-audit"
Write-Host "  /deploy-ads"
Write-Host ""
Write-Host "Lembre de configurar os MCPs em %USERPROFILE%\.claude\settings.json" -ForegroundColor Yellow
Write-Host "Ver claude\README.md para instrucoes."
