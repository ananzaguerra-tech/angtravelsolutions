# Rollback seguro

## Princípios
- Nenhum rollback destrutivo ou sem backup.
- Nunca apagar banco, uploads, containers ou volumes.
- Nunca remover o ANG Connect.
- Produção permanece em manutenção durante recuperação.

## Código
1. Registrar o SHA atual.
2. Identificar o último commit validado.
3. Criar branch de segurança apontando para o estado atual.
4. Preferir `git revert` a reescrita de histórico.
5. Não usar `git reset --hard` nem force push.
6. Executar novamente os workflows de validação e embalagem.

## Plugin no staging
1. Desativar somente o plugin testado, se necessário.
2. Restaurar a versão anterior a partir do pacote verificado.
3. Conferir checksum.
4. Reativar somente no staging.
5. Validar páginas, logs e saúde.

## Conteúdo
- Importações devem criar rascunhos.
- Antes da importação, registrar IDs e estado anterior.
- Para desfazer, restaurar somente os itens do job identificado.
- Não excluir conteúdo aprovado sem backup.

## Produção
Rollback de produção exige comando explícito da proprietária e:
- backup completo verificado;
- registro do incidente;
- identificação exata do alvo;
- plano de validação pós-rollback;
- preservação do ANG Connect e de todos os dados.
