# ANG Social — Facebook Guard Trigger — C302 — 2026-10-30

Status: TRIGGER_FIXED / STATIC_READBACK_15_OF_15_PASS / REMOTE_RUN_NOT_PROVEN / NO_PUBLISH

## Executado

- Confirmado que o workflow C301 não observava o próprio arquivo no evento push para staging.
- Adicionado `.github/workflows/validate-social-facebook-guard.yml` ao filtro de push.
- Readback integral da branch staging validou 15/15 controles: imports inativos, Page ID canônico, rejeição do Page ID proibido, ausência de `pages[0]`, quarentena do legado, gates de mídia/copy, gatilho próprio e permissão somente `contents: read`.

## Evidência

- Workflow commit: `04a48abcce658048c2b2cd904d800f6ff7b81b74`.
- Workflow blob SHA: `2610fd87a0692c5eeebcb76794c6ef89d6db2491`.
- Guard blob SHA: `73c5b8a3506a26f53a455ae65d1cb7e4cf982b12`.
- Legacy blob SHA: `09783c765efe7e266e4792a3dce668a49b451278`.
- Policy blob SHA: `22c50abc4df57ad475f398a681e3812dae41ba86`.

## Não feito

- Nenhum import n8n foi carregado, ativado ou executado.
- Nenhuma página/post Meta foi criado, editado ou excluído.
- O run remoto não foi declarado PASS: os endpoints disponíveis retornaram zero workflow runs/statuses associados ao commit.

## Bloqueios preservados

- `REMOTE_CI_RUN_NOT_PROVEN`
- `META_ORGANIC_AUTH_READBACK_MISSING`
- `INCORRECT_POST_DELETE_NOT_PROVEN`
- `MEDIA_LICENSE_MASTER_AUTH_PENDING`
- `N8N_SERVICE_OAUTH_HUMAN_GATE`

## Próxima ação

- Consultar novamente o estado do run sem repetir commits artificiais.
- Manter qualquer publicação proibida até mídia real/licenciada, master oficial, dedupe, copy QA e autenticação.

## Rollback

Reverter este relatório e o commit `04a48abcce658048c2b2cd904d800f6ff7b81b74`. Nenhum estado externo foi alterado.
