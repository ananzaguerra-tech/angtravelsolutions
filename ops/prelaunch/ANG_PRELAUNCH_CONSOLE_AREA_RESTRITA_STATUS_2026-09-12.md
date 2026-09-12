# ANG PRÉ-LANÇAMENTO — CONSOLE + ÁREA RESTRITA — 2026-09-12

## Estado geral

**Área Restrita / Portal do Agente: EM IMPLEMENTAÇÃO / PENDENTE CRÍTICO**

A estrutura pública/logada existe, com login em `/acesso-ang/`, dashboard em `/area-restrita/` e módulos publicados. Porém vários módulos são páginas estruturais e ainda não comprovam operação ponta a ponta.

**Console de Cotação ANG: BLOQUEADO / EM IMPLEMENTAÇÃO**

A página `/console-cotacao-ang/` existe e declara dependência do plugin funcional e da integração Wooba White Label/documentação para gerar cotação, link e PDF. Não marcar PASS sem cotação ponta a ponta homologada.

## Rotas principais verificadas

- `/acesso-ang/` — login do Portal do Agente, redireciona para `/area-restrita/`.
- `/area-restrita/` — dashboard principal.
- `/area-do-agente/` — dashboard legado/alternativo; não deve ser rota principal.
- `/console-cotacao-ang/` — Console de Cotação.
- `/treinamentos-curadoria/` — Treinamentos & Curadoria.
- `/academy/` — Academy ANG.
- `/biblioteca-premium/` — Biblioteca Premium.
- `/hotelaria-restrita/` — Hotelaria Restrita.
- `/wooba-white-label/` — estrutura de integração Wooba.
- `/relatorios/`, `/financeiro/`, `/meu-perfil/`, `/minhas-condicoes/`, `/intranet/`, `/zendesk/`, `/promocoes-fornecedores/`, `/curadoria-restrita/` — módulos existentes.

## Status por módulo

| Módulo | Status | Evidência / pendência |
|---|---|---|
| Login / Acesso ANG | READY_QA | Formulário de login existe e redireciona para `/area-restrita/`; falta smoke autenticado com perfis reais. |
| Dashboard Área Restrita | READY_QA | Conteúdo, cards e governança existem; falta validar RBAC, navegação autenticada e rotas internas. |
| Console de Cotação | BLOQUEADO | Página existe, mas geração de orçamento/link/PDF depende de plugin funcional + Wooba; falta teste ponta a ponta. |
| Wooba White Label | EM IMPLEMENTAÇÃO | Estrutura preparada; falta integração/credenciais/documentação homologada. |
| Academy / Treinamentos | EM IMPLEMENTAÇÃO | Conteúdo e arquitetura existem; falta provar progresso, quizzes, badges, vídeos e persistência por usuário. |
| Curadoria Restrita | EM IMPLEMENTAÇÃO | Estrutura editorial existe; gerador de arte é descrito como prévia operacional; exportação avançada ainda dependente. |
| Biblioteca Premium | EM IMPLEMENTAÇÃO | Página existe; falta inventário real de downloads, permissões e teste de acesso. |
| Hotelaria Restrita | EM IMPLEMENTAÇÃO | Estrutura existe; falta conteúdo comercial homologado por perfil e teste de acesso. |
| Relatórios | EM IMPLEMENTAÇÃO | Página estrutural; falta dados reais/painéis integrados. |
| Financeiro | EM IMPLEMENTAÇÃO | Página estrutural; falta dados reais, permissões e persistência. |
| Meu Perfil | EM IMPLEMENTAÇÃO | Página estrutural; falta CRUD/perfil/autenticação comprovados. |
| Minhas Condições | EM IMPLEMENTAÇÃO | Página estrutural; falta vínculo real por agência/perfil. |
| Intranet | EM IMPLEMENTAÇÃO | Estrutura existe; falta conteúdo operacional dinâmico e RBAC comprovado. |
| Tickets / Zendesk | EM IMPLEMENTAÇÃO | Estrutura existe; falta integração real, fila e histórico. |
| Promoções de Fornecedores | EM IMPLEMENTAÇÃO | Estrutura existe; campanhas reais devem ser datadas, revalidadas e autorizadas. |
| Secure Forms | READY_QA | Plugin ativo; falta smoke completo sucesso/erro/LGPD/antispam/mobile. |
| Concierge | BLOQUEADO P0 | Webhook responde, mas integração Meta/n8n ainda exige homologação real inbound/outbound e evidência de execução. |

## Correções obrigatórias antes de PASS

1. Normalizar CTAs antigos de `/area-restrita-ang/` para `/area-restrita/` após QA de links.
2. Corrigir nomenclatura residual “Área do Cliente” para “Área Restrita” onde aplicável.
3. Executar smoke autenticado com perfis e menor privilégio.
4. Validar Console de Cotação ponta a ponta: entrada -> cálculo/cotação -> revisão -> link protegido -> PDF -> persistência.
5. Validar Wooba/Infotravel/Sabre/CRM apenas com credenciais autorizadas e sem expor segredos.
6. Testar Secure Forms: LGPD, antispam, sucesso, erro, mobile e persistência.
7. Validar Biblioteca/Hotelaria/Curadoria por perfil, sem exposição pública de condições comerciais.
8. Validar Concierge real antes de retirar manutenção.

## Critério de lançamento

A manutenção pública só deve sair quando os gates P0 do site estiverem PASS e a Área Restrita mínima funcional estiver homologada. Módulos não essenciais podem permanecer marcados EM IMPLEMENTAÇÃO, desde que não sejam apresentados como funcionais nem exponham dados internos.
