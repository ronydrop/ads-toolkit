# benchmarks
Version: 0.1.0
Invoked by: Claude
Last updated: 2026-03-25

Description: Benchmarks de performance de ads para 2026. Carregar quando precisar comparar métricas com padrões do mercado. NÃO invocar diretamente pelo usuário — carregar automaticamente em auditorias e análises de performance.

---

# Benchmarks de Ads 2026

Fonte: WordStream/LocaliQ (16K campanhas), Triple Whale 2025, pesquisa Claude.
Valores originais em USD — converter para BRL conforme necessário (×5.80).

## Google Ads — Search

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

## Meta Ads — 2026

### Por objetivo (WordStream, 1K campanhas)
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

### Fadiga criativa — Thresholds (Meta)
| Sinal | Atenção | Crítico |
|-------|---------|---------|
| Frequência (prospecção) | >3 | >5 |
| Frequência (retargeting) | >8 | >12 |
| Queda de CTR em 14 dias | — | >20% |
| Vida útil de criativo TOPO | 3-4 semanas | — |
| Vida útil de criativo FUNDO | 6-7 semanas | — |

**Nota para operação Aprovei**: threshold de frequência mais conservador (2.5 para prospecção) baseado no histórico da conta — não usar os thresholds genéricos de mercado (3-5).

## Budget Mínimo Viável

| Plataforma | Mínimo/mês | Justificativa |
|-----------|------------|---------------|
| Google Ads | R$1.800+ | Precisa 15+ conv/mês para Smart Bidding |
| Meta Ads | R$1.200-1.500 | 50 conv/semana por adset para sair do aprendizado |
| TikTok Ads | R$600+ | CPMs baixos mas precisa de volume criativo |

## Landing Page Benchmarks

| Métrica | Valor |
|---------|-------|
| Tráfego mobile | 82.9% |
| CVR mediano | 6.6% |
| Top 10% CVR | 20%+ |
| 1s de delay | -7% nas conversões |
| QS alto (Google) → CPC | -50% |
| QS baixo (Google) → CPC | +400% |

## Benchmarks da Operação Aprovei (internos)

| Campanha | CPL Atual | Benchmark |
|----------|-----------|-----------|
| [BLUE][LEADS] Google | R$2,99/conv | Excelente — escalar |
| [SR][Gateway] Google | R$10,47/conv | Bom — manter |
| Meta (melhor) | R$~60 | Dentro do target |
| Meta (pior) | R$~119 | Acima do limite |
