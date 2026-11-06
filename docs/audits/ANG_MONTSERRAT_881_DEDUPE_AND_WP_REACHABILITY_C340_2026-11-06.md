# ANG — Montserrat 881 dedupe e alcance WordPress — C340

**Checked at:** 2026-11-06 04:59:58 BRT  
**Baseline do relatório mestre:** Biblioteca v51  
**Modo:** fail-closed, sem publicação

## Executado

- O documento histórico `ANG_CURADORIA_BLOCO_12_PAISES_10_2026-09-09` foi relido no Drive.
- Montserrat permanece `REVIEW_REQUIRED`, com CMS `UPLOAD_PENDING_CHANNEL`, mídia pendente e IDs canônicos não atribuídos.
- Os fatos dinâmicos e as fontes do documento continuam datados de 2026-09-09; a rota de imigração estava marcada `DEGRADED` e nada foi promovido como atual.
- Foram pesquisados `Montserrat`, `British Montserrat`, `MSR` e `Emerald Isle of the Caribbean` nas abas `Item Register!A1:P900` e `WP Export Identity 24-07!A1:H900` da planilha canônica 881.
- As oito buscas retornaram zero correspondências.
- A origem pública WordPress foi revalidada e retornou HTTP 502; `/area-restrita/` não ficou acessível.
- O conector WPWriter aparece ativo, mas não conseguiu buscar posts nem páginas.
- Gmail não retornou novas mensagens nas últimas 24 horas para Accor, Club Med, TTW/Guilherme Valle ou Il Borro/Simone Pampaloni.
- Drive não retornou STATUS LIVE C340 mais recente.
- Nenhuma escrita ou publicação foi tentada em WordPress, Meta, Google Business ou mídia.

## Classificação

`CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.

Isto não é `CANONICAL_IDENTITY_DEDUPE_PASS`: o CMS vivo permaneceu indisponível, não houve derivação de `external_id`, rechecagem dos fatos dinâmicos por fontes oficiais, dedupe por `visual_hash`, validação de mídia/licença ou validação migratória específica para brasileiros.

## Bloqueios

- `WORDPRESS_ORIGIN_UNREACHABLE`
- `PUBLIC_HOME_HTTP_502`
- `LIVE_CMS_DEDUPE_PASS=false`
- `EXTERNAL_ID_DERIVATION_PASS=false`
- `OFFICIAL_DYNAMIC_FACTS_RECHECKED=false`
- `REAL_MEDIA_VERIFIED=false`
- `VISUAL_HASH_DEDUPE_PASS=false`
- `IMMIGRATION_NATIONALITY_PASS=false`
- `PUBLISHED=false`

## Solução tentada

- Releitura do relatório mestre e do Bloco 12 no Drive.
- Verificação independente pela planilha canônica 881.
- Teste da origem pública, Área Restrita e WPWriter.
- Pesquisa de novas respostas de parcerias e de STATUS LIVE mais recente.
- Preservação do conteúdo e da manutenção, sem bypass ou mutação destrutiva.

## Ação humana mínima

Administrador da hospedagem: verificar origin/PHP/banco/upstream e restaurar o site existente sem desligar a manutenção nem recriar conteúdo.

## Próxima ação

Quando o origin voltar: backup da página 2109, correção do callout com readback e pesquisa de Montserrat no CMS vivo por título, slug e `external_id`. Revalidar turismo, imigração, acesso às zonas vulcânicas e demais fatos dinâmicos em fontes oficiais antes de uso editorial. Só então avaliar PASS canônico; mídia, imigração e publicação seguem em HOLD.

## Rollback

Reverter os commits do recibo e desta auditoria. Nenhuma mutação externa exige rollback.
