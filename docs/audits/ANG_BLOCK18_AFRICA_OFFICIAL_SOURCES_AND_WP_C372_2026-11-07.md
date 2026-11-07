# ANG — Auditoria C372 — Bloco 18 África

checked_at: 2026-11-07
status: OFFLINE_RECONCILIATION_COMPLETE_LIVE_GATES_PENDING
published: false

## Escopo
Burundi, Djibuti, Eritreia, Somália, Sudão, Sudão do Sul, Guiné-Bissau, Guiné Equatorial, Togo e Benim.
Drive: https://docs.google.com/document/d/1vDy5I_gQKMvW9KFSOSTh5kXIOqAvYbHR6ykCSFauEyQ/edit

## Dedupe
60 consultas (10 × 3 aliases × 2 abas), A1:Z1900; zero matches, unknowns e erros. Resultado `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`, não LIVE_CMS PASS.

## Classificações
- Burundi: `PASS_DATED_RECHECK`; https://tourisme.gov.bi/en/visa_/ ; https://migration.gov.bi/Apply/
- Djibuti: `PASS_DATED_RECHECK`; https://www.evisa.gouv.dj/
- Eritreia: `HOLD_OFFICIAL_ENTRY_RULE`; https://us.embassyeritrea.org/tourism/
- Somália: eTAS oficial; `HOLD_HIGH_RISK`; https://www.immigration.gov.so/news/somalia-launches-e-visa-etas-system
- Sudão: `HOLD_OFFICIAL_TOURIST_CHANNEL` + `HOLD_HIGH_RISK`; https://sudanembassy.org/entry-visa/
- Sudão do Sul: `PASS_CHANNEL_HOLD_NATIONALITY`; https://immigration.eservices.gov.ss/
- Guiné-Bissau: `HOLD_OFFICIAL_NATIONALITY_RULE`.
- Guiné Equatorial: `PASS_DATED_RECHECK`; https://www.gequatorial.org.br/visto.php
- Togo: `PASS_CHANNEL_HOLD_NATIONALITY`; https://voyage.gouv.tg/faq
- Benim: `PASS_CHANNEL_HOLD_NATIONALITY`; https://evisa.bj/

## WordPress/Console
Site Active por REST, mas posts/páginas não podem ser lidos; listagens falham por `No such host is known`; home HTTP 502; `/area-restrita/` e `/acesso-ang/` inacessíveis. Nenhuma mutação ou publicação.

## Demais gates
`REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `NO_DUPLICATE_PASS=false`; `COPY_QA_PASS=false`; `CONSOLE_E2E_PASS=false`; `PUBLISHED=false`.
Gmail sem nova resposta positiva; negativa TTW de 30/10 permanece na mensagem `1a18d4c08afc1a18`.

## Rollback
Excluir o Doc `1vDy5I_gQKMvW9KFSOSTh5kXIOqAvYbHR6ykCSFauEyQ` e reverter os commits deste ciclo somente se necessário. Nenhuma mutação em produção exige rollback.
