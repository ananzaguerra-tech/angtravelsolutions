# C377 — Bloco 23 Europa Schengen central, adriática e ocidental

## Resultado verificável

- Bloco editorial criado: 10 países, 160 eixos, SEO/schema/CTA, fontes oficiais e `checked_at=2026-11-07`.
- Documento Drive: https://docs.google.com/document/d/1-6v0B_AnXGVyGo9Z_VOzmcbSDJJDvNp3OG-mRY0dU3E/edit
- Readback Drive: 10 unidades, 160 eixos, 11 ocorrências de `PUBLISHED=false`.
- Dedupe 881: 60 consultas; 8 hits brutos, todos falsos positivos; zero correspondências canônicas; `truncated=false`; nenhum write.
- Falsos positivos `AUT` revelaram sete módulos de hotelaria de Lisboa já existentes: preservar/reconciliar e não recriar.
- Nenhuma publicação, mídia, logo, anúncio ou mutação de produção.

## Entrada e fontes oficiais

Os dez países seguem o acordo UE–Brasil de curta estada: até 90 dias em qualquer período de 180 dias para turismo, trânsito e negócios, sem atividade remunerada. EES plenamente operacional desde 10/04/2026; ETIAS ainda não operacional e sem pedidos.

| País | Estado | Fonte oficial |
|---|---|---|
| Polônia | `PASS_DATED_RECHECK` | https://www.gov.pl/web/brasil/vistos--informacao-geral |
| Chéquia | `PASS_DATED_RECHECK` | https://mzv.gov.cz/jnp/en/information_for_aliens/short_stay_visa/list_of_states_whose_citizens_are_exempt/index%242548.html?action=setMonth&month=5&year=2026 |
| Hungria | `PASS_DATED_RECHECK` | https://brasilia.mfa.gov.hu/pt_BR/vizum |
| Eslovênia | `PASS_DATED_RECHECK` | https://www.gov.si/en/countries/brazil/for-citizens-of-brazil/ |
| Croácia | `PASS_DATED_RECHECK` | https://mvep.gov.hr/en/services-for-citizens/consular-information-22802/visas-22807/visa-requirements-overview-22879/22879?country=18 |
| Grécia | `PASS_DATED_RECHECK` | https://www.mfa.gr/en/services/visas-for-foreigners-traveling-to-greece/countries-requiring-or-not-requiring-a-visa/ |
| Portugal | `PASS_DATED_RECHECK` | https://www.gov.pt/servicos/pedir-um-visto-schengen-de-curta-duracao |
| Espanha | `PASS_DATED_RECHECK` | https://www.exteriores.gob.es/Consulados/saopaulo/es/ServiciosConsulares/Paginas/index.aspx?scca=Visados&scco=Brasil&scd=263&scs=Visado+de+estancia+%28visado+Schengen%29 |
| Alemanha | `PASS_DATED_RECHECK` | https://brasil.diplo.de/br-pt/servicos/visto/brasil-2753490 |
| Áustria | `PASS_DATED_RECHECK` | https://www.bmeia.gv.at/br/embaixada-da-austria-em-brasilia/viajar-para-austria/entrada-e-residencia/visto |

Fontes transversais: https://www.consilium.europa.eu/en/documents/treaties-agreements/agreement/?doclanguage=en&id=2018053 ; https://travel-europe.europa.eu/en/ees/faq ; https://travel-europe.europa.eu/pt/etias/faq.

## WordPress/site P0 e Console

- Home: HTTP 502 Bad Gateway.
- `/area-restrita/`, `/acesso-ang/` e `/wp-json/`: inacessíveis.
- WPWriter `6445b831-8563-4c9a-8f58-fb8bec94af13`: `Active/rest_api`, mas páginas/posts indisponíveis.
- `list_pages` e `list_posts`: `WordPress connection failed: No such host is known`.
- P0, redirect, RBAC, módulos e cotação ponta a ponta permanecem `HOLD`.
- Rollback WordPress: N/A; nenhuma mutação.

## Gmail/parcerias

- Accor: nenhuma nova mensagem em 14 dias; interesse histórico sem autorização de co-marketing/mídia/logos.
- Club Med: follow-up `1a18d218af72d68d`, sem resposta inbound; `HOLD`.
- TTW/Guilherme: negativa explícita `1a18d4c08afc1a18`; encerrar sem insistência.
- Il Borro/Simone: follow-ups `1a18d21b8d9bf23a`, `1a1887a37ce6a2aa` e `1a1887c825214c22`; zero resposta/autorização; post/artigo `HOLD`.

## Biblioteca/Drive, Il Borro e Miami Beach

- Biblioteca confirmou o rascunho `ANG_IL_BORRO_CELEBRATIONS_BLOG_DRAFT_2026-09-12.md`, Library ID `libfile_608e7e1f0af48191b766e3c1c37c20a1`, status declarado `READY_REVIEW — não publicar até confirmação de direitos de mídia/co-marketing`.
- Busca Drive por `Il Borro Destination Wedding` não retornou ativo com licença ou autorização rastreável.
- Busca Drive por `Miami Beach hotels video` retornou apenas documentos genéricos de curadoria/relatório; não comprova vídeos oficiais licenciados dos 12 hotéis.
- `REAL_MEDIA_VERIFIED=false`; não criar cortes, artigo ou publicação.
- A pesquisa histórica localizada inclui referências `source.unsplash.com`; elas não atendem à regra definitiva de licença/autorização e não devem ser publicadas.

## Gates

`LIVE_CMS_DEDUPE_PASS=false`; `EXTERNAL_ID_DERIVATION_PASS=false`; `REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `NO_DUPLICATE_PASS=false`; `COPY_QA_PASS=false`; `CONSOLE_E2E_PASS=false`; `PUBLISHED=false`.

## Rollback

- Excluir o documento Drive `1-6v0B_AnXGVyGo9Z_VOzmcbSDJJDvNp3OG-mRY0dU3E` somente se o Bloco 23 precisar ser desfeito.
- Reverter os commits deste recibo e desta auditoria após captura dos SHAs.
- Nenhuma mutação em produção requer rollback.
