# ANG SOCIAL — DEDICATED FACEBOOK CANONICAL PUBLISHER — C308 — 2026-10-30

Status: IMPLEMENTED_IN_REPOSITORY / INACTIVE / NO_PUBLISH

## Executado

- Criado candidato de import n8n separado para Facebook, sem misturar com o publicador Instagram.
- Destino único: ANG TRAVEL Page ID `353450855530042`.
- Page ID `1214700205067389` e payload `CURADORIA_ANG_AGOSTO` são rejeitados antes da Meta.
- Escopo obrigatório `channels=['facebook']`; implementação inicial limitada a `facebook_photo` com mídia HTTPS real/licenciada e proveniência completa.
- Vídeo/Reel retorna `HOLD_FACEBOOK_VIDEO_NOT_IMPLEMENTED`.
- Mesmo com gates editoriais, o fluxo permanece bloqueado sem ledger durável, escrita atômica pós-sucesso e autenticação/readback Meta comprovados.
- Recibo exige post_id/publication_id exato, permalink HTTPS, execution_id e readback; o status pós-readback continua HOLD até escrita atômica comprovada.

## Não feito / bloqueios

- Nenhum workflow importado ou executado.
- Nenhum post criado, excluído ou alterado.
- `DURABLE_IDEMPOTENCY_LEDGER_NOT_IMPLEMENTED`.
- `POST_SUCCESS_ATOMIC_LEDGER_WRITE_NOT_PROVEN`.
- `META_ORGANIC_AUTH_READBACK_MISSING`.
- `REMOTE_CI_RUN_NOT_PROVEN`.
- Os posts `1214700205067389_122123660331441523` e `353450855530042_1651151673688735` continuam `DELETE_NOT_PROVEN`.

## Rollback

Reverter o arquivo do candidato Facebook, as extensões do validador/workflow/política e este registro. Não há rollback externo porque nenhuma chamada Meta/n8n ocorreu.
