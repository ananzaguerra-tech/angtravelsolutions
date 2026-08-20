# ANG Concierge — n8n + Meta/WhatsApp Binding Manifest V1

Date: 2026-08-17
Status: PARTIAL_META_BINDING_RECOVERED

## Existing n8n instance
- Base instance: https://ananza.app.n8n.cloud
- Known assistant path: https://ananza.app.n8n.cloud/assistant
- Rule: use this existing instance only. Do not create a parallel n8n environment.

## Workflow package
Use current staging package only:
- ANG_Concierge_n8n_WhatsApp_V2_STAGING.zip
- SHA-256: a80ce5db353bf514dd103e33bc03f3bf7d886f87767a9f0f24200939190a7673

Historical package — DO NOT use for current homologation:
- ANG_Concierge_n8n_WhatsApp_Package_2026.zip
- SHA-256: 6ff45b06d7489080cd36041211730331d3e9a68aa822397aade3b7b8e0b86742

## Target WhatsApp number — LOCKED
- Commercial display number: +55 19 4040-4293
- E.164: 551940404293
- Rule: bind only the WABA/Phone Number ID that Meta reports for this exact number. Do not attach any other WhatsApp number.

## Recovered Meta binding fields
Recovered from an official Meta developer email to the principal:
- META_APP_ID: 1357644809891558
- META_BUSINESS_ID: 844432116045484

Still required from the authenticated WhatsApp Business asset:
- META_WABA_ID: PUBLIC_ID_REQUIRED_FOR_551940404293
- META_PHONE_NUMBER_ID: PUBLIC_ID_REQUIRED_FOR_551940404293

Secrets — never commit:
- META_VERIFY_TOKEN: SECRET_VAULT_ONLY
- META_APP_SECRET: SECRET_VAULT_ONLY
- META_ACCESS_TOKEN: SECRET_VAULT_ONLY

Runtime binding:
- META_GRAPH_API_VERSION: VALIDATE_AT_BIND_TIME
- N8N_WEBHOOK_BASE_URL: DERIVE_FROM_EXISTING_INSTANCE

## Meta mobile evidence — 2026-08-17
Authenticated mobile screenshots supplied by the principal prove the following negative/guardrail facts:
- WhatsApp Manager displayed `+1 555-651-7727` as `Test Number` with Phone Number ID `1273314619199420`.
- `1273314619199420` is explicitly REJECTED for ANG production/staging binding because it belongs to the Meta test number, not E.164 `551940404293`.
- Events Manager displayed dataset/app-style identifiers including `2939936939689516`; these are NOT acceptable substitutes for WABA ID or the Phone Number ID of `551940404293`.
- A candidate public ID `1018409424352547` was supplied separately, but its field label was not visible; therefore it remains UNCLASSIFIED and must not be bound as WABA ID or Phone Number ID until the authenticated Meta screen shows the exact label.

Hard reject list for automated/manual review:
- REJECT_PHONE_NUMBER_ID: 1273314619199420
- REJECT_EVENT_DATASET_OR_APP_ID: 2939936939689516
- UNCLASSIFIED_META_PUBLIC_ID: 1018409424352547

Acceptance rule:
- `META_PHONE_NUMBER_ID` is accepted only when the same authenticated WhatsApp Manager screen shows `+55 19 4040-4293` / `551940404293` and the exact label `Phone Number ID` / `Identificação do número de telefone`.
- `META_WABA_ID` is accepted only when the authenticated WhatsApp Business Account screen shows the exact label `WhatsApp Business Account ID` / equivalent Meta label.

## Homologation sequence
1. Confirm existing n8n session and inspect the V2 workflow.
2. Associate Error Workflow.
3. Map credentials in n8n vault only.
4. Enable raw request body where required for Meta HMAC validation.
5. Configure GET webhook verification for Meta challenge.
6. Configure POST inbound events and HMAC SHA-256 validation.
7. Validate ACK timing, complete arrays/batches, malformed JSON handling and retries.
8. Validate idempotency by WhatsApp `wamid` for 48h.
9. Validate consent state, minimised retention and human handoff.
10. Connect inbound message -> Concierge -> contextual consular support when relevant -> Zeus lead/handoff.
11. Validate outbound WhatsApp response through Graph API.
12. Activate only after end-to-end proof.

## Functional separation — portal quotes vs Concierge
The consular block is mandatory in AGENT-GENERATED PORTAL QUOTES after passenger nationality and composition are defined. It must render in agent console, PDF and secure share link.

Concierge does not force the consular checklist into every chat. It retrieves/informs consular, documentation, vaccine and minor-travel requirements contextually when relevant to the conversation, quote follow-up or pre-boarding support.

## Current unresolved binding data
WABA ID and Phone Number ID for E.164 551940404293 are the remaining public identifiers required to complete the Meta/WhatsApp binding. They must be read from the authenticated WhatsApp Business asset. Secrets remain vault-only.

## Current execution evidence
- Gmail search for WABA_ID / PHONE_NUMBER_ID / WhatsApp Business Account / 551940404293 returned no usable Meta asset identifiers.
- Google Drive search for the same identifiers returned no result.
- Mobile Meta evidence identified a test-number Phone Number ID and Events Manager IDs that must not be used for ANG.
- Repository manifest contains no guessed identifiers; only App ID and Meta Business ID are confirmed.
- End-to-end homologation must remain NOT PASSED until the authenticated Meta asset and n8n session expose the two correct public IDs and vault-only credentials.
