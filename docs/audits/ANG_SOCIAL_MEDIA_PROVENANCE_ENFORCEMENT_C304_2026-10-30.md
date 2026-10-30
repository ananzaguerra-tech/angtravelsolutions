# ANG Social — Media Provenance Enforcement — C304 — 2026-10-30

Status: CRITICAL_GAP_CLOSED / STATIC_READBACK_19_OF_19_PASS / REMOTE_RUN_NOT_PROVEN / NO_PUBLISH

## Executado

- Detectada divergência entre política e gate executável: `author_or_owner` e `sha256` eram obrigatórios no manifesto, mas não no array `required` do executor.
- O gate inativo agora exige ambos antes de liberar a rota social.
- O validador CI passou a exigir os dois campos no código executável e na política.
- Self-test local e compilação Python: PASS.
- Readback da branch staging: 19/19 controles estáticos PASS.

## Evidência

- Guard commit: `fc5bf4a2841fd7ba5c9f7f0f71cae329d4d8295d`.
- Validator commit: `8aa0b313d3b0167ecb79b2ede0a49bea95b42ef6`.
- Guard blob SHA: `c43795c32f91f138b5c410c764ecb4ec694c42de`.
- Validator blob SHA: `899571d0462b19c928f023401d6bd3bfb0c5fb74`.

## Não feito

- Nenhum import, workflow n8n, chamada Meta, publicação, exclusão, WordPress ou Google Business foi executado.
- O CI remoto não foi declarado PASS.

## Bloqueios preservados

- `REMOTE_CI_RUN_NOT_PROVEN`
- `META_ORGANIC_AUTH_READBACK_MISSING`
- `INCORRECT_POST_DELETE_NOT_PROVEN`
- `MEDIA_LICENSE_MASTER_AUTH_PENDING`
- `N8N_SERVICE_OAUTH_HUMAN_GATE`

## Próxima ação

- Após autenticação, testar payload sem `author_or_owner` e sem `sha256`, ambos esperando HOLD antes da rota Meta.
- Manter publicação bloqueada sem proveniência completa, mídia real/licenciada, master, dedupe e copy QA.

## Rollback

Reverter este relatório e, em ordem inversa, `8aa0b313d3b0167ecb79b2ede0a49bea95b42ef6` e `fc5bf4a2841fd7ba5c9f7f0f71cae329d4d8295d`. Nenhum estado externo foi alterado.
