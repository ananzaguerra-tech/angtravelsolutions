# ANG — Quarentena de Academy e Intranet — C319

**Data:** 2026-10-30 22:05 BRT  
**Política:** fail-closed, reversibilidade e preservação integral.

## EXECUTADO

1. Relatório Mestre lido na Biblioteca, versão 30.
2. Gmail verificado: nenhuma nova resposta positiva de Accor, Club Med ou Il Borro; apenas a recusa TTW já registrada.
3. Drive verificado: nenhum `ANG STATUS LIVE C319`.
4. Páginas auditadas:
   - ANG Academy, ID `106242`, conteúdo bruto `[ang_connect_academy_full]`;
   - Intranet ANG, ID `106241`, conteúdo bruto `[ang_connect_intranet_full]`.
5. Evidência de falha:
   - o conteúdo REST renderizado preservava literalmente os shortcodes;
   - a busca nos arquivos acessíveis não localizou qualquer implementação desses dois shortcodes;
   - a tentativa read-only por WP-CLI foi recusada por argumento/permissão e não foi usada como prova positiva.
6. Backups integrais pré-alteração salvos no GitHub para IDs `106242`, `106241` e `2109`.
7. IDs `106242` e `106241` movidos reversivelmente de `publish` para `draft`.
8. Na Área Restrita, ID `2109`, cards Academy e Intranet alterados de `is-live / Disponível / href` para `is-hold / Homologação / sem href`.
9. Readback:
   - Academy e Intranet: `draft`;
   - URLs públicas: HTTP 404;
   - Área Restrita: `publish`;
   - revisão `153647`.

## EVIDÊNCIA / URL / ID / COMMIT

- Academy backup: commit `f5c12286306facd916d47954ce1891132d8b3a39`.
- Intranet backup: commit `32dd6e5236517ccd702afacd90b9604d5f7a9dd2`.
- Área Restrita backup: commit `d8838b19f98d3f47d2a7f200cfbb9a3768a40d8f`.
- IDs: `106242`, `106241`, `2109`.
- Revision ID: `153647`.

## NÃO FEITO / MOTIVO

- Não foi criada implementação substituta sem contrato funcional, dados, RBAC e testes.
- Academy e Intranet não receberam PASS.
- Nenhum usuário, credencial ou perfil real foi utilizado.
- Nenhuma publicação social, Meta/n8n, Google Business ou mídia foi executada.

## BLOQUEIO

- `ACADEMY_SHORTCODE_UNREGISTERED_OR_INACTIVE`.
- `INTRANET_SHORTCODE_UNREGISTERED_OR_INACTIVE`.
- `RBAC_AND_PERSISTENCE_NOT_PROVEN`.

## SOLUÇÃO TENTADA

- Busca de implementação nos arquivos acessíveis, leitura REST autenticada, tentativa WP-CLI read-only e readback público/anônimo.
- Quarentena reversível em vez de expor shortcode literal a usuários autenticados.

## AÇÃO HUMANA MÍNIMA

- Nenhuma para manter a segurança atual.
- Para reativar: fornecer/instalar a implementação aprovada, validar cada papel autorizado e comprovar conteúdo, progresso/persistência e bloqueio anônimo.

## PRÓXIMA AÇÃO

- Auditar o próximo card ainda marcado `Disponível` na Área Restrita, começando por Curadoria Global e Revista ANG, distinguindo landing pública de módulo funcional.
- Manter Academy e Intranet em draft até gates completos.

## ROLLBACK

- Restaurar os JSONs pré-C319 e republicar IDs `106242` e `106241` somente após implementação comprovada.
- Restaurar página `2109` pelo backup ou revisão anterior à `153647`.
