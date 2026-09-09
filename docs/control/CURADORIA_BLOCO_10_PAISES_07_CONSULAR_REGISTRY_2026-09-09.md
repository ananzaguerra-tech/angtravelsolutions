# ANG Curadoria — Bloco 07 — registro consular oficial

- checked_at: 2026-09-09
- escopo: exatamente 10 países
- regra: resultado parametrizado por nacionalidade, passaporte, trânsito, finalidade e duração
- estado: CONSULAR_DYNAMIC_QA / REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL

| País | Portal oficial | Acesso | Nota segura para atualização |
|---|---|---|---|
| Reino Unido | https://www.gov.uk/check-uk-visa | PASS | A exigência de visto ou ETA depende da nacionalidade; usar o verificador oficial. |
| Luxemburgo | https://guichet.public.lu/en/citoyens/immigration.html | DEGRADED_TIMEOUT | Não consolidar regra até nova abertura; separar Schengen, nacionalidade e duração. |
| China | https://en.nia.gov.cn/ | PASS | Portal contém políticas regionais de entrada e trânsito; checar nacionalidade e porto elegível. |
| Camboja | https://www.evisa.gov.kh/ | DEGRADED_REDIRECT_LOOP | Não inferir elegibilidade ou fronteira de entrada sem revalidação. |
| Laos | https://laoevisa.gov.la/ | PASS | Portal oficial oferece fluxo eVisa e consulta por elegibilidade/documentos; validar nacionalidade. |
| Nepal | https://www.immigration.gov.np/ | DEGRADED_HTTP_502 | Não inferir visa on arrival; revalidar antes da promoção. |
| Butão | https://www.doi.gov.bt/ | PASS | Portal oficial dispõe de entrada, turista e sistema online; mudanças operacionais de 2026 exigem leitura específica. |
| Jordânia | https://moi.gov.jo/ | DEGRADED_TIMEOUT | Não inferir visa on arrival ou Jordan Pass como autorização migratória. |
| Omã | https://evisa.rop.gov.om/ | PASS | Portal oficial permite identificar tipo e solicitar eVisa; elegibilidade é parametrizada. |
| Arábia Saudita | https://visa.visitsaudi.com/ | PASS | Portal lista 66 nacionalidades elegíveis; Brasil não apareceu na lista observada em 2026-09-09, portanto não atribuir eVisa a passaporte brasileiro sem confirmação oficial adicional. |

## Delta material

- 6/10 portais consulares abriram integralmente.
- 4/10 permaneceram degradados: Luxemburgo, Camboja, Nepal e Jordânia.
- Reino Unido confirma que visto/ETA depende de nacionalidade.
- China contém políticas específicas de trânsito/entrada, não uma regra universal.
- Arábia Saudita lista 66 países elegíveis para eVisa; a ausência do Brasil na lista observada requer orientação fail-closed para passaporte brasileiro.

## Não feito

Nenhuma solicitação de visto, pagamento, login, aceite jurídico, publicação CMS/social/GBP ou mutação 881/WORLD foi executada.

## Próxima ação

Revalidar os quatro portais degradados, cruzar passaporte brasileiro com missão diplomática oficial quando necessário e atualizar apenas fatos confirmados.

## Rollback

Reverter este commit; não existe efeito em produção.
