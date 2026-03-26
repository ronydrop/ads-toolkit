---
name: performance-analysis
description: Metodologia padrão para análise de performance de campanhas Meta Ads. Triggers on "analisa performance", "métricas", "CPL", "CTR", "frequência", "como está a campanha".
---

Metodologia padrão para análise de performance de campanhas Meta Ads.
Carregada por bleed-check, rebalance e fatigue-scan.

## Métricas Prioritárias (nesta ordem)

1. **CPL** (Custo por Lead) = spend / leads gerados
2. **CTR** = cliques / impressões (benchmark: >1.5% bom, <0.5% ruim)
3. **Frequência** = impressões / alcance (>2.5 em frio = fadiga)
4. **CPM** = custo por 1000 impressões (indicador de competição de leilão)
5. **CVR** = leads / cliques no link (indica qualidade da landing page)

## Benchmarks da Operação

| Produto | CPL Meta | Observação |
|---------|----------|------------|
| Aprovei Pay (frio) | até R$80 | Acima = revisar |
| Aprovei Pay (retargeting) | até R$50 | 30-50% mais barato |
| Oferta escalada | confirmar com Rony | Depende da margem |

## Benchmarks de Mercado — Meta Ads 2026

Fonte: WordStream (1K campanhas), Triple Whale 2025.
Valores originais em USD — converter para BRL (x5.80).

### Por objetivo
| Objetivo | CTR | CPC | CVR | CPL |
|----------|-----|-----|-----|-----|
| Tráfego | 1.71% | $0.70 (R$4) | — | — |
| Leads | 2.59% | $1.92 (R$11) | 7.72% | $27.66 (R$160) |

### ROAS benchmarks
| Segmento | ROAS |
|----------|------|
| Média geral | 2.19:1 |
| Retargeting | 3.61:1 |
| Advantage+ | 4.52:1 |

### CPM por indústria
| Indústria | CPM |
|-----------|-----|
| E-commerce | $12.50 (R$73) |
| B2B SaaS | $35.00 (R$203) |
| Financeiro | $50.00 (R$290) |

### Fadiga criativa — Thresholds
| Sinal | Atenção | Crítico |
|-------|---------|---------|
| Frequência (prospecção) | >3 | >5 |
| Frequência (retargeting) | >8 | >12 |
| Queda de CTR em 14 dias | — | >20% |
| Vida útil de criativo TOPO | 3-4 semanas | — |
| Vida útil de criativo FUNDO | 6-7 semanas | — |

**Nota para operação Aprovei**: threshold de frequência mais conservador (2.5 para prospecção) baseado no histórico da conta.

### Landing Page Benchmarks
| Métrica | Valor |
|---------|-------|
| Tráfego mobile | 82.9% |
| CVR mediano | 6.6% |
| Top 10% CVR | 20%+ |
| 1s de delay | -7% nas conversões |

## Budget Mínimo Viável
Meta Ads: R$1.200-1.500/mês — 50 conv/semana por adset para sair do aprendizado.

## Fluxo de Análise

1. Puxar dados do período (7d e 30d)
2. Converter USD para BRL (x5.80)
3. Calcular métricas primárias para cada campanha
4. Comparar 7d vs 30d (tendência: melhorando ou piorando?)
5. Flaggar anomalias (ver sinais de alerta)
6. Cruzar: campanhas com melhor CPL vs maior spend
7. Concluir com ranking e recomendações priorizadas

## Sinais de Alerta

- CPL > R$120 por 2 dias seguidos → sugerir pausar
- Frequência > 2.5 em campanha de aquisição fria → trocar criativo
- Spend > R$200/dia sem nenhum lead → alertar imediatamente
- CTR < 0.5% → problema de criativo ou público errado
- CVR < 1% → problema de landing page ou oferta

## Quality Gates (regras absolutas)

### 3x Kill Rule
Qualquer campanha ou adset com CPL > 3x a meta → flaggar para pausa imediata.
- Ex: meta de CPL R$80 → acima de R$240 = pause imediato
- Não esperar 7 dias. Esta regra tem prioridade sobre "aguardar dados"

### Budget Sufficiency
Meta requer dados suficientes para otimizar:
- ABO: mínimo 5x o CPL alvo por adset/dia
  - Ex: CPL alvo R$80 → mínimo R$400/dia por adset
- CBO: mínimo 5x o CPL alvo por campanha/dia
- Adset com budget abaixo disso: algoritmo não consegue otimizar → recomendar aumentar ou consolidar

### Learning Phase — Nunca editar
Durante a fase de aprendizado (< 50 eventos de otimização):
- NÃO pausar
- NÃO editar budget (mais de 20% quebra o aprendizado)
- NÃO trocar criativo
- NÃO alterar targeting
- Exceção: 3x Kill Rule tem prioridade se CPL explodir

### Frequência
- Aquisição fria: máximo 2.5 antes de trocar criativo
- Retargeting: máximo 5.0 antes de renovar
- Acima disso: CPM sobe, CTR cai, algoritmo penaliza entrega

### Compliance
- Sempre verificar se campanha envolve categorias especiais (crédito, financeiro)
- Aprovei Pay = produto financeiro → pode ter restrições de targeting por idade/localização
- Nunca prometer retorno financeiro específico no copy

### Atribuição Padrão
Meta: 7-day click / 1-day view (padrão).
Não comparar métricas entre janelas de atribuição diferentes.

## Scoring A-F (para auditorias)

| Grade | Score | Interpretação |
|-------|-------|---------------|
| A | 90-100 | Excelente — apenas otimizações menores |
| B | 75-89 | Bom — algumas oportunidades de melhoria |
| C | 60-74 | Atenção — problemas notáveis a resolver |
| D | 40-59 | Ruim — problemas significativos presentes |
| F | < 40 | Crítico — intervenção urgente necessária |

## Alertas Automáticos (disparar sem ser perguntado)

Sempre alertar proativamente se:
- CPL > R$120 por 2 dias consecutivos em qualquer campanha ativa
- Spend > R$200/dia com zero leads
- Frequência > 2.5 em campanha de aquisição fria
- Budget esgotado (campanha vai pausar automaticamente)
- Campanha saindo da learning phase (oportunidade de editar com segurança)
- 3x Kill Rule ativada

## Período de Análise Padrão
- Visão rápida: últimos 7 dias
- Análise completa: últimos 30 dias
- Comparação tendência: 7d atual vs 7d anterior
- Relatório semanal: segunda-feira, comparar semana anterior
