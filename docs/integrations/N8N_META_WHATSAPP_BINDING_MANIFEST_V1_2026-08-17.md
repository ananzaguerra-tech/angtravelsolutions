# ANG Concierge — n8n + Meta/WhatsApp Binding Manifest V1

Date: 2026-08-17
Status: STAGING_BINDING_READY

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

## Required Meta binding fields
Populate only from the authenticated Meta Business / WhatsApp asset and n8n credential vault. Never commit secrets.
- META_APP_ID: PUBLIC_ID_REQUIRED
- META_WABA_ID: PUBLIC_ID_REQUIRED
- META_PHONE_NUMBER_ID: PUBLIC_ID_REQUIRED
- META_VERIFY_TOKEN: SECRET_VAULT_ONLY
- META_APP_SECRET: SECRET_VAULT_ONLY
- META_ACCESS_TOKEN: SECRET_VAULT_ONLY
- META_GRAPH_API_VERSION: VALIDATE_AT_BIND_TIME
- N8N_WEBHOOK_BASE_URL: DERIVE_FROM_EXISTING_INSTANCE

## Homologation sequence
1. Confirm existing n8n session and import/inspect the V2 workflow.
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
12. Keep workflow inactive until all staging tests pass; activate only after end-to-end proof.

## Functional separation — portal quotes vs Concierge
The consular block is mandatory in AGENT-GENERATED PORTAL QUOTES after passenger nationality and composition are defined. It must render in agent console, PDF and secure share link.

Concierge does not force the consular checklist into every chat. It retrieves/informs consular, documentation, vaccine and minor-travel requirements contextually when relevant to the conversation, quote follow-up or pre-boarding support.

## Current unresolved binding data
At the time of this manifest, the connected Drive contains the n8n instance URL and workflow-package evidence, but no retrievable public Meta WABA ID / phone number ID / app ID. These must be read from the authenticated Meta Business asset; secrets remain vault-only.
