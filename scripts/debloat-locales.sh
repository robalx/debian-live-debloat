#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root/usr/share/locale"

# Locale które zostają
KEEP=(
    pl
    pl_PL
    en
    en_US
    en_GB
)

if [[ ! -d "$ROOT" ]]; then
    echo "[ERROR] Brak katalogu: $ROOT"
    exit 1
fi

echo "[*] Locale cleanup started"
echo "[*] Keeping: ${KEEP[*]}"

cd "$ROOT"

for d in *; do
    # Pomiń pliki (np. locale.alias)
    [[ -d "$d" ]] || continue

    keep=false

    for k in "${KEEP[@]}"; do
        if [[ "$d" == "$k" ]]; then
            keep=true
            break
        fi
    done

    if $keep; then
        echo "[KEEP] $d"
    else
        echo "[REMOVE] $d"
        rm -rf -- "$d"
    fi
done

echo "[*] Locale cleanup finished."