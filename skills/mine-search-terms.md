# mine-search-terms

Mineração de search terms para negativação e oportunidades.
Carregar search-term-methodology e account-conventions antes de iniciar.

## Trigger
Usar quando:
- Revisão semanal de keywords
- Campanha com CPC alto sem conversão
- Antes de aumentar budget de campanha Search
- Comando: "analisa search terms", "quais keywords negativar"

## Workflow

1. Carregar `search-term-methodology` para os critérios de decisão
2. Puxar search terms:
```sql
SELECT search_term_view.search_term,
       search_term_view.status,
       metrics.clicks,
       metrics.impressions,
       metrics.conversions,
       metrics.cost_micros,
       campaign.name,
       ad_group.name
FROM search_term_view
WHERE segments.date DURING LAST_30_DAYS
AND search_term_view.status = 'NONE'
AND metrics.clicks >= 1
ORDER BY metrics.cost_micros DESC
LIMIT 2000
```

3. Para cada termo, aplicar avaliação três vias:
   - **Search term**: o que o usuário digitou
   - **Keyword**: qual keyword nossa ativou
   - **Contexto da campanha**: usar account-conventions para interpretar o tema

4. Classificar: NEGAR / MANTER / ADICIONAR_KEYWORD

5. Priorizar os que têm maior custo para análise primeiro

## Exemplos de Negativação (Aprovei Pay)

### Negar:
- "gateway grátis" → intenção errada (Aprovei é pago)
- "empregos gateway de pagamento" → busca de emprego, não produto
- "gateway [concorrente]" → busca de concorrente específico
- "como funciona gateway" → busca educacional sem intenção de compra
- "gateway para jogos" → produto diferente

### Manter (mesmo sem conversão):
- "gateway pagamento pix" → on-theme, alta intenção
- "melhor gateway pagamento" → intenção de compra, ainda pesquisando
- "gateway para loja virtual" → público certo

### Adicionar como keyword:
- "gateway aprovei" → busca de marca, adicionar como exata
- "aproveipay" → busca de marca direta
- Variações de alta conversão sem keyword exata correspondente

## Output
CSV com colunas: search_term, ação, justificativa, campanha, custo_brl, conversões
Salvar como: `search-term-negatives-YYYY-MM-DD.csv`
Apresentar resumo: X termos para negar, Y oportunidades de keyword, Z para manter
