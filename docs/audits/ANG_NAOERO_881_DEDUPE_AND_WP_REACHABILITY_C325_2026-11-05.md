# ANG Curadoria — C325 — Naoero 881/WORLD offline dedupe + WordPress reachability incident

**Checked at:** 2026-11-05 14:03 BRT  
**Status:** `CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH / LIVE_CMS_UNAVAILABLE / NO_PUBLISH`

## EXECUTADO

- Relatório Mestre relido na Biblioteca: versão 36.
- Gmail consultado para Accor, Club Med, TTW/Guilherme Valle e Il Borro/Simone Pampaloni.
- Drive pesquisado por STATUS LIVE e checkpoint novo; nenhum STATUS LIVE recente foi localizado.
- Localizada a planilha canônica `ANG_CONTROLE_IMPORTACAO_AMPLIADA_881_2026-08-14`.
- Pesquisados `Naoero`, `Nauru`, `Republic of Nauru` e `NRU` em:
  - `Item Register!A1:P900`;
  - `WP Export Identity 24-07!A1:H900`.
- As oito buscas retornaram zero linhas correspondentes.
- Tentada retomada da correção semântica da Área Restrita, página 2109.
- WPVibe retornou `unreachable`; WPWriter retornou `No such host is known`; a página pública/home respondeu HTTP 503.
- Criado recibo estruturado de deduplicação parcial, sem promover PASS canônico ou criar identidade CMS.

## EVIDÊNCIA / URL / ID / COMMIT

- Planilha 881: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg/edit
- Recibo: `ops/control/ANG_NAOERO_881_OFFLINE_DEDUPE_RECEIPT_C325_2026-11-05.json`.
- Commit do recibo: `513eb761c6c226b921a0f52493314bc2816b3225`.
- Candidato-fonte: `ops/curadoria/candidates/ANG_CURADORIA_NAOERO_C324_2026-10-31.json`.
- Página WordPress pendente: ID `2109`, rota `/area-restrita/`.
- Nenhum post_id, external_id, publication_id ou permalink foi criado para Naoero.

## PARCERIAS / GMAIL

- Nenhuma nova resposta positiva.
- TTW permanece `DECLINED_CURRENTLY` pela resposta de 30/10/2026.
- Club Med e Il Borro: somente mensagens enviadas pela ANG, sem autorização recebida.
- Accor: nenhuma nova autorização de co-marketing, mídia ou logos.
- Nenhuma publicação institucional ou social de parceria foi autorizada.

## NÃO FEITO / MOTIVO

- O texto “módulos já publicados e validados” da página 2109 não foi alterado porque o origin/DNS WordPress não estava alcançável.
- Não foi feita escrita por SQL, arquivo, bypass ou reconexão destrutiva.
- O zero-match do CMS vivo não foi provado.
- A deduplicação por visual_hash não foi executada porque ainda não existe mídia real/licenciada selecionada.
- Nenhuma publicação WordPress, Meta, Facebook, Instagram ou Google Business ocorreu.

## BLOQUEIO

- `WORDPRESS_ORIGIN_OR_DNS_UNREACHABLE`.
- `PUBLIC_HOME_HTTP_503`.
- `LIVE_CMS_DEDUPE_PASS=false`.
- `EXTERNAL_ID_DERIVATION_PASS=false`.
- `VISUAL_HASH_DEDUPE_PASS=false`.
- `PUBLISHED=false`.

## SOLUÇÃO TENTADA

- Verificação por dois conectores independentes (WPVibe e WPWriter).
- Teste público da home e Área Restrita.
- Continuidade independente pela planilha canônica 881 no Drive.
- Recibo fail-closed para separar zero-match offline de PASS CMS real.

## AÇÃO HUMANA MÍNIMA

- Se o HTTP 503 não for uma manutenção controlada esperada, verificar DNS/Hostinger/origin e restaurar a resolução do domínio.
- Não desligar manutenção durante o diagnóstico.
- Nenhuma ação humana é necessária para preservar o candidato Naoero em HOLD.

## PRÓXIMA AÇÃO

1. Repetir conectividade WordPress.
2. Quando o origin voltar, fazer backup da página 2109, corrigir a ocorrência única e confirmar nova revisão/readback.
3. Pesquisar Naoero e aliases no CMS vivo por título, slug e external_id.
4. Só então avaliar `CANONICAL_IDENTITY_DEDUPE_PASS`; mídia e publicação continuam bloqueadas.

## ROLLBACK

- Reverter o commit documental `513eb761c6c226b921a0f52493314bc2816b3225`.
- Nenhuma mutação externa requer rollback.
