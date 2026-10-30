# ANG SOCIAL — CHANNEL SCOPE AND POST-PUBLICATION READBACK — C307 — 2026-10-30

Status: STATIC_GUARD_PASS / INSTAGRAM_ONLY / FACEBOOK_HOLD / IMPORT_INACTIVE / NO_PUBLISH

## Executed

The inactive staging executor now requires an explicit `channels` field and supports exactly `instagram`. Empty, ambiguous or unsupported channel scopes return `UNSUPPORTED_OR_AMBIGUOUS_PUBLICATION_CHANNEL` before any Meta request.

The current executor is now explicitly documented as Instagram-only. Page ID `353450855530042` is used only to verify and discover the linked Instagram Business account. It does not perform or prove a Facebook publication. Facebook remains `HOLD_FACEBOOK_PUBLISHER_NOT_IMPLEMENTED`.

After an Instagram media publish response, the executor now reads the exact returned media ID from Graph API and requires:

- exact ID match;
- HTTPS permalink;
- `readback_verified=true`;
- `publication_id`, permalink and n8n `execution_id`.

Without that proof it returns `HOLD_POST_PUBLICATION_READBACK_FAILED` and must not mark the item `PUBLISHED`.

## Evidence

- Guard commit: `9733418e61aa9015cf50ffeea28854e8cd921dc4`
- Guard blob: `05c5a5c166fad99da6ea44fd90ed8c94f9c42b4b`
- Policy commit: `dd93ee9ce33f999752b2041a902afb02bcf54064`
- Policy blob: `49941483646348d90229b9d6e943abfb89ac5c4c`
- Validator commit: `919b08ac1f66a1740141ab606ee15d0c986f019d`
- Validator blob: `7e3b4db716644668d806e876a4bc668c17724f8f`
- Static readback: 27/27 controls PASS.
- Gmail: zero received results in the partnership/n8n/WhatsApp query window.
- Drive: zero results for `ANG STATUS LIVE C306 C307`.
- Library master observed at version 17 before this checkpoint.

## Not executed

No workflow import or execution, Meta request, publication, deletion, WordPress or Google Business mutation occurred. No Facebook publisher was created or claimed.

## Remaining blocks

- `HOLD_FACEBOOK_PUBLISHER_NOT_IMPLEMENTED`.
- `DURABLE_IDEMPOTENCY_LEDGER_NOT_IMPLEMENTED`.
- `POST_SUCCESS_ATOMIC_LEDGER_WRITE_NOT_PROVEN`.
- `REMOTE_CI_RUN_NOT_PROVEN`.
- `META_ORGANIC_AUTH_READBACK_MISSING`.
- `INCORRECT_POST_DELETE_NOT_PROVEN`.
- `MEDIA_LICENSE_MASTER_AUTH_PENDING`.
- `N8N_SERVICE_OAUTH_HUMAN_GATE`.

## Minimum human action

Regularize n8n and complete Meta OAuth in official portals. No publishing canary is authorized. After authentication, run only negative tests for unsupported `facebook` channel scope and missing readback prerequisites; both must HOLD.

## Next action

Design a dedicated Facebook canonical-page publisher that targets only Page ID `353450855530042`, uses the same provenance/idempotency gates, requires real licensed media, returns the exact Facebook post ID/permalink/execution ID and performs authenticated post-publication readback. Keep both publishers inactive until durable idempotency and channel-auth proofs exist.

## Rollback

Revert, in reverse order, the audit commit, `919b08ac1f66a1740141ab606ee15d0c986f019d`, `dd93ee9ce33f999752b2041a902afb02bcf54064` and `9733418e61aa9015cf50ffeea28854e8cd921dc4`. No external state requires rollback.
