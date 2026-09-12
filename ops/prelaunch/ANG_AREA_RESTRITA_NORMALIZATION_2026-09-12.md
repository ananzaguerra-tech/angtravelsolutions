# ANG — normalização da Área Restrita — 2026-09-12

Status: `PARTIAL_PASS / UPLOAD_PENDING_CHANNEL`

## EXECUTADO

- Relatório Mestre/STATUS LIVE relido no Google Drive.
- Backup pré-mudança dos conteúdos brutos preservado em `docs/audit/ANG_AREA_RESTRITA_LINKS_BACKUP_2026-09-12.json` (commit `91e846c6b53a1bdfad6ff09f887ce8938989e62b`).
- Nove páginas publicadas tiveram uma substituição cirúrgica e reversível de `/area-restrita-ang/` para `/area-restrita/`, preservando ID, status e histórico de revisão:
  - 78000 Curadoria Restrita
  - 73535 Serviços Terrestres
  - 73181 Hotelaria Premium
  - 73182 Restaurantes Premium
  - 70393 Revista ANG
  - 67942 Business Travel
  - 67943 MICE
  - 67944 Celebration
  - 1815 Outsourcing
- A página 86740 (Seja Cliente) teve uma ocorrência exata de “Área do Cliente” normalizada para “Área do Agente”.
- Releitura REST pós-escrita confirmou zero ocorrências da rota antiga e uma ocorrência da rota canônica em cada uma das nove páginas.
- Busca REST global por `area-restrita-ang` retornou lista vazia.
- A rota canônica existe e permanece publicada na página ID 2109 (`/area-restrita/`), com os shortcodes `[ang_v13_dashboard]` e `[ang_governance_library]`.
- O shortcode `[ang_v13_dashboard]` ainda emite o heading legado `<h2>Área do Cliente</h2>`.
- Foi preparado hotfix fail-closed, restrito à saída do shortcode, em `plugin/ang-area-restrita-label-hotfix/ang-area-restrita-label-hotfix.php` (commit `34c158d082fc3cdc83aa4f4e7431f0aa9c721fbe`).

## EVIDÊNCIA

- WordPress REST: páginas e IDs acima; releitura pós-escrita com status `publish`.
- Página canônica: https://angtravelsolutions.com.br/area-restrita/ (ID 2109).
- Plugin ativo que gera a experiência: `ang-enterprise-suite` 2.14.1.
- O repositório contém apenas uma versão histórica 0.3.0 do plugin, sem `ang_v13_dashboard`; portanto não foi alegada correção da fonte implantada.
- O commit do hotfix não apresentou workflow CI associado no momento da consulta.

## NÃO FEITO

- O hotfix não foi instalado nem ativado em produção.
- O título emitido pelo shortcode não foi marcado como corrigido ao vivo.
- Console/Área Restrita não foi marcado PASS; o fluxo E2E de cotação permanece sem prova integral.
- Nenhuma página foi recriada, nenhum plugin foi desativado, nenhum conteúdo foi apagado e a manutenção pública não foi removida.

## MOTIVO / BLOQUEIO

O código-fonte da versão ativa `ang-enterprise-suite` 2.14.1 não está versionado no GitHub e o canal conectado não oferece edição segura de arquivos de plugin. O usuário WordPress conectado também não possui `manage_options`. Classificação: `ACTIVE_PLUGIN_SOURCE_UNAVAILABLE / UPLOAD_PENDING_CHANNEL`.

## SOLUÇÃO TENTADA

Foi criado um plugin-hotfix independente que usa o filtro `do_shortcode_tag`, atua apenas sobre `ang_v13_dashboard` e só substitui a ocorrência exata quando ela aparece uma única vez. Não altera banco de dados, outros shortcodes ou RBAC.

## AÇÃO HUMANA MÍNIMA

Disponibilizar a fonte implantada do `ang-enterprise-suite` 2.14.1 para correção na função geradora, ou instalar/ativar o hotfix preparado por um administrador com `manage_options`. Depois, recarregar `/area-restrita/` autenticado e validar o heading, RBAC e módulos.

## PRÓXIMA AÇÃO

1. Implantar o hotfix em staging/canal autenticado.
2. Confirmar no HTML renderizado: zero “Área do Cliente” e exatamente um “Área do Agente”.
3. Executar login `/acesso-ang/` → `/area-restrita/`, RBAC e smoke dos módulos.
4. Prosseguir ao E2E de cotação: entrada → cálculo/cotação → revisão → link protegido → PDF → persistência.
5. Manter `PARTIAL_PASS` até todas as provas existirem.

## ROLLBACK

- Páginas: restaurar as revisões WordPress imediatamente anteriores às modificações de 2026-09-12 ou reaplicar os conteúdos brutos do backup no commit `91e846c6b53a1bdfad6ff09f887ce8938989e62b`.
- Hotfix: desativar/remover `ang-area-restrita-label-hotfix`; como não há escrita em banco, o comportamento anterior retorna imediatamente.
