#!/usr/bin/env bash
set -Eeuo pipefail

search_root="${1:-.}"
pattern='(BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY|Authorization:[[:space:]]*Bearer[[:space:]]+[A-Za-z0-9._~-]{16,}|client_secret[[:space:]]*=[[:space:]]*[^[:space:]<]+)'

set +e
grep -RIlE --exclude-dir=.git --exclude-dir=upstream "$pattern" "$search_root"
secret_scan_status=$?
set -e

case "$secret_scan_status" in
  0)
    echo 'Control-plane secret pattern detected.' >&2
    exit 1
    ;;
  1)
    exit 0
    ;;
  *)
    echo "Secret scan failed before completing (grep status ${secret_scan_status})." >&2
    exit "$secret_scan_status"
    ;;
esac
