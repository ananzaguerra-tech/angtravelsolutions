# WORK — próxima ação cirúrgica — Feed ANG Travel

## Fonte única
- Repositório: `ananzaguerra-tech/angtravelsolutions`
- Branch: `staging`
- Commit mínimo esperado: `f5ff4e72f998ecc90f51256f117af725dcb14a41`
- Workflow n8n correto: `FzQQYBrgzo2wU8bm`
- NÃO usar: `n5MIoBQbV5DpWp7H`

## Artefatos autorizados
- Payload: `ops/social/payloads/ang-travel-feed-authorized-2026-08-27.json`
- Fila: `ops/social/zeus-social-dispatch-queue-2026-08-27.json`
- Mídia: `public/social/2026-08-27/ang-travel-feed.png`
- Blob SHA da mídia: `9424b016bb7ede6f49b83e6af0a063dc13a05a9d`
- Tamanho esperado: `126473` bytes
- URL pública esperada: `https://raw.githubusercontent.com/ananzaguerra-tech/angtravelsolutions/staging/public/social/2026-08-27/ang-travel-feed.png`

## Estado já homologado
- `status/auth`: PASS real no n8n, execução `89`.
- O ramo de auth termina antes de nodes Meta.
- Dispatcher permanece fail-closed.

## Execução permitida agora
1. Ler o payload acima diretamente da branch `staging`.
2. Validar que a mídia retorna HTTP 200, `Content-Type` de imagem e tamanho não-zero.
3. Executar SOMENTE `CURADORIA_ANG_AGOSTO_FEED` no workflow `FzQQYBrgzo2wU8bm`.
4. Não alterar caption, CTA, marca, imagem ou formato.
5. Aceitar sucesso somente se o retorno real do Meta contiver `status=PUBLISHED` e `publication_id` não vazio.
6. Se houver erro, registrar apenas node, HTTP status, Meta error code/subcode e message; não repetir em loop.
7. Não executar Story/Carrossel até o Feed ter PASS real.

## Evidência obrigatória de conclusão
`EXECUTADO | n8n_execution_id | Meta publication_id | permalink (se consultável) | conta Instagram | timestamp`

Sem `publication_id`, manter `BLOCKED/FAILED`; nunca inferir publicação.
