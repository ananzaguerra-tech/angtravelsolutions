# ANG — Ciclo C316 — Auditoria anônima do fluxo de acesso e quarentena de Treinamentos

**Data:** 2026-10-30 (America/Sao_Paulo)  
**Modo:** fail-closed, sem credenciais de usuário, correção reversível

## EXECUTADO

1. Relatório Mestre confirmado na Biblioteca como versão 27.
2. Gmail:
   - nenhuma nova resposta de Accor, Club Med ou Il Borro;
   - a única mensagem retornada foi a recusa TTW já registrada.
3. Drive:
   - zero resultados para `ANG STATUS LIVE C315 C316`;
   - zero resultados para `acesso-ang area-restrita Área do Cliente`.
4. Fluxo de acesso:
   - `/acesso-ang/`: HTTP 200 anônimo;
   - formulário WordPress válido, método POST, action `/wp-login.php`;
   - `redirect_to=/area-restrita/`;
   - `/area-restrita/`: HTTP 302 anônimo para `wp-login.php?redirect_to=.../area-restrita/&reauth=1`.
5. Matriz anônima dos módulos marcados como disponíveis:
   - `/wooba-white-label/`: 302 para login;
   - `/biblioteca-premium/`: 302 para login;
   - `/ang-connect-academy/`: 302 para `/acesso-ang/`;
   - `/intranet-ang/`: 302 para `/acesso-ang/`;
   - `/area-do-agente/`: 302 para login;
   - `/curadoria-global/`: 200, conteúdo público de apresentação, sem dados restritos observados;
   - `/revista-ang/`: 200, conteúdo editorial público;
   - `/treinamentos-curadoria/`: 200, apesar de declarar “Área Restrita” e “Acesso exclusivo”.
6. Correção do bypass de Treinamentos:
   - backup operacional do ID 49857 salvo na Biblioteca;
   - página 49857 movida de `publish` para `draft`;
   - readback autenticado: `status=draft`, título/slug/conteúdo preservados;
   - readback anônimo: `/treinamentos-curadoria/` = HTTP 404.
7. Correção da Área Restrita:
   - backup integral do ID 2109 salvo no GitHub;
   - card Treinamentos alterado de `is-live / Disponível / href` para `is-hold / Homologação / sem href`;
   - readback autenticado: uma ocorrência exata do novo card e zero do antigo;
   - página 2109 permaneceu `publish` e protegida por redirecionamento anônimo.

## EVIDÊNCIA / URL / ID / COMMIT

- Acesso: https://angtravelsolutions.com.br/acesso-ang/
- Área Restrita: https://angtravelsolutions.com.br/area-restrita/
- Página Treinamentos: WordPress ID `49857`, status `draft`.
- Backup Biblioteca 49857: `libfile_c9400b7ab84c8191bb78ebbe2e7d52be`.
- Backup GitHub 2109: `docs/backups/wordpress/ANG_PAGE_2109_PRE_C316_TRAINING_CARD_ROLLBACK_2026-10-30.json`.
- Commit do backup 2109: `7ae862f78d29cc27863bffcc9d3ce30ff009eb93`.
- Revisão da página 2109: `153642`.

## NÃO FEITO / MOTIVO

- Login real não foi executado: nenhuma credencial foi solicitada ou utilizada.
- RBAC por perfil não recebeu PASS: o teste cobre apenas bloqueio anônimo e destinos de redirecionamento.
- Cotação E2E, Secure Forms, PDF, link protegido e persistência não foram validados.
- `/curadoria-global/` não foi marcado como módulo restrito PASS; foi classificado apenas como landing pública sem conteúdo sensível observado.
- Nenhuma publicação social, Meta/n8n, Google Business ou conteúdo novo foi executada.

## MOTIVO / BLOQUEIO

- `TRAINING_PAGE_ANONYMOUS_BYPASS_CONFIRMED_AND_QUARANTINED`.
- `RBAC_ROLE_MATRIX_NOT_PROVEN`.
- `CONSOLE_QUOTE_E2E_NOT_PROVEN`.
- `WORDPRESS_MANAGE_OPTIONS_NOT_AVAILABLE`.

## SOLUÇÃO TENTADA

- Testes HTTP anônimos diretos, sem cookies e sem seguir o primeiro redirecionamento.
- Leitura REST autenticada de conteúdo e metadados.
- Quarentena reversível da página contraditória em vez de tentar implementar RBAC incompleto.
- Remoção do link quebrado no card, preservando o módulo como `Homologação`.

## AÇÃO HUMANA MÍNIMA

- Disponibilizar conta de teste por perfil ou um mecanismo seguro de sessão de teste para validar RBAC; não enviar senha no chat.
- Conceder `manage_options` apenas se for necessária auditoria global de opções/plugins.
- Confirmar a política desejada para `/curadoria-global/`: landing pública ou módulo exclusivamente autenticado.

## PRÓXIMA AÇÃO

- Testar matriz RBAC autenticada assim que houver sessão segura.
- Auditar rotas “Disponível” restantes quanto a conteúdo real, ações e persistência.
- Manter Treinamentos em draft até existir guard de rota e readback anônimo 302.
- Continuar monitorando fornecedores e demais frentes independentes.

## ROLLBACK

- ID 49857: restaurar o backup `libfile_c9400b7ab84c8191bb78ebbe2e7d52be` e `status=publish` somente após proteção de rota comprovada.
- ID 2109: restaurar revisão `153642` ou o backup GitHub do commit `7ae862f78d29cc27863bffcc9d3ce30ff009eb93`.
- Nenhuma página foi excluída ou recriada.
