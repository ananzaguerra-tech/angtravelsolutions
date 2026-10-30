# ANG — Ciclo C317 — Correção de status dos módulos da Área Restrita

**Data:** 2026-10-30 (America/Sao_Paulo)  
**Modo:** fail-closed, sem login real, alteração reversível

## EXECUTADO

1. Relatório Mestre confirmado na Biblioteca como versão 28.
2. Gmail:
   - nenhuma nova resposta de Accor, Club Med ou Il Borro;
   - somente a recusa TTW já registrada.
3. Drive:
   - zero resultados para `ANG STATUS LIVE C316 C317`.
4. Conteúdo autenticado dos módulos marcados como disponíveis:
   - Wooba White Label, ID 73534: página protegida, mas contém somente “estrutura preparada”, integração futura e “próxima evolução”; nenhum buscador E2E comprovado.
   - Biblioteca Premium, ID 73538: página protegida, mas contém somente descrição de estrutura preparada; nenhum download, documento ou permissão por perfil comprovados.
   - ANG Academy, ID 106242: conteúdo é apenas o shortcode `[ang_connect_academy_full]`; funcionalidade e RBAC dependem de sessão autenticada.
   - Intranet ANG, ID 106241: conteúdo é apenas o shortcode `[ang_connect_intranet_full]`; funcionalidade e RBAC dependem de sessão autenticada.
   - Área do Agente, ID 81898: dashboard estático informa que indicadores e camada de dados/RBAC permanecem em homologação.
5. Correção do painel principal, ID 2109:
   - backup integral salvo no GitHub antes da alteração;
   - card Wooba alterado de `is-live / Disponível / href` para `is-hold / Homologação / sem href`;
   - card Biblioteca Premium alterado de `is-live / Disponível / href` para `is-hold / Homologação / sem href`;
   - readback autenticado: zero ocorrências antigas e uma ocorrência de cada novo card;
   - página permaneceu `publish`, título/slug preservados.
6. Readback anônimo:
   - `/area-restrita/` = 302 para login;
   - `/wooba-white-label/` = 302 para login;
   - `/biblioteca-premium/` = 302 para login.

## EVIDÊNCIA / URL / ID / COMMIT

- Área Restrita: https://angtravelsolutions.com.br/area-restrita/
- IDs auditados: `73534`, `73538`, `106242`, `106241`, `81898`, `2109`.
- Backup 2109: `docs/backups/wordpress/ANG_PAGE_2109_PRE_C317_MODULE_STATUS_ROLLBACK_2026-10-30.json`.
- Commit do backup: `9f1288279e2d63043a6b04c14f3515ad476d31ab`.
- Revisão WordPress: `153643`.

## NÃO FEITO / MOTIVO

- Wooba e Biblioteca Premium não receberam PASS; proteção de rota não comprova funcionalidade.
- Academy e Intranet não foram alteradas nem marcadas PASS; shortcodes requerem teste autenticado.
- Área do Agente não recebeu PASS; a própria página declara indicadores e dados em homologação.
- Nenhum login, cotação, PDF, persistência ou Secure Form foi executado.
- Nenhuma publicação social, Meta/n8n, Google Business ou conteúdo editorial novo foi executada.

## MOTIVO / BLOQUEIO

- `WOOBA_PLACEHOLDER_ONLY_NO_E2E`.
- `LIBRARY_PLACEHOLDER_ONLY_NO_ASSET_READBACK`.
- `ACADEMY_SHORTCODE_AUTH_TEST_REQUIRED`.
- `INTRANET_SHORTCODE_AUTH_TEST_REQUIRED`.
- `AREA_AGENT_STATIC_DASHBOARD_NO_DATA_LAYER`.
- `RBAC_ROLE_MATRIX_NOT_PROVEN`.

## SOLUÇÃO TENTADA

- Leitura REST autenticada dos conteúdos e metadados.
- Testes HTTP anônimos sem cookies.
- Reclassificação pontual dos cards em vez de despublicar páginas protegidas ou simular funcionalidade.
- Backup integral e revisão WordPress antes/na alteração.

## AÇÃO HUMANA MÍNIMA

- Disponibilizar sessão segura de teste por perfil para Academy, Intranet, Wooba, Biblioteca e Área do Agente; não compartilhar senha no chat.
- Fornecer credenciais de integração Wooba somente pelo cofre/configuração apropriado, nunca por mensagem.
- Confirmar quais documentos/licenças devem compor a Biblioteca Premium.

## PRÓXIMA AÇÃO

- Auditar os demais atalhos do ID 81898: Hotelaria, Fornecedores, Academy, Relatórios e Minhas Condições.
- Reclassificar qualquer link que aponte para placeholder, rota pública indevida ou módulo sem E2E.
- Manter Console sem PASS até cotação completa e RBAC comprovados.

## ROLLBACK

- Restaurar a revisão `153643` ou o backup GitHub do commit `9f1288279e2d63043a6b04c14f3515ad476d31ab`.
- Nenhuma página foi excluída, despublicada ou recriada neste ciclo.
