# ANG SOCIAL — IDEMPOTENCY LEDGER REFERENCE — C310 — 2026-10-30

Status: REFERENCE_IMPLEMENTED / NOT_APPLIED / NO_PUBLISH

## Executado

- Criada migração PostgreSQL de referência para ledger server-side.
- Estados: UNUSED, RESERVED, PUBLISHED e FAILED.
- Reserva por atualização atômica condicional apenas de UNUSED.
- Chaves idempotency_key e idempotency_record_id únicas.
- Índice parcial impede visual_hash repetido no mesmo canal/destino quando RESERVED ou PUBLISHED.
- Publicação exige receipt completo e readback verificado.
- FAILED e PUBLISHED são terminais; não existe função de reset/reuso.
- Criado validador offline com caso positivo e regressão negativa.
- CI configurado para validar contrato e self-test sem banco ou credenciais.

## Não feito / bloqueios

- Migração não aplicada em banco algum.
- Nenhuma credencial, tabela ou nó n8n provisionado.
- Nenhuma chamada Meta e nenhuma publicação.
- Compatibilidade/runtime e isolamento transacional permanecem não comprovados.

## Rollback

Reverter arquivos SQL, validador, workflow, política e auditoria C310. Não há rollback externo.
