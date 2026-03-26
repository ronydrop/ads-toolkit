---
name: performance-analysis
description: Metodologia padrão para análise de performance de campanhas Google Ads. Triggers on "analisa performance", "métricas", "CPA", "CPC", "CTR", "como está a campanha", "Quality Score".
---

Metodologia padrão para análise de performance de campanhas Google Ads.
Carregada por investigate-campaign e weekly-review.

## Métricas Prioritárias (nesta ordem)

1. **CPA** (Custo por Aquisição/Conversão) = spend / conversões
2. **CPC** = custo por clique
3. **CTR** = cliques / impressões (benchmark Search: >5% bom, <2% ruim)
4. **Quality Score** = 1-10 (abaixo de 6 = copy ou landing page fraca)
5. **Impression Share** = % do leilão que você está ganhando

## Benchmarks da Operação

| Produto | CPL Google | Observação |
|---------|------------|------------|
| Aprovei Pay (frio) | até R$50 | Acima = revisar |
| Aprovei Pay (retargeting) | até R$30 | 30-50% mais barato |
| Oferta escalada | confirmar com Rony | Depende da margem |

## Benchmarks de Mercado — Google Ads Search (2026)

Fonte: WordStream/LocaliQ (16K campanhas).

### Média de todas as indústrias
| Métrica | Média | Tendência |
|---------|-------|-----------|
| CTR | 6.66% | +3.74% YoY |
| CPC | $5.26 (R$30) | Subindo em 87% das indústrias |
| CVR | 7.52% | Subindo em 65% das indústrias |
| CPL | ~$70 (R$406) | +5% YoY |

### Por indústria (Search)
| Indústria | CPC | CTR | CVR | CPL |
|-----------|-----|-----|-----|-----|
| E-commerce | $1.15 | 4.13% | 2.81% | — |
| B2B SaaS | $4.50-8.00 | 4.28% | 1.65% | $100-200 |
| Financeiro | $3.46-3.77 | 4.65-8.33% | 2.55-3.50% | — |
| Serviços Locais | $7.85-15.00 | 5.50-6.37% | 7.33-15% | $90 |

### Aprovei Pay (referência interna)
- CPC atual: R$0,57 ([BLUE][LEADS]) | R$3,22 ([SR][Gateway])
- CTR Search benchmark: >5% bom, <2% ruim
- CVR benchmark: >3% bom, <1% = problema de LP

### Landing Page Benchmarks
| Métrica | Valor |
|---------|-------|
| Tráfego mobile | 82.9% |
| CVR mediano | 6.6% |
| Top 10% CVR | 20%+ |
| 1s de delay | -7% nas conversões |
| QS alto (Google) → CPC | -50% |
| QS baixo (Google) → CPC | +400% |

## Budget Mínimo Viável
Google Ads: R$1.800+/mês — precisa 15+ conv/mês para Smart Bidding funcionar.

## Fluxo de Análise

1. Puxar dados do período (7d e 30d)
2. Converter micros para BRL (÷ 1.000.000)
3. Calcular métricas primárias para cada campanha
4. Comparar 7d vs 30d (tendência: melhorando ou piorando?)
5. Flaggar anomalias (ver sinais de alerta)
6. Cruzar: campanhas com melhor CPA vs maior spend
7. Concluir com ranking e recomendações priorizadas

## Sinais de Alerta

- CPC subindo >30% semana a semana → concorrência ou Quality Score caindo
- Conversões caindo com mesmo spend → landing page ou oferta com problema
- Impression Share < 50% → perdendo leilão, avaliar lances
- Quality Score < 6 → copy fraca ou experiência pós-clique ruim
- Campanha ENABLED com zero impressão → aprovação ou segmentação

## Quality Gates (regras absolutas)

### 3x Kill Rule
Qualquer campanha com CPA > 3x a meta → flaggar para pausa imediata.
- Ex: meta de CPA R$50 → acima de R$150 = pause imediato
- Não esperar 7 dias. Esta regra tem prioridade sobre "aguardar dados"

### Smart Bidding
- Nunca recomendar Broad Match sem Smart Bidding ativo
- Smart Bidding requer mínimo 15 conversões/mês para funcionar
- Abaixo de 15 conv/mês: usar CPC manual ou Max Clicks

### Compliance
- Sempre verificar se campanha envolve categorias especiais (crédito, financeiro)
- Aprovei Pay = produto financeiro → pode ter restrições de targeting por idade/localização
- Nunca prometer retorno financeiro específico no copy

### Atribuição Padrão
Google: data-driven attribution (quando disponível).
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
- CPA > 3x meta por 2 dias consecutivos em qualquer campanha ativa
- Spend > R$200/dia com zero conversões
- Budget esgotado (campanha vai pausar automaticamente)
- 3x Kill Rule ativada

## Período de Análise Padrão
- Visão rápida: últimos 7 dias
- Análise completa: últimos 30 dias
- Comparação tendência: 7d atual vs 7d anterior
- Relatório semanal: segunda-feira, comparar semana anterior
