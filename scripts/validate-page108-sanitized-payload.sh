#!/usr/bin/env bash
set -euo pipefail

payload="${1:-ops/wordpress/ANG_C415_PAGE108_SANITIZED_PAYLOAD.json}"

command -v jq >/dev/null || { echo "ERROR: jq is required" >&2; exit 2; }
[[ -f "$payload" ]] || { echo "ERROR: payload not found: $payload" >&2; exit 2; }

jq -e '
  .page_id == 108 and
  .baseline_revision_id == 153632 and
  .mode == "OFFLINE_STAGING_ONLY" and
  .publication_authorized == false and
  .validation.all_forbidden_zero == true and
  .validation.labels_preserved == true and
  .validation.label_count == 14 and
  (.preserved_labels | type == "array" and length == 14) and
  (.sanitized_content | type == "string" and length > 0)
' "$payload" >/dev/null

mapfile -t labels < <(jq -r '.preserved_labels[]' "$payload")
sanitized="$(jq -r '.sanitized_content' "$payload")"

for label in "${labels[@]}"; do
  [[ "$sanitized" == *"$label"* ]] || {
    echo "ERROR: preserved label missing from sanitized_content: $label" >&2
    exit 1
  }
done

forbidden=(
  'data-map-address'
  'ang-address-map'
  'google.com/maps?q='
  '<iframe'
  'Avenida Doutor José Bonifácio'
  'Rua Peru, 636'
  'Avenida Paulista'
  'Olegário Maciel'
)

for token in "${forbidden[@]}"; do
  if grep -Fqi -- "$token" <<<"$sanitized"; then
    echo "ERROR: forbidden token found in sanitized_content: $token" >&2
    exit 1
  fi
  [[ "$(jq -r --arg token "$token" '.validation.forbidden_occurrences[$token]' "$payload")" == "0" ]] || {
    echo "ERROR: non-zero validation counter for: $token" >&2
    exit 1
  }
done

actual_length="$(jq -r '.sanitized_content | length' "$payload")"
declared_length="$(jq -r '.validation.sanitized_raw_length' "$payload")"
[[ "$actual_length" == "$declared_length" ]] || {
  echo "ERROR: sanitized length mismatch: actual=$actual_length declared=$declared_length" >&2
  exit 1
}

echo "PASS page=108 revision=153632 labels=${#labels[@]} forbidden=0 publication_authorized=false"
