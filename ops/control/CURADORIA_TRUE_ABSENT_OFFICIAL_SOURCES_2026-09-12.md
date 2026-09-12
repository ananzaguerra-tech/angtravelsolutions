# Curadoria — True Absent Official Sources — 2026-09-12

Publication policy: FAIL-CLOSED. Este manifesto não autoriza publicação; registra somente fontes oficiais verificadas para o sublote soberano realmente ausente.

## Kiribati
Status: FACT_QA_PASS / PUBLICATION_BLOCKED
- Immigration / visa: https://www.mfa.gov.ki/visa/
- Immigration authority: https://www.mfa.gov.ki/immigration/
- Official tourism: https://kiribatitourism.gov.ki/
- Editorial baseline: cultura, pesca, história, ilhas e áreas marinhas podem ser estruturadas a partir da autoridade oficial de turismo.
- Dynamic entry rules: revalidar no momento da publicação/cotação.

## Nauru / Naoero
Status: FACT_QA_PASS / PUBLICATION_BLOCKED
- Government visiting information: https://www.nauru.gov.nr/about-naoero/visiting-naoero.aspx
- Government Information Office: https://www.nauru.gov.nr/government-information-office/
- Government Gazette: https://www.nauru.gov.nr/government-information-office/government-gazette.aspx
- Immigration/visa facts must remain tied to current government guidance.

## Tuvalu
Status: FACT_QA_PARTIAL / PUBLICATION_BLOCKED
- Government Tourism Department: https://tourism.gov.tv/
- Government tourism contact: https://tourism.gov.tv/contact/
- Tourism portal is owned/operated by the Government of Tuvalu and managed by the competent ministry.
- Immigration/entry source still required before FACT_QA_PASS.

## Libya
Status: RESTRICTED_QA / PUBLICATION_BLOCKED
- No commercial promotion.
- Safety and entry guidance requires separate revalidation before any editorial release.

## Required gates before staging/publication
1. canonical identity + alias dedupe;
2. real/licensed media manifest + hash;
3. SEO/schema package;
4. dynamic facts checked_at timestamp;
5. staging QA;
6. only then change publication_gate from BLOCK.
