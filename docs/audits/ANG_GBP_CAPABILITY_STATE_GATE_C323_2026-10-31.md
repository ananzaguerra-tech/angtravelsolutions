# ANG — Google Business capability and state gate — C323

**Data:** 2026-10-31 02:00 BRT  
**Política:** fail-closed, nunca desativar/excluir/duplicar e nenhuma publicação só com texto.

## EXECUTADO

- Relatório Mestre confirmado na Biblioteca como versão 34.
- Gmail verificado: nenhuma nova resposta positiva de Accor, Club Med ou Il Borro; somente a recusa TTW já registrada.
- Drive verificado: zero resultado para `ANG STATUS LIVE C323`.
- O inventário autenticado confirmou os Location IDs já registrados:
  - Campinas: `locations/13216142187597837770`;
  - Americana: `locations/9303824683971440569`.
- As ações disponíveis foram inspecionadas, incluindo posts, mídia, endereço, área de serviço, categorias, horários e estado OPEN/CLOSED_TEMPORARILY.
- Confirmado que:
  - `create_local_post` aceita foto opcional, mas a política ANG exige mídia;
  - `set_open_status` permite fechamento temporário;
  - endereço, área de serviço e categorias podem substituir dados e acionar re-verificação.
- Tentada leitura de título, estado OPEN, Maps URI, Place ID, endereço/localidade e verificação.
- O provedor retornou placeholders por limite de plano; os valores foram rejeitados como evidência.
- Criada governança fail-closed específica para Google Business.

## EVIDÊNCIA / URL / ID / COMMIT

- Política: `ops/google-business/ANG_GBP_FAIL_CLOSED_GOVERNANCE_2026-10-31.md`.
- Campinas: `locations/13216142187597837770`.
- Americana: `locations/9303824683971440569`.

## NÃO FEITO / MOTIVO

- Nenhuma ficha foi alterada, fechada, duplicada, desativada ou excluída.
- Nenhum post foi criado.
- Nenhum endereço, categoria, área, horário, mídia ou estado foi atualizado.
- Verificação e OPEN não foram declarados sem dados reais.

## BLOQUEIO

- `GBP_CONNECTED_NOT_VERIFIED_PROOF`.
- `GBP_OPEN_STATE_UNPROVEN`.
- `WINDSOR_READS_PAUSED_ACCOUNT_LIMIT`.
- `GBP_TEXT_ONLY_POST_SCHEMA_MORE_PERMISSIVE_THAN_ANG_POLICY`.
- `GBP_REVERIFICATION_RISK_ACTIONS_HOLD`.

## SOLUÇÃO TENTADA

- Inventário autenticado de contas e ações.
- Descoberta dos campos de estado, Maps, Place ID e endereço.
- Leitura filtrada das duas localizações sem mutação.
- Política explícita para bloquear posts sem mídia, fechamento e ações de re-verificação.

## AÇÃO HUMANA MÍNIMA

- Nenhuma para preservar as fichas como estão.
- Para liberar uma atualização: fornecer readback real do Google Business Profile com verificação, estado OPEN, Location ID, Maps URL e endereço homologado.

## PRÓXIMA AÇÃO

- Repetir o readback quando o conector fornecer dados reais.
- Publicar/atualizar somente na localização comprovadamente verificada e OPEN, com mídia real/licenciada e recibo pós-ação.

## ROLLBACK

- Reverter apenas os commits documentais; nenhuma mutação GBP exige rollback.
