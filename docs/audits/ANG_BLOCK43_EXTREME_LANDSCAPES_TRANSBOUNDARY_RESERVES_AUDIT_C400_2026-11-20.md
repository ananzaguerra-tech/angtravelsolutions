# ANG — Auditoria C400 — Bloco 43

## EXECUTADO
- Relatório Mestre v112/STATUS LIVE C399 relido.
- Dez identidades reconciliadas: Ennedi, Tassili n'Ajjer, Aïr–Ténéré, Baikal, Kamchatka, Sundarbans, Central Suriname, Lorentz, Kahuzi-Biega e Simien.
- Dedupe exato no mestre: 10 padrões, zero matches.
- Planilha 881: 20 consultas nas duas abas, zero matches e zero erros.
- Artefato validado: 10 módulos, 160 eixos, 30 URLs oficiais, 12 `PUBLISHED=false`, zero `PUBLISHED=true`.
- Drive importado e relido: documento `1Uo3ugqVArvJDxLLyXrjJWSeGoo7cxXgDLdjvkErkWBQ`, revisão `AHj4eMSoWJZ4qNVLXAvxWnMVw_4c4hf2GS__590wcvNiGkdhJyJv0A-TiaqqnfK7X4ZiWHQNinu1fCO23jjX8a-hV15wZEC3vMWztuuw-w`.

## EVIDÊNCIA
- Documento: https://docs.google.com/document/d/1Uo3ugqVArvJDxLLyXrjJWSeGoo7cxXgDLdjvkErkWBQ
- Planilha: https://docs.google.com/spreadsheets/d/1iaRnqWwCM8brKLYMYW66whdbN8TfR2i6CttEYz0yLZg
- Fontes primárias: UNESCO World Heritage Centre e advisories oficiais dos EUA/Canadá, `checked_at=2026-11-20`.

## WORDPRESS / ACTIONS
- Workflow Stable instanciou o job `verify-wordpress-rest`.
- A etapa de validação falhou com `PROBE_RESULT=BLOCKED_MISSING_WP_BASE_URL`; `WP_BASE_URL`, `WP_USERNAME` e `WP_APP_PASSWORD` chegaram vazios.
- Isto prova secrets ausentes no job, não credencial WordPress rejeitada.
- Validate ANG build passou; os workflows v1/v2 separados continuam sem jobs.

## NÃO FEITO / BLOQUEIO
- Nenhuma importação no CMS, publicação, Meta, Google Business, n8n ou exclusão de post.
- `LIVE_CMS_DEDUPE_PASS=false`; `WORDPRESS_P0_PASS=false`; `CONSOLE_E2E_PASS=false`; `CONCIERGE_E2E_PASS=false`.
- Ennedi, Aïr–Ténéré, Baikal, Kamchatka e Kahuzi-Biega permanecem HOLD por advisories oficiais severos; Tassili, Lorentz e Simien exigem validação regional; Sundarbans exige QA dinâmico.
- Miami Beach e Il Borro continuam HOLD por direitos de mídia não comprovados.
- Posts incorretos permanecem `DELETE_NOT_PROVEN`.

## SOLUÇÃO TENTADA
- Dedupe em Biblioteca/Drive, pesquisa oficial atual, readback integral do Drive e diagnóstico de logs GitHub sem expor segredos.
- Manutenção pública e fail-closed preservados.

## AÇÃO HUMANA MÍNIMA
- Cadastrar no repositório os três Actions secrets `WP_BASE_URL`, `WP_USERNAME` e `WP_APP_PASSWORD`; depois rerodar somente o probe read-only.
- Reconectar Jetpack e prover backup/staging + `manage_options` antes de corrigir rodapé/CTA.
- Regularizar readback Meta/GBP e obter autorizações de mídia/master antes de qualquer publicação.

## PRÓXIMA AÇÃO
- Após secrets: exigir HTTP/REST read-only sem mutação e manter manutenção.
- Após backup/staging: corrigir endereço no rodapé e CTA runtime, validar RBAC/cotação E2E e dedupe vivo do Bloco 43.
- Continuar frentes independentes sem publicar conteúdo em HOLD.

## ROLLBACK
- Reverter os commits C400 e excluir o documento Drive apenas se houver defeito de integridade; nenhum estado público foi alterado.

