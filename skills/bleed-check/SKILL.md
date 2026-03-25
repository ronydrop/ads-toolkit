---
name: bleed-check
description: Detecta adsets sangrando (gastando sem resultado) nas últimas horas. Triggers on "ta sangrando", "adset gastando sem lead", "verifica sangramento", "alerta de gasto", "o que ta perdendo dinheiro".
---

# /bleed-check — Detector de Sangramento

Puxa dados das últimas horas de todas as campanhas ativas.
Identifica adsets com spend acima do threshold e zero leads.

## Parâmetros
- `--threshold-spend` (padrão: R$50): Pausar se spend exceder este valor na janela
- `--threshold-leads` (padrão: 0): Pausar se leads estiverem neste nível ou abaixo
- `--window-hours` (padrão: 6): Janela de lookback em horas
- `--dry-run`: Identificar mas NÃO pausar nem alertar

## Adaptações para sua operação
- Métrica de sucesso = **leads** (não purchases como no original)
- Valores em **BRL** (não USD)
- Threshold padrão: R$50 sem lead em 6h = sangramento

## Workflow

1. Puxar adsets ativos:
```
get_adsets_by_adaccount (account_id=act_1930115874158365, status=ACTIVE)
```

2. Para cada adset, puxar insights da janela:
```
get_adset_insights (
  adset_id=X,
  time_range: últimas {window_hours} horas,
  fields: spend, leads, impressions, clicks, cpl
)
```

3. Identificar sangrando: spend > threshold-spend E leads <= threshold-leads

4. Aplicar quality-gates:
   - Verificar se está em learning phase → NÃO pausar se sim (exceto 3x Kill Rule)
   - Aplicar 3x Kill Rule: CPL > R$240 → pausa independente da learning phase

5. Para cada adset sangrando (se não --dry-run):
   - `update_adset(adset_id, status=PAUSED)`
   - Aguardar 0.3s entre pausas

6. Gerar relatório de sangramento

## Output
```
BLEED CHECK — {data hora}

{N} adsets sangrando identificados:

[Nome do Adset]
   Campanha: [nome]
   Spend: R$XX | Leads: 0 | Janela: 6h
   Status: PAUSADO

Total desperdiçado: R$XX
```

Se `--dry-run`: mostrar relatório mas sem pausar.

## Regras de Segurança
- NUNCA pausar campanha inteira — apenas adsets específicos
- NUNCA pausar durante learning phase (< 50 eventos) a menos que 3x Kill Rule
- Sempre confirmar com Rony antes de pausar se valor > R$200
- Registrar todas as pausas em `./logs/bleed-check.log`
