# GORDON — EXECUÇÃO SEM LOGIN — 17/08/2026

Objetivo: continuar produzindo sem depender de login no PowerShell, GitHub, Hostinger ou n8n.

## Regra principal
PowerShell não exige login para executar comandos locais. Se houver bloqueio de autenticação em algum serviço, registrar o serviço exato e continuar imediatamente nas tarefas locais/staging abaixo.

## Fonte de código
Repositório público: https://github.com/ananzaguerra-tech/angtravelsolutions.git
Branch segura: development
Branch de integração: staging
Não tocar em main/produção.

## Sequência imediata

```powershell
$ErrorActionPreference = 'Stop'
$work = "$HOME\ang_gordon_workspace"
New-Item -ItemType Directory -Force -Path $work | Out-Null
Set-Location $work

if (-not (Test-Path '.\angtravelsolutions\.git')) {
  git clone https://github.com/ananzaguerra-tech/angtravelsolutions.git
}

Set-Location '.\angtravelsolutions'
git fetch origin --prune
git checkout development
git pull --ff-only origin development

git status
git branch -a
git log --oneline -n 20
```

Se `git pull` pedir autenticação por alguma razão, NÃO travar. O repositório é público: apagar somente a cópia local incompleta e repetir o clone HTTPS em pasta nova; não mexer em credenciais globais nem em produção.

## Trabalho que independe totalmente de login externo

1. Inventariar arquivos de theme/plugin/scripts/docs existentes nas branches development e staging.
2. Comparar development x staging e registrar diff.
3. Localizar referências de V13, layout, front-page, theme.css, functions.php, buscador Wooba, Área Restrita, Privilege, Luxury Brazil, MICE, Business Travel, Celebrations, Sustentabilidade e Conteúdo Global.
4. Rodar validações locais disponíveis: git diff --check, JSON, JavaScript, Python e shell.
5. NÃO instalar versões inferiores às registradas em produção: tema 1.8.4 e ANG Enterprise Suite 2.14.1 são referências mínimas de produção.
6. NÃO publicar os 881 registros de curadoria. Permanecem HOLD até quality gate.
7. NÃO alterar ANG Connect localhost:8088, containers, volumes, DB, rotas ou n8n.
8. NÃO remover manutenção.
9. Gerar relatório local `GORDON_RELATORIO_SEM_LOGIN_2026-08-17.md` contendo:
   - EXECUTADO
   - DIFF DEVELOPMENT x STAGING
   - ARQUIVOS V13 LOCALIZADOS
   - COMPONENTES AUSENTES
   - TESTES/PASS/FAIL
   - BLOQUEIOS EXATOS POR SERVIÇO
   - PRÓXIMA AÇÃO SEM LOGIN

## Prioridade técnica
A prioridade não é tentar login repetidamente. A prioridade é consolidar o V13 e os componentes recuperados em código auditável, com diff e testes locais, para staging posterior.

## Proibição
Não informar “aguardando login” como estado geral. Login bloqueia somente a ação externa específica; todas as demais tarefas locais devem continuar.
