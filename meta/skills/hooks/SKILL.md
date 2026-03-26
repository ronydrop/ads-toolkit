---
name: hooks
description: Motor de variações de copy e hooks usando frameworks psicológicos de copywriting. Triggers on "gera variações de copy", "50 variações de anúncio", "frameworks de copy", "PAS", "BAB", "AIDA", "pattern interrupt", "variações de headline".
---

# /hooks — Motor de Variações de Copy

Pega um hook vencedor ou ângulo e gera N variações usando frameworks psicológicos de copywriting.
Carregar ad-copy-principles e account-conventions antes.

## Parâmetros
- `--seed` (obrigatório): O hook semente ou ângulo vencedor
- `--frameworks` (padrão: PAS,BAB,AIDA): PAS, BAB, AIDA, pattern-interrupt, social-proof, fear-appeal, curiosity-gap
- `--count` (padrão: 30): Número de variações
- `--audience` (obrigatório): Descrição do público (idade, awareness, dores)

## Frameworks de Copy

### PAS (Problema / Agitar / Solução)
Nomear o problema → torná-lo doloroso → apresentar a solução.
- Headline: [Problema que ressoa]
- Corpo: "Todo dia que você [problema], você está [consequência negativa]. Não precisa ser assim. [Produto] [resolve]."

### BAB (Before / After / Bridge)
Estado atual doloroso → estado futuro ideal → produto como ponte.
- Headline: [Resultado aspiracional específico]
- Corpo: "Antes do [produto]: [estado ruim]. Depois: [estado desejado]. A ponte: [como o produto chega lá]."

### AIDA (Atenção / Interesse / Desejo / Ação)
Prender atenção → criar interesse → despertar desejo → CTA claro.
- Headline: [Pattern interrupt ou afirmação ousada]
- Corpo: [Hook surpresa]. [Prova específica]. [Desejo]. [CTA com urgência].

### Pattern Interrupt
Quebrar padrões esperados para forçar atenção.
- Começar com: "Para.", "Espera.", "Não [ação esperada].", números de abertura, perguntas retóricas.

### Social Proof
Liderar com credibilidade — resultado de cliente, transformação, autoridade.
- "[X clientes/vendedores] já usam. [Resultado específico]."

### Fear Appeal
Identificar ameaça → quantificar custo da inação → oferecer solução.
- Foco em consequências realistas, não exageradas.

### Curiosity Gap
Criar lacuna de informação.
- "O [fato inesperado] sobre [tópico familiar]"
- "Por que [crença comum] está errada"

## Adaptações para Aprovei Pay

### Públicos-alvo
- Vendedores online / donos de loja virtual: awareness do problema (gateway bloqueando saldo)
- Infoprodutores: buscam aprovação alta e saques rápidos
- Afiliados: precisam de gateway confiável para escalar
- Empresas: buscam integração fácil com API

### Dores por público
- "Meu saldo fica bloqueado por semanas"
- "A taxa tá me matando"
- "A aprovação das vendas é muito baixa"
- "Integrar com API é complicado"
- "Não tenho suporte quando precisa"

## Workflow

1. Parsear seed e público
2. Aplicar filtro de tom: persuasivo, direto, foco em resultado
3. Gerar variações por framework (distribuir --count pelos frameworks)
4. Para cada variação variar: intensidade emocional, especificidade, POV (você/eu/eles), gatilho (dor/aspiração/curiosidade/prova social)
5. Cada variação: primary_text (125 chars), headline (40 chars), description (30 chars)
6. Tagear: framework, registro emocional, funil (TOPO/MEIO/FUNDO), placement recomendado

## Output
CSV com colunas: nome, primary_text, headline, description, framework, registro, funil, placement
Salvar: `./creatives/hooks-YYYY-MM-DD.csv`

Resumo: total de variações, breakdown por framework, top 3 recomendados para testar primeiro.
Nota de teste: "Rodar 5-10 hooks em ABO $30/dia por 3-4 dias antes de escalar vencedores."
