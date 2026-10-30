# ANG Social — Forbidden Legacy Payload Guard — C303 — 2026-10-30

Status: CRITICAL_GAP_CLOSED / STATIC_READBACK_17_OF_17_PASS / REMOTE_RUN_NOT_PROVEN / NO_PUBLISH

## Executado

- Detectado que o executor exigia `payload_id`, mas não rejeitava explicitamente `CURADORIA_ANG_AGOSTO`.
- O gate executável agora normaliza o ID e acrescenta `FORBIDDEN_LEGACY_PAYLOAD` quando o valor proibido é recebido.
- O manifesto do import inativo passou a registrar `forbidden_payload_ids: [CURADORIA_ANG_AGOSTO]`.
- O validador CI agora exige a presença da rejeição explícita; a fixture do self-test foi atualizada.
- Readback da branch staging validou 17/17 controles estáticos.

## Evidência

- Guard commit: `73961c048d2c76ecc25f90cfb9fa2be9fa971613`.
- Validator commit: `4e509dc2b7d1645dab729783f10d73c89bb6ff01`.
- Guard blob SHA: `bc622800dfdadfa9997a071f1d4eac98240e5e12`.
- Validator blob SHA: `091733d374b9560107ac011a413f9349f3e775a2`.

## Não feito

- Nenhum import foi carregado, ativado ou executado.
- Nenhuma chamada n8n/Meta, publicação, exclusão, WordPress ou Google Business foi realizada.
- O CI remoto não foi declarado PASS; os endpoints disponíveis retornaram zero runs/statuses associados aos commits.

## Bloqueios preservados

- `REMOTE_CI_RUN_NOT_PROVEN`
- `META_ORGANIC_AUTH_READBACK_MISSING`
- `INCORRECT_POST_DELETE_NOT_PROVEN`
- `MEDIA_LICENSE_MASTER_AUTH_PENDING`
- `N8N_SERVICE_OAUTH_HUMAN_GATE`

## Próxima ação

- Quando houver autenticação, testar payload `CURADORIA_ANG_AGOSTO` e exigir bloqueio antes de qualquer chamada Meta.
- Testar em seguida Page ID proibido e Page ID não canônico.
- Não executar canário publicável sem todos os gates editoriais e de mídia.

## Rollback

Reverter este relatório e, em ordem inversa, os commits `4e509dc2b7d1645dab729783f10d73c89bb6ff01` e `73961c048d2c76ecc25f90cfb9fa2be9fa971613`. Nenhum estado externo foi alterado.
