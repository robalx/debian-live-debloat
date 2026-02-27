#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root/usr/share/fonts/truetype/noto"
cd "$ROOT"

echo "[*] Removing heavy NotoSerif variants..."

rm -f NotoSerif-*.ttf
rm -f NotoSerifTangut-*.ttf
rm -f NotoSansSignWriting-*.ttf

echo "[*] Clearing font cache..."
rm -rf ../../../../var/cache/fontconfig/* || true

echo "[*] Noto serif cleanup done."
