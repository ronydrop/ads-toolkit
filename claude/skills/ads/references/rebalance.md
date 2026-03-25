# rebalance
Version: 0.1.0
Invoked by: User or Claude
Last updated: 2026-03-25

Description: Motor de realocação de orçamento baseado em CPL. Triggera em: "/rebalance", "redistribui budget", "realoca orçamento", "tira budget de X e bota em Y", "otimiza orçamento automaticamente", "budget dos melhores adsets".

---

# /rebalance — Motor de Realocação de Orçamento

Analisa CPL de todos os adsets ativos.
Identifica sub-performers vs top performers.
Gera plano de realocação (ou executa com confirmação).

## Parâmetros
- `--cpl-floor` (padrão: 0.85): Fraction do CPL médio da conta abaixo do qual é sub-performer
- `--max-shift-pct` (padrão: 30): Máximo % do budget de um adset que pode ser realocado por vez
- `--min-spend` (padrão: R$100): Spend mínimo para incluir adset na análise
- `--lookback` (padrão: 7): Dias de dados para cálculo de CPL
- `--dry-run` (padrão: true): Mostrar plano SEM executar
- `--execute`: Aplicar mudanças via API (requer confirmação do Rony)

## Adaptações para sua operação
- Métrica principal: **CPL** (não ROAS — objetivo é geração de leads)
- Valores em **BRL**
- Escala máxima por vez: **20%** (mais conservador que o padrão de 30%)
- Sempre dry-run por padrão — nunca executar sem confirmação
- Conta: act_1930115874158365

## Workflow

1. Puxar adsets ativos com performance:
```
get_adsets_by_adaccount (status=ACTIVE)
get_adset_insights (last_{lookback}_days, fields: spend, leads, cpl, impressions)
```
Ignorar adsets com spend < R$100 (dados insuficientes).

2. Calcular benchmarks da conta:
```
cpl_medio_conta = soma(spend) / soma(leads)
cpl_floor_value = cpl_medio_conta * cpl-floor (padrão: 0.85x)
cpl_top_threshold = cpl_medio_conta * 0.70 (top = 30% abaixo da média)
```

3. Classificar adsets:
- **SUB-PERFORMER**: CPL > cpl_floor_value (acima de 85% da média = pior)
- **TOP PERFORMER**: CPL < cpl_top_threshold (30% abaixo da média = melhor)
- **MID**: entre os dois

4. Calcular realocação:
- Sub-performers: redução = min(budget_atual * max-shift-pct, budget_atual - budget_mínimo)
- Top performers: receber proporcionalmente ao CPL (melhor CPL = recebe mais)
- Cap: nenhum adset individual cresce mais de 20% por rodada

5. Aplicar quality-gates:
- NÃO realocar de adsets em learning phase
- NÃO realocar se resultado quebrar budget sufficiency (min 5x CPL alvo/dia)
- NÃO executar automaticamente — sempre apresentar plano primeiro

6. Apresentar tabela + aguardar confirmação

## Output

```
💰 REBALANCE PLAN — {data}
Lookback: 7 dias | CPL médio da conta: R$XX

📊 Benchmarks:
- CPL médio: R$XX
- Floor (sub-performer): R$XX+
- Top performer: R$XX-

REALOCAÇÃO SUGERIDA:
Adset              | Budget Atual | Proposto | Variação | CPL
[Nome]             | R$XX/dia    | R$XX/dia | -20%     | R$XX (sub)
[Nome]             | R$XX/dia    | R$XX/dia | +20%     | R$XX (top)

Impacto projetado:
- Budget redistribuído: R$XX/dia
- Projeção de melhora no CPL médio: ~X%

Para executar: confirme com "sim, executar rebalance"
```

## Regras de Segurança
- NUNCA executar sem confirmação explícita do Rony
- NUNCA mover budget de campanha CBO (só ABO tem budget por adset)
- NUNCA reduzir abaixo do budget mínimo (R$30/dia por adset)
- Máximo 1 rebalance por semana no mesmo adset
- Registrar todas as execuções em `./logs/rebalance.log`
