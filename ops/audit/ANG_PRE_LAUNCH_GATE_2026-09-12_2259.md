# ANG — Gate de pré-lançamento P0

**Data/hora:** 2026-09-12 22:59 BRT  
**Decisão:** `NO_GO / MAINTENANCE_PRESERVED`  
**Regra:** nenhum horário substitui evidência objetiva de PASS.

## Matriz do gate

| Gate | Evidência atual | Status |
|---|---|---|
| Manutenção pública | Home respondeu HTTP 503 na verificação pública de 12/09/2026 22:59 BRT | PRESERVED / não é GO-LIVE |
| Home/V13 desktop e mobile | Validação ao vivo não concluída neste gate; canal WordPress atingiu limite diário | BLOCK |
| `/acesso-ang/` → `/area-restrita/` | Sem nova validação ao vivo; evidência anterior apenas parcial | BLOCK |
| Área Restrita/RBAC/módulos | Auditoria anterior encontrou somente Cotações, Hotelaria, Biblioteca e Perfil; módulos exigidos ausentes da navegação | PARTIAL / BLOCK |
| Cotação E2E → cálculo → revisão → link protegido → PDF → persistência | Sem execução e IDs reais | BLOCK |
| Secure Forms/LGPD/antispam/routing | Sem teste E2E atual | BLOCK |
| 881/WORLD | 881 registros canônicos reconciliados; 42 placeholders legados em HOLD; não equivale a conteúdo/publicação integral | PARTIAL |
| SEO/schema/canonical/mobile/performance | Sem bateria final comprovada | BLOCK |
| Backup e restore testado | Backups pontuais existem; restauração final não foi exercitada | BLOCK |
| Meta/WhatsApp/Concierge E2E | Sem inbound/outbound real atual e sem IDs de execução/mensagem | BLOCK |
| n8n | Segunda tentativa de cobrança de R$150 recusada às 22:54 BRT; continuidade da conta não garantida | CRITICAL BLOCK |
| Social | Nenhum item possui simultaneamente mídia real/licenciada, master, dedupe e COPY_QA | BLOCK / 0 PUBLISHED |
| Google Business | Nenhuma alteração neste gate; NYC continua vídeo humano e fichas não podem ser duplicadas | HOLD |
| Il Borro | Conteúdo pronto para revisão; dois MP4s reais, porém sem autorização escrita e QA técnico | HOLD_RIGHTS |
| Miami Beach Reel | Zero vídeos hotel-específicos encontrados no Drive para os 12 hotéis | HOLD_MEDIA_NOT_FOUND |
| Parcerias | Zero respostas inbound de Accor, Club Med, TTW Group e Il Borro | AWAITING_REPLY |
| Relatório Mestre | Documento no Drive legível; gravação persistente principal permanece dependente da Biblioteca/conexão disponível | PARTIAL |

## EXECUTADO

- Relatório Mestre/STATUS disponíveis no Drive consultados.
- Gmail consultado para parcerias e continuidade n8n.
- Segunda notificação de cobrança n8n confirmada, recebida em 12/09/2026 às 22:54 BRT.
- Verificação pública da home executada; resposta HTTP 503.
- Tentativa de validar Home, `/acesso-ang/` e `/area-restrita/` pelo canal autenticado; todas bloqueadas pelo limite diário do plano.
- Decisão fail-closed aplicada: manutenção preservada e nenhuma promoção executada.

## EVIDÊNCIA | URL/ID/COMMIT

- E-mail n8n: https://mail.google.com/mail/#all/1a098791edd73a21
- Site: https://angtravelsolutions.com.br/
- Reconciliação 881: https://github.com/ananzaguerra-tech/angtravelsolutions/commit/de46eae9c440920e7419d03e8308a4306deed14f
- Matriz Área Restrita: https://github.com/ananzaguerra-tech/angtravelsolutions/commit/3c1f588ff0f40bc83047557340336d82b7c28c3f
- Hotfix shortcode pendente de canal: https://github.com/ananzaguerra-tech/angtravelsolutions/commit/34c158d082fc3cdc83aa4f4e7431f0aa9c721fbe
- Mídia Il Borro/Miami: https://github.com/ananzaguerra-tech/angtravelsolutions/commit/99e91a90810172833b46f3d77d88c62a29fc5399

## NÃO FEITO | MOTIVO | BLOQUEIO

- GO-LIVE não executado: múltiplos P0 sem PASS e n8n em risco financeiro.
- Testes WordPress adicionais não executados: limite diário do canal autenticado atingido; retomada indicada após 13/09/2026 10:00 UTC.
- Workflow n8n/Meta não acionado: cobrança não regularizada e E2E não homologado.
- Social/Blog/GBP não publicados: direitos, masters, mídia e/ou elegibilidade incompletos.

## SOLUÇÃO TENTADA

- Fallback de verificação pública sem alterar estado.
- Consulta Gmail para distinguir risco de cobrança de suspensão comprovada.
- Preservação de artefatos e matriz no GitHub staging.
- Continuidade das frentes editoriais sem mídia não autorizada.

## AÇÃO HUMANA MÍNIMA

1. Regularizar os R$150 diretamente no portal oficial do n8n; não enviar cartão, senha ou token por mensagem.
2. Conceder `manage_options` ao usuário técnico WordPress ou disponibilizar o pacote ativo `ang-enterprise-suite 2.14.1` para implantar/testar o hotfix.
3. Autorizar por escrito a reutilização dos vídeos de Il Borro e fornecer vídeos oficiais/licenciados dos hotéis de Miami, se a campanha prosseguir.
4. Executar o vídeo exigido pelo Google para NYC quando solicitado pela plataforma.

## PRÓXIMA AÇÃO

- Após reabertura do canal WordPress: validar manutenção, redirects, RBAC, módulos e Secure Forms; executar cotação E2E; confirmar backup/restore.
- Após confirmação n8n ativa: testar somente o workflow correto, com inbound/outbound real e IDs; nenhum retry do payload proibido.
- Só reconsiderar GO-LIVE quando todos os P0 críticos tiverem evidência PASS.

## ROLLBACK

Nenhuma mudança de produção foi aplicada neste gate. Para desfazer somente este registro, remover o arquivo da branch `staging`; manutenção e estados externos permanecem inalterados.
