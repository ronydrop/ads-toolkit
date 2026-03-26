---
name: spy
description: Inteligência competitiva de anúncios via Meta Ad Library API. Triggers on "o que concorrente está anunciando", "espia concorrente", "ads da concorrência", "inteligência competitiva", "o que [marca] está rodando".
---

# /spy — Inteligência Competitiva de Ads

Puxa todos os anúncios ativos de páginas concorrentes via Meta Ad Library API (endpoint público).
Compara com pull anterior para identificar criativos novos.
Classifica por hook, CTA, ângulo e tempo de veiculação.

## Parâmetros
- `--competitors` (obrigatório): IDs ou @handles das páginas concorrentes separados por vírgula
- `--country` (padrão: BR): Código do país para o Ad Library
- `--save-baseline`: Salvar pull atual como baseline para comparação futura

## Concorrentes do Setor (Aprovei Pay)
Gateways concorrentes no Brasil para monitorar:
- PagSeguro, Mercado Pago, Pagar.me, Asaas, InfinitePay, Cielo, Rede
- Buscar page IDs via: `https://graph.facebook.com/v21.0/{handle}?fields=id&access_token=$META_ACCESS_TOKEN`

## Workflow

1. Resolver page IDs — para cada @handle:
```
GET https://graph.facebook.com/v21.0/{handle}?fields=id,name&access_token=TOKEN
```

2. Buscar anúncios ativos no Ad Library:
```
GET https://graph.facebook.com/v21.0/ads_archive
  ?access_token=TOKEN
  &fields=id,ad_creative_body,ad_creative_link_title,ad_creative_link_description,
          ad_delivery_start_time,page_name,ad_snapshot_url
  &search_page_ids={page_id}
  &ad_reached_countries=["BR"]
  &ad_active_status=ACTIVE
  &limit=100
```
Paginar via cursor "next". Se 429: aguardar 60s e retry.

3. Diff contra baseline — carregar `./reports/spy-last.json`, identificar IDs novos vs parados.

4. Classificar cada anúncio novo:
   - **Hook**: primeira linha ou headline
   - **CTA**: texto do botão
   - **Tipo de oferta**: Desconto / Trial Grátis / Social Proof / Problema-Solução / Demo / Urgência
   - **Ângulo criativo**: Consciente do Problema / da Solução / do Produto / Branding / Retargeting
   - **Tempo no ar**: Novo (0-7d) / Testando (8-30d) / Vencedor (30d+)

5. Identificar tendências — ângulos usados por 2+ concorrentes = "Tendência de Mercado"

6. Recomendar ângulos para testar baseado no que NÃO está sendo explorado

## Output
Relatório em `./reports/spy-YYYY-MM-DD.md`:
- Resumo (N novos ads, N parados, N concorrentes monitorados)
- Tabela: Página | Hook | CTA | Tipo | Ângulo | Tempo no Ar
- Tendências identificadas
- Ângulos recomendados para testar

## Adaptações para o Brasil
- `--country=BR` sempre (não US)
- Moeda BRL nos valores de spend (quando disponíveis)
- Foco em gateways de pagamento brasileiros
- Ad Library PT-BR: https://www.facebook.com/ads/library/?country=BR

## Error Handling
- Página sem anúncios: registrar e continuar
- API erro 100 (page ID inválido): pular e avisar
- HTTP 429: aguardar 60s, retry até 3x
- Sem baseline: notar "Primeira execução — sem diff disponível"
