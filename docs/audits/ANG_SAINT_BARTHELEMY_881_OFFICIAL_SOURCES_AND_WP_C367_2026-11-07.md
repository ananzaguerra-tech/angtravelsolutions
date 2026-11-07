# ANG Saint-Barthélemy — 881/WORLD, fontes oficiais e WordPress — C367

- checked_at: `2026-11-07T07:57:06-03:00`
- unidade: Bloco 12, unidade 09
- status editorial: `REVIEW_REQUIRED`
- publicação: `HOLD`

## Reconciliação 881

Foram executadas oito buscas exatas/por alias — `Saint-Barthélemy`, `Saint Barthelemy`, `St Barth` e `St. Barts` — nas abas `Item Register` e `WP Export Identity 24-07`, intervalo `A1:Z1900`. Resultado: zero correspondências.

Conclusão limitada: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`. Isso não autoriza criar registro, derivar `external_id` nem marcar dedupe do CMS vivo como PASS.

## Expansão editorial proposta

- **Gustavia:** porto, patrimônio urbano, gastronomia e conexão marítima.
- **Saint-Jean:** praia, acesso ao aeroporto e eixo de hospedagem.
- **Colombier:** trilha/acesso marítimo e paisagem protegida.
- **Grand Cul-de-Sac:** lagoa, esportes aquáticos e estadias de natureza.
- **Grande Saline:** praia e experiência de baixo impacto, sujeita a condições locais.
- **Lorient:** praia, comunidade e roteiro costeiro.

### SEO/schema/CTA — rascunho, não publicado

- SEO title: `Saint-Barthélemy: guia de Gustavia, praias e conexões`
- Meta description: `Descubra Gustavia, Saint-Jean, Colombier, Grand Cul-de-Sac, Saline e Lorient com orientação de acesso e documentação sujeita à checagem.`
- Schema proposto: `TouristDestination` + `ItemList`, sem inserir horários, tarifas ou regras migratórias como valores permanentes.
- CTA: `Solicite uma curadoria personalizada para Saint-Barthélemy`.
- Estado: `READY_REVIEW=false` enquanto mídia, master, não repetição e copy QA não forem provados.

## Fatos oficiais e classificação

1. A página oficial de turismo informa pista do aeroporto Rémy-de-Haenen com 650 m x 18 m, abertura usual às 7h e fechamento 15 minutos após o pôr do sol. Como operação muda, classificado `AIRPORT_OPERATION=HOLD_RECHECK`.
2. O destino não recebe voos long-haul diretos; os acessos usuais são por conexões regionais ou ferry, inclusive via SXM, PTP, ANU e SJU. Horários e operadores ficam `TRANSPORT_SCHEDULE_PASS=HOLD_RECHECK`.
3. Saint-Barthélemy não integra o Espaço Schengen; visto Schengen comum não deve ser tratado automaticamente como autorização territorial.
4. A legislação francesa vigente lista **Brésil** entre as nacionalidades dispensadas de visto para estadas de até 90 dias em 180 dias em Saint-Barthélemy/Saint-Martin, com ressalva específica para certas atividades remuneradas sem autorização de trabalho. Classificação: `BRAZIL_SHORT_STAY_VISA_EXEMPTION=PASS_DATED_RECHECK`; finalidade, passaporte e conexão devem ser validados antes da operação.
5. Passaporte válido e eventuais formalidades de trânsito — especialmente Sint Maarten — devem ser checados por rota. Formulários e requisitos operacionais ficam `ENTRY_TRANSIT_FORM=HOLD_RECHECK`.

## Fontes

- Turismo oficial / viagem: https://www.saintbarth-tourisme.com/fr/travel
- Gustavia: https://www.saintbarth-tourisme.com/fr/discover/gustavia
- Colombier: https://www.saintbarth-tourisme.com/fr/discover/colombier
- Grande Saline: https://www.saintbarth-tourisme.com/fr/discover/saline
- Grand Cul-de-Sac: https://www.saintbarth-tourisme.com/fr/discover/grand-cul-de-sac
- Légifrance, arrêté de 18/04/2012: https://www.legifrance.gouv.fr/loda/id/JORFTEXT000025746952/
- Légifrance, Annexe II vigente: https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000051759455/
- France-Visas, curto prazo/territórios não europeus: https://www.france-visas.gouv.fr/visa-de-court-sejour

## WordPress P0

- Conector WPWriter: `Active` por REST.
- Listagens de páginas/posts: falha `No such host is known`.
- Home pública: HTTP 502.
- `/area-restrita/`: inacessível no teste externo.
- Resultado: `WORDPRESS_ORIGIN_UNREACHABLE`; nenhuma edição, publicação ou retirada de manutenção.

## Controles de mídia e publicação

Nenhuma mídia foi usada. Não existem evidências suficientes de `REAL_MEDIA_VERIFIED`, `MASTER_LOGO_VERIFIED`, `NO_DUPLICATE_PASS` ou `COPY_QA_PASS`. Nenhuma publicação em WordPress, Meta, Facebook, Instagram ou Google Business foi executada.

## Rollback

Reverter apenas os commits deste recibo e desta auditoria. Não houve mutação em produção.
