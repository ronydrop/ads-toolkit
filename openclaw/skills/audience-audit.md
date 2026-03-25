# audience-audit
Version: 0.1.0
Invoked by: User or Claude
Last updated: 2026-03-25

Description: Auditoria de arquitetura de audiências Meta Ads. Triggera em: "/audience-audit", "analisa públicos", "sobreposição de audiências", "públicos se sobrepondo", "lookalike", "exclusões faltando", "público canibaliza".

---

# /audience-audit — Auditoria de Arquitetura de Audiências

Puxa todos os públicos personalizados e configurações de targeting dos adsets.
Roda análise de sobreposição.
Mapeia audiências por estágio do funil.
Identifica exclusões faltando.

## Parâmetros
- `--include-inactive`: Incluir adsets pausados/inativos na análise

## Workflow

1. Puxar todos os públicos personalizados:
```
list_custom_audiences (account=act_1930115874158365)
list_lookalike_audiences (account=act_1930115874158365)
```
Categorizar por tipo: CUSTOM (base de clientes), WEBSITE (pixel), LOOKALIKE, ENGAGEMENT, OFFLINE.

2. Puxar adsets ativos com targeting:
```
get_adsets_by_adaccount (status=ACTIVE)
# Para cada adset: get_adset_by_id com campos de targeting
```

3. Mapear audiências por estágio do funil:
- **TOPO (Frio)**: interesse, LAL 3-10%, broad
- **MEIO**: visitantes do site 30-180d, visualizações de vídeo 25/50/75%, engajamento, email, LAL 1-2%
- **FUNDO**: visitantes de página de produto, iniciaram checkout, abandonaram carrinho
- **RETENÇÃO**: compradores 180d+, LTV alto

4. Análise de sobreposição — flagrar adsets que:
- Estão ativos simultaneamente
- Mesmo geo
- Mesmo evento de otimização (Lead)
- Audiências logicamente sobrepostas
- Sem exclusões mútuas
Classificar: ALTO / MÉDIO / BAIXO risco de sobreposição.

5. Identificar exclusões faltando (por impacto):
- **ALTO**: Leads/clientes existentes não excluídos das campanhas de prospecção
- **MÉDIO**: Audiências quentes não excluídas do topo frio
- **BAIXO**: Sobreposição menor de interesses/LAL

6. Gerar recomendações de arquitetura:
- Lista de audiências TOPO/MEIO/FUNDO com tamanhos
- Regras de exclusão para cada camada
- Sugestões de LAL a partir dos melhores públicos semente

## Output

```
🎯 AUDIENCE AUDIT — {data}
Conta: act_1930115874158365

ARQUITETURA ATUAL:
[Diagrama textual de funil com públicos em cada estágio]

SOBREPOSIÇÕES DETECTADAS:
🔴 ALTO RISCO:
- Adset A + Adset B: mesmo público sem exclusão mútua
  Impacto estimado: CPM inflado, leilão canibalizado

EXCLUSÕES FALTANDO:
🔴 Leads existentes não excluídos das campanhas frias (ALTO impacto)
⚠️ Retargeting não excluído do topo (MÉDIO impacto)

ARQUITETURA RECOMENDADA:
TOPO FRIO:
- Públicos: [lista]
- Excluir: Leads, clientes, visitantes 30d
MEIO:
- Públicos: [lista]
- Excluir: Leads, clientes
FUNDO:
- Públicos: [lista]
- Excluir: Clientes existentes
```

## Por que isso importa
Adsets competindo entre si no leilão = CPM inflado sem necessidade.
Leads existentes sendo impactados por anúncios de aquisição = budget desperdiçado.
Correção típica: redução de 10-20% no CPM após corrigir sobreposições.
