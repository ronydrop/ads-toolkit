# audit-ad-copy

Auditoria de copy de anúncios existentes.
Carregar account-conventions e ad-copy-principles antes de executar.

## Quando usar
- Campanha com CTR caindo
- Copy não renovada há mais de 30 dias
- Antes de criar novas variações (entender o que já existe)
- Revisão semanal de qualidade criativa

## Workflow Google Ads

1. `get_ad_creatives` para o customer_id relevante
2. Para cada RSA ativo, avaliar cada headline e descrição contra:
   - [ ] Tem keyword principal? (mínimo 3 headlines)
   - [ ] Tem proposta de valor clara? (mínimo 3 headlines)
   - [ ] Tem CTA explícito? (mínimo 2 headlines)
   - [ ] Tem diferencial competitivo? (mínimo 2 headlines)
   - [ ] Headlines repetindo conceito? (problema)
   - [ ] Alguma headline com erro de português? (problema grave)
   - [ ] Chars dentro do limite? (30 headlines, 90 descrições)
3. Pontuar de 0-10 cada anúncio
4. Listar melhorias específicas por anúncio

## Workflow Meta Ads

1. `analyze_meta_ad_performance` (lookback_days=14)
2. Para cada ad ativo, avaliar:
   - [ ] Hook nos primeiros 3 segundos/palavras? (crítico para vídeo)
   - [ ] Proposta de valor clara dentro de 5 segundos?
   - [ ] CTA explícito?
   - [ ] Ângulo alinhado com o público da campanha?
   - [ ] Frequência do ad (acima de 2.5 = fadiga)
   - [ ] CTR acima de 1%?
3. Identificar os 3 melhores e os 3 piores
4. Recomendar: pausar os piores, duplicar e testar variações dos melhores

## Problemas Encontrados nas Campanhas Atuais (histórico)

### [BLUE][LEADS][INSTITUCIONAL]
- Copy institucional e genérica (headlines como "AproveiPay", "Integre Já Com Aprovei.ai")
- Funciona bem pelo baixo CPC (R$0,57) e alto volume (173 conv/mês)
- Risco: sem diferencial claro, vulnerável à concorrência

### [SR][Gateway] Aprovei.ai
- Copy mais técnica e com diferenciais reais (98% aprovação, 2 dias úteis, sem bloqueio)
- CPC maior (R$3,22) mas copy mais qualificada
- Oportunidade: testar ângulo de dor ("cansado de saldo bloqueado?")

### [Blue][Leads][Pesquisa][Roni] (pausada)
- Erros de português ("Pagemento", "Clinetes", "Faciliete")
- Copy fraca sem diferenciais claros
- NÃO reativar sem refazer o copy completamente

## Output
Relatório com:
- Score por anúncio (0-10)
- Problemas identificados
- Headlines/descrições sugeridas para substituição
- Prioridade de ação (urgente / pode esperar / OK)
