# performance-analysis

Metodologia padrão para análise de performance de campanhas.
Carregada por investigate-campaign e weekly-review.

## Métricas Prioritárias (nesta ordem)

### Meta Ads
1. **CPL** (Custo por Lead) = spend / leads gerados
2. **CTR** = cliques / impressões (benchmark: >1.5% bom, <0.5% ruim)
3. **Frequência** = impressões / alcance (>2.5 em frio = fadiga)
4. **CPM** = custo por 1000 impressões (indicador de competição de leilão)
5. **CVR** = leads / cliques no link (indica qualidade da landing page)

### Google Ads
1. **CPA** (Custo por Aquisição/Conversão) = spend / conversões
2. **CPC** = custo por clique
3. **CTR** = cliques / impressões (benchmark Search: >5% bom, <2% ruim)
4. **Quality Score** = 1-10 (abaixo de 6 = copy ou landing page fraca)
5. **Impression Share** = % do leilão que você está ganhando

## Benchmarks da Operação

| Produto | CPL Meta | CPL Google | Observação |
|---------|----------|------------|------------|
| Aprovei Pay (frio) | até R$80 | até R$50 | Acima = revisar |
| Aprovei Pay (retargeting) | até R$50 | até R$30 | 30-50% mais barato |
| Oferta escalada | confirmar com Rony | confirmar com Rony | Depende da margem |

## Fluxo de Análise

1. Puxar dados do período (7d e 30d)
2. Calcular métricas primárias para cada campanha
3. Comparar 7d vs 30d (tendência: melhorando ou piorando?)
4. Flaggar anomalias (ver seção abaixo)
5. Cruzar: campanhas com melhor CPL vs maior spend
6. Concluir com ranking e recomendações priorizadas

## Sinais de Alerta

### Meta
- CPL > R$120 por 2 dias seguidos → sugerir pausar
- Frequência > 2.5 em campanha de aquisição fria → trocar criativo
- Spend > R$200/dia sem nenhum lead → alertar imediatamente
- CTR < 0.5% → problema de criativo ou público errado
- CVR < 1% → problema de landing page ou oferta

### Google
- CPC subindo >30% semana a semana → concorrência ou Quality Score caindo
- Conversões caindo com mesmo spend → landing page ou oferta com problema
- Impression Share < 50% → perdendo leilão, avaliar lances
- Quality Score < 6 → copy fraca ou experiência pós-clique ruim
- Campanha ENABLED com zero impressão → aprovação ou segmentação

## Período de Análise Padrão
- Visão rápida: últimos 7 dias
- Análise completa: últimos 30 dias
- Comparação tendência: 7d atual vs 7d anterior
- Relatório semanal: segunda-feira, comparar semana anterior
