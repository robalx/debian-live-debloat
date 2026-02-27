#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root/usr/share/fonts"

if [[ ! -d "$ROOT" ]]; then
    echo "Brak katalogu fonts"
    exit 1
fi

echo "[*] Usuwanie dużych fontów CJK / RTL..."

rm -rf "$ROOT"/opentype/noto/Noto*CJK*
rm -rf "$ROOT"/truetype/noto/Noto*CJK*
rm -rf "$ROOT"/truetype/noto/NotoSansArabic*
rm -rf "$ROOT"/truetype/noto/NotoNaskhArabic*
rm -rf "$ROOT"/truetype/noto/NotoSansHebrew*
rm -rf "$ROOT"/truetype/noto/NotoSansThai*
rm -rf "$ROOT"/truetype/noto/NotoSansJP*
rm -rf "$ROOT"/truetype/noto/NotoSansKR*

echo "[*] Czyszczenie cache fontconfig..."
rm -rf squashfs-root/var/cache/fontconfig/* || true

echo "[*] Font cleanup finished."
