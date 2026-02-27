#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root/usr/share/locale"

if [[ ! -d "$ROOT" ]]; then
    echo "Brak katalogu locale"
    exit 1
fi

echo "[*] Zostają tylko: pl, en"

cd "$ROOT"

for d in *; do
    case "$d" in
        pl|en)
            echo "[KEEP] $d"
            ;;
        *)
            echo "rm -rf $d"
            rm -rf "$d"
            ;;
    esac
done

echo "[*] Locale cleanup finished."
