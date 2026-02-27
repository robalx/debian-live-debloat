#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root"

if [[ ! -d "$ROOT" ]]; then
    echo "Brak katalogu squashfs-root"
    exit 1
fi

echo "[*] Skanowanie brakujących bibliotek ELF..."
echo

FOUND=0

# szukamy plików wykonywalnych
while IFS= read -r -d '' file; do
    MISSING=$(ldd "$file" 2>/dev/null | grep "not found" || true)

    if [[ -n "$MISSING" ]]; then
        echo "=== $file ==="
        echo "$MISSING"
        echo
        FOUND=1
    fi
done < <(find "$ROOT" -type f -executable -print0)

if [[ "$FOUND" -eq 0 ]]; then
    echo "[OK] Nie znaleziono brakujących bibliotek."
fi
