# ANG Sint Maarten — auditoria 881/WORLD, fontes oficiais e WordPress — C362

**checked_at:** 2026-11-07T03:04:33-03:00  
**estado:** REVIEW_REQUIRED / UPLOAD_PENDING_CHANNEL / MEDIA_PENDING / NOT_PUBLISHED

## Escopo e separação jurisdicional

A unidade 04 do Bloco 12 é **Sint Maarten**, país constituinte do Reino dos Países Baixos e lado neerlandês da ilha. Não foi conflada com **Saint-Martin**, coletividade francesa e unidade 03. Philipsburg, Simpson Bay, Maho, Cupecoy, Oyster Pond e Dawn Beach permanecem como destinos editoriais prioritários.

## Reconciliação 881

Foram executadas oito buscas, combinando quatro aliases — `Sint Maarten`, `Saint Maarten`, `St Maarten` e `SXM` — com as abas `Item Register` e `WP Export Identity 24-07`, em `A1:Z1900`.

Resultado: **zero correspondências**. Classificação: `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.

Isto não constitui PASS do CMS vivo e não autoriza criar `external_id`, slug publicado ou página. `LIVE_CMS_DEDUPE_PASS=false` e `EXTERNAL_ID_DERIVATION_PASS=false`.

## Fontes oficiais revalidadas

- Turismo oficial: https://www.vacationstmaarten.com/
- Entry Form governamental: https://www.entry.sx/
- Visto: https://www.netherlandsworldwide.nl/caribbean-visa/visa-needed-caribbean
- Requisitos sem visto: https://www.netherlandsworldwide.nl/caribbean-visa/travel-without-visa
- Estrutura constitucional: https://www.government.nl/themes/government-and-democracy/caribbean-parts-of-the-kingdom/question-and-answer/what-are-the-different-parts-of-the-kingdom-of-the-netherlands
- Governo/IBPS: https://www.sintmaartengov.org/Ministries/Departments/Pages/Immigration-and-Border-Protection-Services.aspx

### Entrada para passaporte brasileiro

A fonte oficial NetherlandsWorldwide lista **Brazil** entre as nacionalidades dispensadas de visto para as partes caribenhas do Reino. A permanência geral sem visto é de até 90 dias em qualquer período de 180 dias, sujeita à decisão migratória. Passaporte: emissão há no máximo dez anos e validade durante toda a estadia. Também podem ser exigidos retorno/continuação, motivo da viagem, recursos e seguro com cobertura médica mínima oficial indicada na fonte. Trabalho requer autorização.

O formulário digital ED é exigido por viajante, inclusive transferência; deve corresponder ao documento usado na entrada. O preenchimento não garante admissão. Como o portal turístico e `entry.sx` divergem na redação sobre preenchimento prévio/check-in, a obrigação do formulário está confirmada, mas o momento operacional deve ser reconfirmado antes do embarque.

Classificação: `IMMIGRATION_NATIONALITY_PASS=PASS_DATED_RECHECK`; `ED_FORM_PASS=PASS_DATED_RECHECK`; `JURISDICTION_SEPARATION_PASS=true`.

## Turismo e segurança editorial

Maho Beach, Philipsburg/Great Bay e Simpson Bay possuem cobertura oficial atual. Em Maho, o conteúdo deve preservar alertas de segurança: seguir sinalização, não permanecer junto à cerca e considerar jet blast. Horários, transporte, eventos, tarifas, operações marítimas e disponibilidade permanecem dinâmicos e não foram promovidos como fatos permanentes.

## WordPress

- Home pública: HTTP 502.
- `/area-restrita/`: inacessível.
- WPWriter: site aparece Active, mas páginas e posts não puderam ser lidos por `No such host is known`.
- Nenhuma busca no CMS vivo, backup, correção ou publicação foi possível.
- Nenhum `post_id`, `external_id`, `publication_id` ou permalink foi produzido.

## Mídia, marca e publicação

`REAL_MEDIA_VERIFIED=false`; `MASTER_LOGO_VERIFIED=false`; `VISUAL_HASH_DEDUPE_PASS=false`; `COPY_QA_PASS=false`; `PUBLISHED=false`.

Nenhuma imagem gerada, mídia genérica, peça, post, artigo ou alteração de Google Business foi criada/publicada.

## Próxima ação segura

1. Restaurar o origin e repetir deduplicação no CMS vivo por título, slug e `external_id`.
2. Revalidar regras de entrada e ED Form imediatamente antes de cotação/embarque.
3. Somente materializar mídia após fonte, proprietário, licença/permissão e hash global.
4. Avançar para Bonaire, unidade 05 do Bloco 12, sem liberar publicação.

## Rollback

Reverter apenas os commits documentais deste ciclo. Não houve mutação em produção.
