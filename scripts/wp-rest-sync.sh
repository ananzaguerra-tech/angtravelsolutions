#!/usr/bin/env bash
set -euo pipefail

manifest="${1:-ops/wordpress/publish-manifest.json}"
base="${WP_BASE_URL%/}"

python3 - "$manifest" <<'PY' > /tmp/wp-sync-lines.jsonl
import json,sys
p=json.load(open(sys.argv[1], encoding='utf-8'))
for item in p.get('items',[]):
    print(json.dumps(item, ensure_ascii=False))
PY

count=0
while IFS= read -r line; do
  [ -n "$line" ] || continue
  endpoint=$(python3 -c 'import json,sys; print(json.loads(sys.argv[1])["endpoint"])' "$line")
  method=$(python3 -c 'import json,sys; print(json.loads(sys.argv[1]).get("method","POST"))' "$line")
  payload_file=$(python3 -c 'import json,sys; print(json.loads(sys.argv[1])["payload_file"])' "$line")
  expected_status=$(python3 -c 'import json,sys; print(json.loads(sys.argv[1]).get("expected_status","publish"))' "$line")

  test -f "$payload_file" || { echo "Missing payload file: $payload_file"; exit 30; }

  code=$(curl --silent --show-error --output /tmp/wp-sync-response.json --write-out "%{http_code}" \
    --user "$WP_USERNAME:$WP_APP_PASSWORD" \
    -X "$method" \
    -H 'Content-Type: application/json' \
    --data-binary "@$payload_file" \
    "$base$endpoint")

  if [[ ! "$code" =~ ^20[01]$ ]]; then
    echo "WordPress sync failed: HTTP $code endpoint=$endpoint"
    cat /tmp/wp-sync-response.json || true
    exit 31
  fi

  python3 - "$expected_status" <<'PY'
import json,sys
p=json.load(open('/tmp/wp-sync-response.json'))
expected=sys.argv[1]
status=p.get('status')
if expected and status and status != expected:
    raise SystemExit(f'Unexpected WordPress status: {status} expected={expected}')
print('WORDPRESS_WRITE_OK', 'id=',p.get('id'),'status=',status,'link=',p.get('link'))
PY
  count=$((count+1))
done < /tmp/wp-sync-lines.jsonl

echo "WORDPRESS_SYNC_COMPLETE items=$count"
