# Gordon — teste local seguro do staging

## Objetivo
Validar o pacote ANG Enterprise Suite em ambiente local isolado, sem alterar o WordPress público e sem tocar no ANG Connect em `http://localhost:8088`.

## Proibições
- Não parar, reiniciar, remover ou recriar containers existentes.
- Não usar `docker compose down`, `docker stop`, `docker rm`, `docker volume rm` ou `docker system prune`.
- Não alterar o banco de produção.
- Não publicar páginas.
- Não executar `deploy/emergency-repair-503.sh`.
- Não imprimir variáveis de ambiente, tokens ou senhas.

## Inventário obrigatório, somente leitura
```powershell
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"
docker compose ls
curl.exe -s -o NUL -w "ANG_CONNECT_HTTP=%{http_code} TEMPO=%{time_total}s\n" http://localhost:8088/
curl.exe -s -o NUL -w "SITE_PUBLICO_HTTP=%{http_code} TEMPO=%{time_total}s\n" https://angtravelsolutions.com.br/
```

## Preparação
1. Confirmar que a branch local é `staging`.
2. Confirmar árvore limpa com `git status --short`.
3. Localizar o artefato `ang-enterprise-suite-staging`.
4. Conferir o SHA-256 antes de extrair.
5. Criar uma pasta temporária exclusiva para o teste.

## Validação estática
- Executar `php -l` em todos os arquivos PHP.
- Validar todos os JSON.
- Confirmar ausência de `.env`, `wp-config.php`, SQL, PEM e chaves privadas.
- Confirmar versão do plugin: `0.3.0`.

## Teste no WordPress local isolado
1. Fazer snapshot/backup verificável do ambiente de teste.
2. Copiar o plugin somente para o WordPress local de staging.
3. Não ativar no WordPress público.
4. Ativar apenas no ambiente isolado.
5. Abrir Ferramentas → ANG Importador.
6. Usar somente **Pré-visualizar e validar**.
7. Confirmar no relatório:
   - `mode = preview_only`;
   - `writes_performed = 0`;
   - 8 países;
   - 16 cidades;
   - nenhum erro.
8. Confirmar que nenhuma página foi criada ou atualizada.
9. Confirmar que `localhost:8088` continua respondendo.

## Evidências esperadas
- Lista sanitizada de containers e portas.
- HTTP e tempo de resposta.
- Resultado do PHP lint.
- Resultado da validação JSON.
- SHA-256 do pacote.
- Relatório de pré-visualização.
- Contagem de páginas antes e depois, obrigatoriamente igual.
- Nenhum segredo nos logs.
