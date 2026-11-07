# ANG Bonaire — auditoria 881/WORLD, fontes oficiais e WordPress — C363

**checked_at:** 2026-11-07T03:58:51-03:00  
**estado:** REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL / MEDIA_PENDING / NOT_PUBLISHED

## Escopo

Bonaire é a unidade 05 do Bloco 12. Kralendijk, Rincon, Lac Bay, Washington Slagbaai, Klein Bonaire e costa sul permanecem como eixos editoriais. SEO proposto e schema continuam rascunho: `/destinos/bonaire/`, `TravelAgency+TouristDestination+FAQPage`, sem canonical publicado.

## Reconciliação 881

Oito buscas combinaram `Bonaire`, `Bonaire Island`, `Boneiru` e `BON` com `Item Register` e `WP Export Identity 24-07`, intervalo `A1:Z1900`.

Resultado: **zero correspondências** — `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.

Isto não constitui PASS do CMS vivo e não autoriza criar `external_id`, slug publicado ou página. `LIVE_CMS_DEDUPE_PASS=false`; `EXTERNAL_ID_DERIVATION_PASS=false`.

## Fontes oficiais revalidadas

- Turismo oficial: https://www.tourismbonaire.com/home
- Imigração Caribe Neerlandês: https://english.rijksdienstcn.com/immigration-naturalisation/tourist-stay
- Visto: https://www.netherlandsworldwide.nl/caribbean-visa/visa-needed-caribbean
- Requisitos sem visto: https://www.netherlandsworldwide.nl/caribbean-visa/travel-without-visa
- Visitor Entry Tax: https://bonairegov.com/en/products-and-services/nature-and-environment/visitor-entry-tax
- Pagamento oficial: https://tourismtax.bonairegov.com/

## Entrada para passaporte brasileiro

NetherlandsWorldwide lista **Brazil** entre as nacionalidades dispensadas de visto para Bonaire e demais partes caribenhas do Reino. A regra geral para outras nacionalidades admitidas é até 90 dias em qualquer período de 180 dias, sujeita a redução pela autoridade de fronteira.

Requisitos registrados: passaporte emitido há no máximo dez anos e válido durante toda a estadia, prova de retorno/continuação, motivo da viagem, recursos suficientes e seguro médico/viagem conforme critérios oficiais. Trabalho exige autorização. A admissão final não é garantida.

Classificação: `IMMIGRATION_NATIONALITY_PASS=PASS_DATED_RECHECK`.

## Visitor Entry Tax e Nature Fee

O governo de Bonaire informa Visitor Entry Tax de USD 75 por não residente, com condições reduzidas específicas, QR válido por um mês e pagamento online no domínio oficial até sete dias antes. Cruzeiristas possuem regra própria. A fonte adverte contra revendedores.

O portal turístico oficial registra Nature Tag para atividades aquáticas. Valor, elegibilidade e operação devem ser verificados diretamente no canal oficial antes de vender.

Classificação: `VISITOR_ENTRY_TAX_PASS=PASS_DATED_RECHECK`; `NATURE_FEE_PASS=PASS_DATED_RECHECK`.

## Turismo e conteúdo editorial

O portal oficial confirma mergulho, praias, atividades aquáticas e natureza; Kralendijk, Rincon, Klein Bonaire, Lac Bay e Washington Slagbaai permanecem na estrutura. Horários, taxas, condições de acesso, parque, mar, vento e disponibilidade não foram promovidos como permanentes.

## WordPress

- Home: HTTP 502.
- `/area-restrita/`: inacessível.
- WPWriter: site Active, mas páginas e posts indisponíveis por `No such host is known`.
- Nenhum backup, readback, correção, publicação, `post_id`, `external_id`, `publication_id` ou permalink.

## Mídia, marca e publicação

`REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `VISUAL_HASH_DEDUPE_PASS=false`; `COPY_QA_PASS=false`; `PUBLISHED=false`.

Nenhuma imagem gerada, mídia genérica, peça, post, artigo ou alteração em Google Business foi criada/publicada.

## Próxima ação

1. Restaurar origin e repetir deduplicação no CMS vivo.
2. Revalidar visto, Visitor Entry Tax e Nature Fee imediatamente antes de cotação/embarque.
3. Materializar mídia somente com fonte, proprietário, licença/permissão e hash global.
4. Avançar para Saba, unidade 06 do Bloco 12.

## Rollback

Reverter apenas os commits documentais C363. Não houve mutação em produção.
