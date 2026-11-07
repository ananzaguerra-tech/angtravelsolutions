# ANG Bloco 14 — Pacífico, fontes oficiais e WordPress — C368

- checked_at: `2026-11-07T09:02:10-03:00`
- estado: `REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL / MEDIA_PENDING`
- Drive: https://docs.google.com/document/d/1R9Y7Yd2sq-Dwkz06RuGDqD0iV_CvKOy3ddFY8qExvsA/edit
- publicação: `NONE`

## Continuidade sem reinício

O mestre v79 mostrou que **Guiana Francesa já foi reconciliada no C348**. Para não reiniciar frente concluída, o ciclo fechou o Bloco 12 por conciliação histórica e avançou ao primeiro bloco ainda inexistente: Bloco 14.

## Produção do bloco

Documento novo com 10 unidades e 160 eixos estruturais:

1. Kiribati
2. Nauru
3. Tuvalu
4. Palau
5. Estados Federados da Micronésia
6. Ilhas Marshall
7. Ilhas Marianas do Norte
8. Samoa Americana
9. Tokelau
10. Wallis e Futuna

Cada unidade contém visão editorial, destinos, dados essenciais, clima, entrada, saúde, logística, atrações, gastronomia, hotelaria, experiências, impacto, CTA, SEO/canonical/schema, fontes com `checked_at` e manifesto de mídia fail-closed.

## Reconciliação 881

Foram realizadas 60 buscas — três aliases por unidade em duas abas — no intervalo `A1:Z1900`. Resultado: zero correspondências em todas as dez unidades.

Conclusão limitada: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`. Nenhum registro foi criado e nenhum `external_id` foi derivado. O CMS vivo permanece obrigatório antes de qualquer upload.

## Regras dinâmicas registradas

- **Kiribati:** passaporte com seis meses além da saída, retorno/continuação e fundos; matriz de isenção por nacionalidade deve ser confirmada.
- **Nauru:** solicitação prévia/Visitor Visa; nenhum benefício para passaporte brasileiro foi presumido.
- **Tuvalu:** detalhe oficial de imigração ficou degradado; visto e permanência permanecem `HOLD_RECHECK`.
- **Palau:** formulário eletrônico e possível pre-clearance por país; aplicabilidade ao Brasil ficou `HOLD_COUNTRY_PRECLEARANCE`.
- **Micronésia:** visita curta de até 30 dias sem permit prévio segundo fontes oficiais, com validação documental e finalidade.
- **Ilhas Marshall:** passaporte, retorno, fundos e matriz nacionalidade/visto; Brasil ficou `HOLD_NATIONALITY_MATRIX`.
- **Marianas do Norte:** regras migratórias dos EUA/G-CNMI ETA; passaporte brasileiro ficou `HOLD_US_CREDENTIAL`.
- **Samoa Americana:** visitor permit com antecedência mínima operacional; categoria brasileira ficou `HOLD_PERMIT_CATEGORY`.
- **Tokelau:** entry permit e aprovação da aldeia; acesso somente marítimo via Samoa.
- **Wallis e Futuna:** território fora de Schengen; fonte estatal lista brasileiros como dispensados de visto de curta estada, ressalvadas certas atividades remuneradas.

## Fontes oficiais principais

- Kiribati Immigration: https://immigration.mfai.gov.ki/visas-entry/
- Nauru Immigration: https://justice.gov.nr/immigration-division/
- Tuvalu Tourism/Government: https://timelesstuvalu.com/ e https://www.tuvalu.gov.tv/
- Palau Immigration: https://bcbp.pw/?page_id=165
- FSM Immigration: https://immi-gov.fm/faq.php
- RMI Immigration: https://rmiimmigration.org/visit-rmi-visa-entry/
- Marianas Visitors Authority: https://www.mymarianas.com/visitor-information/
- American Samoa: https://www.visitamericansamoa.org/entry-requirements e https://legalaffairs.as.gov/visa-entry
- Tokelau Government: https://www.tokelau.org.nz/Tokelau%2BGovernment/Visiting%2BTokelau/FAQs.html
- Wallis et Futuna: https://www.wallis-et-futuna.gouv.fr/Demarches/Entree-et-sejour-des-etrangers

## WordPress P0

- WPWriter: `Active`, mas sem contagem de posts/páginas.
- Listagem de páginas/posts: `No such host is known`.
- Home pública: HTTP 502.
- `/area-restrita/`: inacessível.
- Resultado: `WORDPRESS_ORIGIN_UNREACHABLE`; nenhuma edição ou publicação.

## Parcerias, mídia e publicação

Gmail não mostrou nova resposta positiva qualificável; permanece apenas a negativa TTW de 30/10, mensagem `1a18d4c08afc1a18`.

Nenhuma mídia foi utilizada. `REAL_MEDIA_VERIFIED=false`, `MASTER_LOGO_VERIFIED=false`, `VISUAL_HASH_DEDUPE_PASS=false`, `COPY_QA_PASS=false` e `PUBLISHED=false`.

## Rollback

Reverter os commits deste recibo/auditoria e excluir o documento Drive do Bloco 14 somente se o bloco precisar ser desfeito. Nenhuma mutação em produção ocorreu.
