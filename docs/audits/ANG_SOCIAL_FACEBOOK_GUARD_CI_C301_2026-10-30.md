# ANG Social — Facebook Guard CI — C301 — 2026-10-30

Status: STATIC_GUARD_ADDED / NO_EXTERNAL_EXECUTION / NO_PUBLISH

## Executado

- Adicionado validador determinístico para impedir regressão do destino Facebook.
- O teste exige `active=false` nos imports, Page ID canônico `353450855530042`, rejeição do ID `1214700205067389`, ausência de fallback `pages[0]`, quarentena do import legado e gates editoriais/mídia na política.
- Adicionado workflow GitHub Actions com permissões somente de leitura.
- Self-test local cobre caso positivo e caso negativo com reintrodução de `pages[0]`.

## Não feito

- Nenhum import n8n foi carregado, ativado ou executado.
- Nenhuma página/post Meta foi criado, editado ou excluído.
- Nenhuma mídia, CMS, Google Business ou publicação foi alterada.

## Bloqueios preservados

- `META_ORGANIC_AUTH_READBACK_MISSING`
- `INCORRECT_POST_DELETE_NOT_PROVEN`
- `MEDIA_LICENSE_MASTER_AUTH_PENDING`
- `N8N_SERVICE_OAUTH_HUMAN_GATE`

## Rollback

Reverter os commits C301 do script, workflow e auditoria. Não existe estado externo a reverter.
