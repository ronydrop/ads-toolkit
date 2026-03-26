---
name: deploy-ads
description: Deploy em massa de campanhas Meta Ads via API a partir de manifest JSON. ATENÇÃO skill de alto risco — sempre usar --dry-run primeiro. Triggers on "cria campanhas em massa", "sobe campanhas do manifest", "deploy de anúncios".
---

# /deploy-ads — Deploy em Massa de Campanhas Meta

Lê um manifest JSON e cria campanhas, adsets, criativos e anúncios via Meta Graph API.
Sempre criar em modo PAUSADO (draft) por padrão.

## REGRAS DE SEGURANÇA
- SEMPRE usar `--dry-run` primeiro para validar
- NUNCA publicar diretamente sem revisão do Rony
- Default: `--mode=draft` (tudo pausado)
- Confirmar com Rony antes de qualquer `--mode=publish`

## Parâmetros
- `--manifest` (obrigatório): Caminho para o JSON do manifest
- `--mode` (padrão: draft): `draft` = tudo pausado | `publish` = ativo
- `--dry-run`: Validar manifest sem fazer chamadas à API

## Formato do Manifest
```json
{
  "campaign_name": "Nome da Campanha",
  "objective": "LEAD_GENERATION",
  "ad_account_id": "act_1930115874158365",
  "ad_sets": [
    {
      "name": "Nome do Adset",
      "daily_budget_brl": 100,
      "targeting": {
        "geo_locations": {"countries": ["BR"]},
        "age_min": 25,
        "age_max": 55
      },
      "optimization_goal": "LEAD_GENERATION",
      "ads": [
        {
          "name": "Nome do Anuncio",
          "image_path": "./assets/criativo.jpg",
          "headline": "Headline aqui",
          "body": "Texto do anúncio aqui",
          "cta": "LEARN_MORE",
          "link": "https://aproveipay.com.br"
        }
      ]
    }
  ]
}
```

## Workflow

1. Validar manifest — checar campos obrigatórios, verificar arquivos de imagem, confirmar account ID.
   Se `--dry-run`: mostrar resultado e parar.

2. Upload de imagens criativas:
```
upload_ad_image (account=act_1930115874158365, image_path=X)
```
Aguardar 0.5s entre uploads.

3. Criar campanha:
```
create_campaign (name, objective, status=PAUSED, special_ad_categories=[])
```

4. Criar adsets (um por um, aguardar 0.5s entre cada):
```
create_adset (campaign_id, name, targeting, daily_budget, optimization_goal, status=PAUSED)
```

5. Criar criativos e anúncios:
```
create_ad_creative (page_id, image_hash, link, headline, body, cta)
create_ad (adset_id, creative_id, name, status=PAUSED)
```

6. Retry logic:
   - HTTP 429: aguardar 60s, retry
   - HTTP 400: registrar erro, pular item, continuar
   - HTTP 500: aguardar 5s, retry até 3x

7. Gerar relatório: `./reports/deploy-YYYY-MM-DD-HHmm.md`

## Output
```
DEPLOY COMPLETO — {data}
Conta: act_1930115874158365
Modo: DRAFT (tudo pausado)

Criado:
- Campanha: [ID] [nome]
- Adsets: N criados
- Anúncios: N criados

Erros: N (ver relatório)

Relatório: ./reports/deploy-YYYY-MM-DD-HHmm.md
Revisar e ativar manualmente no Ads Manager.
```

## Nota sobre Page ID
Para criar criativos é necessário o Facebook Page ID da página associada.
Page ID da Aprovei: verificar em Meta Business Suite > Pages.
