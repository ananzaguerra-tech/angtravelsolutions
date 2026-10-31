# ANG — Auditoria de atalhos da Área do Agente — C318

**Data de verificação:** 2026-10-31 (UTC)  
**Escopo:** página WordPress `81898` (`/area-do-agente/`) e destinos expostos como módulos.  
**Política:** fail-closed; nenhum módulo recebeu PASS funcional sem prova ponta a ponta.

## EXECUTADO

1. Leitura autenticada da página `81898` e dos destinos Hotelaria, Fornecedores, Academy, Relatórios e Minhas Condições.
2. Verificação anônima de rotas, sem autenticação:
   - `/hotelaria-restrita/` → HTTP 302 para login;
   - `/fornecedores/` → HTTP 302 para `/acesso-ang/`;
   - `/academy-ang/` → HTTP 404;
   - `/ang-connect-academy/` → HTTP 302 para `/acesso-ang/`;
   - `/relatorios/` → HTTP 302 para login;
   - `/minhas-condicoes/` → HTTP 302 para login;
   - `/area-do-agente/` → HTTP 302 para login.
3. Inspeção autenticada:
   - Hotelaria Restrita `73533`: estrutura preparada, sem acervo operacional comprovado;
   - Fornecedores `141450`: página de governança, sem diretório operacional comprovado;
   - Relatórios `73539`: estrutura preparada, sem painéis/dados comprovados;
   - Minhas Condições `73542`: estrutura preparada, sem condições personalizadas comprovadas;
   - `/academy-ang/`: destino inexistente; a rota existente é `/ang-connect-academy/`, mas o fluxo funcional não foi homologado.
4. Backup integral pré-alteração salvo em:
   `docs/backups/wordpress/ANG_PAGE_81898_PRE_C318_SHORTCUT_STATUS_ROLLBACK_2026-10-31.json`.
5. Correção fail-closed da página `81898`:
   - Wooba, Hotelaria, Fornecedores, Biblioteca Premium, Academy, Relatórios e Minhas Condições ficaram sem `href`, com `aria-disabled=true` e rótulo **Homologação**;
   - o botão quebrado `/academy-ang/` foi desativado;
   - Revista ANG permaneceu como único atalho editorial ativo nesse bloco;
   - texto de Hotelaria e Fornecedores foi ajustado para não simular acervo/diretório operacional disponível.
6. Leitura de retorno confirmou a persistência. Nova revisão WordPress: **153644**.

## EVIDÊNCIA / URL / ID

- Página: https://angtravelsolutions.com.br/area-do-agente/
- Page ID: `81898`
- Revision ID: `153644`
- Backup: https://github.com/ananzaguerra-tech/angtravelsolutions/blob/staging/docs/backups/wordpress/ANG_PAGE_81898_PRE_C318_SHORTCUT_STATUS_ROLLBACK_2026-10-31.json
- Recibo do backup: https://github.com/ananzaguerra-tech/angtravelsolutions/commit/fea8d79fb6b52a386a67a388d45b2df0e33bc127

## NÃO FEITO / MOTIVO

- Nenhum módulo foi marcado PASS, porque não houve validação autenticada ponta a ponta de dados, ações, RBAC e persistência.
- Nenhuma publicação social, Meta, Google Business, mídia ou conteúdo de parceiro foi criada.
- Nenhuma postagem sem mídia foi feita.

## BLOQUEIO

- Módulos continuam dependentes de implementação de dados, RBAC e homologação funcional.
- Academy possui rota existente diferente da rota quebrada, mas não há prova E2E suficiente para reativar o atalho.

## SOLUÇÃO TENTADA

- Auditoria de conteúdo + HTTP anônimo + leitura autenticada; correção reversível apenas na camada de navegação, preservando as páginas existentes.

## AÇÃO HUMANA MÍNIMA

- Disponibilizar perfil de teste representativo por papel quando os módulos estiverem implementados, para homologação E2E.

## PRÓXIMA AÇÃO

- Auditar Academy e Intranet por usuário autorizado, incluindo conteúdo, progresso, RBAC e persistência; manter HOLD até prova objetiva.

## ROLLBACK

- Restaurar o campo `content` da página `81898` com o JSON do backup pré-C318, ou restaurar a revisão WordPress anterior à `153644`.

## PARCERIAS / DRIVE

- Gmail: nenhuma nova resposta positiva de Accor, Club Med ou Il Borro; o único retorno localizado foi a recusa já conhecida da TTW.
- Drive: nenhum STATUS LIVE C318 encontrado.
