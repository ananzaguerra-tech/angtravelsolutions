# ANG Social — PostgreSQL staging deployment and rollback plan — C312 — 2026-10-30

Status: `REFERENCE_ONLY / NOT_APPLIED / NO_CREDENTIALS / NO_PUBLISH`

## Purpose

Provide the exact, fail-closed procedure required before the reference ledger in
`ANG_SOCIAL_IDEMPOTENCY_LEDGER_POSTGRES_V1.sql` may be wired into n8n.
This document does not authorize database creation, credential entry, workflow import,
Meta calls or publication.

## Preconditions

All items must be independently evidenced before migration:

1. Dedicated PostgreSQL staging instance and database; never production.
2. Supported PostgreSQL version recorded from `SHOW server_version;`.
3. Encrypted backup/snapshot completed and restore tested.
4. Separate owner role and n8n runtime role; no shared human credential.
5. Runtime role has no `SUPERUSER`, `CREATEDB`, `CREATEROLE`, replication or schema-owner privileges.
6. TLS required by the connection.
7. n8n credential entered only through the official credential vault; never committed or pasted in chat.
8. Existing schema inventory and object-name collision check completed.
9. Transaction isolation recorded from `SHOW transaction_isolation;`.
10. Public publishers remain inactive and disconnected from Meta.

## Least-privilege target

The migration is applied by a temporary migration owner. After review, the n8n runtime
role receives only:

- `USAGE` on the selected schema;
- `SELECT` on `ang_social_publication_ledger` for exact readback;
- `EXECUTE` on the four approved functions;
- sequence access required only for registration through the approved function.

The runtime role must not receive direct `INSERT`, `UPDATE`, `DELETE`, `TRUNCATE`,
`ALTER`, `DROP` or ownership of the table. `PUBLIC` receives no table or function
privileges.

## Safe application sequence

1. Create a fresh staging snapshot.
2. Open one transaction as migration owner.
3. Apply the reference migration.
4. Inspect table, indexes, constraints, function ownership and grants.
5. Revoke default/public privileges.
6. Grant the minimum runtime privileges above.
7. Commit only after the inspection passes.
8. Run negative tests without any Meta/n8n publication node connected.
9. Run two concurrent reservation transactions and prove exactly one winner.
10. Simulate process interruption after `RESERVED`; confirm the row cannot be silently reused.
11. Prove incomplete publication receipts cannot transition to `PUBLISHED`.
12. Export an evidence bundle containing PostgreSQL version, transaction isolation, migration checksum, object definitions and redacted test results.

## Required runtime canaries

- duplicate idempotency key rejected;
- active destination + visual hash duplicate rejected;
- concurrent reservation has exactly one winner;
- unknown or terminal key rejected;
- receipt without exact publication ID, HTTPS permalink, execution ID and readback rejected;
- wrong reservation execution ID rejected;
- `PUBLISHED` and `FAILED` remain terminal;
- database restart preserves rows and terminal states;
- n8n credential cannot mutate the table directly;
- denied preflight cannot reach Meta.

## Rollback decision tree

Before any external publication, rollback is allowed only in staging:

- If migration fails before commit: `ROLLBACK` the transaction.
- If migration committed but no rows exist: restore the pre-migration snapshot or remove objects manually under change control.
- If rows exist: do not drop or truncate. Disable the unpublished workflow candidate, preserve evidence, export the ledger, and restore the snapshot only after review.
- If any Meta call occurred: database rollback alone is insufficient; preserve the ledger and reconcile every external ID before further action.

No automated `DROP`, `DELETE` or `TRUNCATE` script is provided.

## n8n wiring order

1. Server-side register/lookup node.
2. Atomic reserve node.
3. Physical IF branch: only successful reservation may continue.
4. Independent Meta-auth readback.
5. Meta publication.
6. Exact post readback.
7. Atomic `PUBLISHED` write with receipt.
8. Failure path writes terminal `FAILED`.
9. Webhook response returns the persisted receipt, never client readiness flags.

The Facebook candidate stays `active:false`. The existing allowed workflow remains
`FzQQYBrgzo2wU8bm`; the banned workflow and legacy payload are never used.

## Current external capability readback

Windsor currently exposes live write actions for Instagram and Facebook Organic, but the
n8n connector account `173` exposes no executable action. Connector presence is not n8n
workflow access and is not proof of OAuth, ledger persistence or publication readiness.

## Human gate

Provision or approve the dedicated staging PostgreSQL instance and runtime credential
through official portals. Do not send secrets by message.

## Release rule

No social publisher may become active until the evidence bundle proves all preconditions,
runtime canaries, independent Meta auth and post-success atomic persistence. A repository
file or offline model alone is not PASS.
