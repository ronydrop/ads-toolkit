---
name: fatigue-scan
description: Monitora fadiga criativa com análise de tendência em série temporal Meta Ads. Triggers on "criativo fatigado", "frequência alta", "analisa fadiga", "criativo cansado", "CTR caindo", "hora de trocar criativo".
---

# /fatigue-scan — Monitor de Fadiga Criativa

Analisa tendência de performance de todos os criativos ativos nos últimos 14 dias.
Detecta declínio de CTR, frequência alta e queda de hook rate.
Gera briefs de substituição para criativos de alto risco.

## Parâmetros
- `--lookback` (padrão: 14): Dias de análise
- `--frequency-cap` (padrão: 2.5): Threshold de frequência (ajustado para aquisição fria)
- `--ctr-decline` (padrão: 0.20): Flagrar se CTR caiu mais de 20% semana a semana
- `--min-spend` (padrão: R$100): Spend mínimo para incluir criativo na análise

## Adaptações para sua operação
- Threshold de frequência: **2.5** (não 4.0 do original) — operação de leads é mais sensível
- Métrica principal: **CTR + CPL** (não hook rate de vídeo)
- Moeda: BRL
- Conta: act_1930115874158365

## Workflow

1. Puxar todos os anúncios ativos com performance:
```
analyze_meta_ad_performance (lookback_days=14, account=act_1930115874158365)
```

2. Para cada criativo, calcular:
   - CTR semana 1 (dias 1-7) vs semana 2 (dias 8-14)
   - Frequência média
   - CPL semana 1 vs semana 2
   - Variação percentual (WoW)

3. Classificar risco de fadiga:

**ALTO RISCO** (precisa substituir agora):
- Frequência > 2.5, OU
- CTR caiu > 20% WoW, OU
- CPL subiu > 30% WoW, OU
- CPM subiu > 30% WoW

**RISCO MÉDIO** (monitorar de perto):
- Frequência 2.0-2.5, OU
- CTR caiu 10-20% WoW, OU
- CPL subiu 15-30% WoW

**BAIXO RISCO** (OK, manter):
- Todas as métricas estáveis ou melhorando

4. Para criativos ALTO RISCO, gerar brief de substituição:
   - Analisar: ângulo original, hook, tratamento visual, gatilho emocional
   - Sugerir: mesmo ângulo com nova abordagem + 3 opções de hook substituto

## Output

```
FATIGUE SCAN — {data}

Saudáveis: N criativos
Risco Médio: N criativos
Alto Risco: N criativos (substituir)

ALTO RISCO:
[Nome do criativo]
- Frequência: X.X (threshold: 2.5)
- CTR: X.X% → X.X% (-XX% WoW)
- CPL: R$XX → R$XX (+XX% WoW)

Brief de substituição:
O criativo [hook original] está mostrando [métrica em declínio].
Teste nova variação com o mesmo ângulo [ângulo] mas usando [nova abordagem].
Hooks sugeridos:
1. [opção 1]
2. [opção 2]
3. [opção 3]
```

## Referência — Ângulos da Operação (para briefs)
Baseado nos top performers históricos:
- Social Proof (melhor CTR 1.9%) → substituir com novo depoimento/resultado
- Pattern Interrupt (CTR 1.9%) → nova disrupção diferente
- Humor (melhor CPL) → novo setup humorístico
- Polêmico → nova provocação diferente
