#!/usr/bin/env bash
set -Eeuo pipefail

WP_PATH="${WP_PATH:-/home/u629426131/domains/angtravelsolutions.com.br/public_html}"
SITE_URL="${SITE_URL:-https://angtravelsolutions.com.br}"
STAMP="$(date +%Y%m%d-%H%M%S)"
WORK_DIR="${WP_PATH}/wp-content/ang-recovery-${STAMP}"
LOG_FILE="${WORK_DIR}/repair.log"
ACTIVE_FILE="${WORK_DIR}/active-plugins.txt"
CULPRITS_FILE="${WORK_DIR}/disabled-culprits.txt"

mkdir -p "$WORK_DIR"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "[ANG] Início da recuperação 503: $(date -Is)"
echo "[ANG] WordPress: $WP_PATH"
cd "$WP_PATH"

if ! command -v wp >/dev/null 2>&1; then
  echo "[ERRO] WP-CLI não encontrado."
  exit 1
fi

status_code() {
  curl -L -sS --max-time 30 -o /dev/null -w '%{http_code}' "$SITE_URL" || true
}

is_healthy() {
  local code
  code="$(status_code)"
  echo "[ANG] HTTP atual: $code"
  [[ "$code" =~ ^(200|301|302|303|307|308)$ ]]
}

# Backup reversível antes de qualquer alteração.
echo "[ANG] Exportando banco..."
wp db export "$WORK_DIR/database.sql" --quiet

echo "[ANG] Registrando estado atual..."
wp plugin list --status=active --field=name > "$ACTIVE_FILE" || true
wp theme list --status=active --fields=name,status,version --format=table > "$WORK_DIR/active-theme.txt" || true
wp option get home > "$WORK_DIR/home-url.txt" || true
wp option get siteurl > "$WORK_DIR/site-url.txt" || true

# Correções de baixo risco.
rm -f .maintenance
wp cache flush || true
wp transient delete --all || true
wp rewrite flush --hard || true

if is_healthy; then
  echo "[ANG] Site recuperado com limpeza de manutenção/cache."
  exit 0
fi

# Isolamento automático de plugin com rollback possível.
echo "[ANG] Site ainda indisponível. Iniciando isolamento de plugins."
mapfile -t ACTIVE_PLUGINS < "$ACTIVE_FILE"
wp plugin deactivate --all || true

if ! is_healthy; then
  echo "[ANG] 503 persiste com todos os plugins desativados."
  echo "[ANG] Não alterando o tema automaticamente para preservar o layout."
  echo "[ANG] Verifique logs PHP/LiteSpeed e limites de recursos."
  find "$WP_PATH" -maxdepth 3 -type f \( -name 'error_log' -o -name 'debug.log' \) -print > "$WORK_DIR/error-log-files.txt" || true
  exit 2
fi

: > "$CULPRITS_FILE"
for plugin in "${ACTIVE_PLUGINS[@]}"; do
  [[ -z "$plugin" ]] && continue
  echo "[ANG] Testando plugin: $plugin"
  if wp plugin activate "$plugin"; then
    sleep 2
    if ! is_healthy; then
      echo "$plugin" | tee -a "$CULPRITS_FILE"
      wp plugin deactivate "$plugin" || true
      echo "[ANG] Plugin mantido desativado por causar indisponibilidade: $plugin"
    fi
  else
    echo "$plugin" | tee -a "$CULPRITS_FILE"
    echo "[ANG] Falha ao ativar plugin; mantido desativado: $plugin"
  fi
done

wp cache flush || true
wp rewrite flush --hard || true

if is_healthy; then
  echo "[ANG] Recuperação concluída."
  echo "[ANG] Plugins problemáticos registrados em: $CULPRITS_FILE"
  echo "[ANG] Backup registrado em: $WORK_DIR"
  exit 0
fi

echo "[ANG] A recuperação automática não restabeleceu o site."
exit 3
