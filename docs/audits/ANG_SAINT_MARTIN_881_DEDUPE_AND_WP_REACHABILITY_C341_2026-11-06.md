# ANG — Saint-Martin 881 dedupe e alcance WordPress — C341

**Checked at:** 2026-11-06 06:05:08 BRT  
**Baseline do relatório mestre:** Biblioteca v52  
**Modo:** fail-closed, sem publicação

## Executado

- O documento histórico `ANG_CURADORIA_BLOCO_12_PAISES_10_2026-09-09` foi relido no Drive.
- Saint-Martin permanece `REVIEW_REQUIRED`, com CMS `UPLOAD_PENDING_CHANNEL`, mídia pendente e IDs canônicos não atribuídos.
- A identidade foi delimitada à coletividade francesa, sem fundir o registro com Sint Maarten.
- Os fatos dinâmicos e as fontes continuam datados de 2026-09-09; turismo estava `DEGRADED` e nada foi promovido como atual.
- Foram pesquisados `Saint-Martin`, `Collectivity of Saint Martin`, `French Saint Martin` e `MAF` nas duas abas canônicas 881.
- As oito buscas retornaram zero correspondências.
- A origem pública WordPress retornou HTTP 502; `/area-restrita/` não ficou acessível; WPWriter não conseguiu buscar posts nem páginas.
- Gmail não retornou novas mensagens nas últimas 24 horas para Accor, Club Med, TTW/Guilherme Valle ou Il Borro/Simone Pampaloni.
- Drive não retornou STATUS LIVE C341 mais recente.
- Nenhuma escrita ou publicação foi tentada em WordPress, Meta, Google Business ou mídia.

## Classificação

`CANONICAL_DEDUPE_OFFLINE_ZERO_MATCH`.

Não é `CANONICAL_IDENTITY_DEDUPE_PASS`: CMS vivo, `external_id`, distinção canônica pós-readback, fatos oficiais atuais, mídia/licença, `visual_hash` e imigração específica para brasileiros permanecem sem prova.

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
- Separação explícita Saint-Martin/Sint Maarten.
- Verificação independente pela planilha 881.
- Teste da origem pública, Área Restrita e WPWriter.
- Pesquisa de respostas de parcerias e STATUS LIVE.
- Preservação do conteúdo sem bypass ou mutação destrutiva.

## Ação humana mínima

Administrador da hospedagem: verificar origin/PHP/banco/upstream e restaurar o site existente sem desligar a manutenção nem recriar conteúdo.

## Próxima ação

Quando o origin voltar: backup da página 2109, correção do callout com readback e pesquisa de Saint-Martin no CMS por título, slug e `external_id`, garantindo separação de Sint Maarten. Revalidar turismo, France-Visas, trânsito/conexões e demais fatos oficiais antes de uso editorial.

## Rollback

Reverter os commits do recibo e desta auditoria. Nenhuma mutação externa exige rollback.
