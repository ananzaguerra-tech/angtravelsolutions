# ANG — Auditoria C373 — Bloco 19 África Central e Sahel

checked_at: 2026-11-07
status: OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING
published: false

## Escopo
Gabão, Camarões, República Centro-Africana, Chade, República Democrática do Congo, República do Congo, Guiné, Burkina Faso, Mali e Níger.
Drive: https://docs.google.com/document/d/1rObAObP6gVCEtn0CCPLe3bThdC7dCYFX-Yxird6T9f0/edit

## Dedupe
60 consultas (10 × 3 aliases × 2 abas), A1:Z1900; zero matches, unknowns e erros. Resultado `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`, não LIVE_CMS PASS.

## Classificações
- Gabão: eVisa DGDI; `PASS_DATED_RECHECK`.
- Camarões: visto online obrigatório para passaporte comum; `PASS_DATED_RECHECK`.
- República Centro-Africana: canal consular; `PASS_CHANNEL_HOLD_NATIONALITY` + `HOLD_HIGH_RISK`.
- Chade: eVisa oficial exclusiva desde 11/05/2026; `PASS_CHANNEL_HOLD_NATIONALITY` + `HOLD_HIGH_RISK`.
- RDC: eVisa/VAP oficial; `PASS_DATED_RECHECK` + `HOLD_REGIONALLY`.
- República do Congo: eVisa do Ministério do Interior; `PASS_DATED_RECHECK`.
- Guiné: eVisa PAF; `PASS_CHANNEL_HOLD_NATIONALITY`.
- Burkina Faso: eVisa e embaixada no Brasil; `PASS_DATED_RECHECK` + `HOLD_HIGH_RISK`.
- Mali: sem prova oficial turística nominal para brasileiro; `HOLD_OFFICIAL_TOURIST_ENTRY_RULE` + `HOLD_HIGH_RISK`.
- Níger: MFA exige visto salvo acordo; `PASS_DATED_RECHECK` + `HOLD_HIGH_RISK`.

## WordPress/Console
Site Active por REST, mas posts/páginas não podem ser lidos; listagens falham por `No such host is known`; home HTTP 502; `/area-restrita/` e `/acesso-ang/` inacessíveis. Nenhuma mutação ou publicação.

## Demais gates
`REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `NO_DUPLICATE_PASS=false`; `COPY_QA_PASS=false`; `CONSOLE_E2E_PASS=false`; `PUBLISHED=false`.
Gmail sem nova resposta positiva; negativa TTW de 30/10 permanece na mensagem `1a18d4c08afc1a18`.

## Rollback
Excluir o Doc `1rObAObP6gVCEtn0CCPLe3bThdC7dCYFX-Yxird6T9f0` e reverter os commits deste ciclo somente se necessário. Nenhuma mutação em produção exige rollback.

