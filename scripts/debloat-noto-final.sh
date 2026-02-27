#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root/usr/share/fonts/truetype/noto"
cd "$ROOT"

echo "[*] Final noto cleanup..."

# egzotyczne skrypty
rm -f NotoSerifTibetan-*.ttf
rm -f NotoNastaliqUrdu-*.ttf
rm -f NotoSansMath-*.ttf

# warianty typograficzne których GNOME nie używa
rm -f NotoSans-*Condensed*.ttf
rm -f NotoSans-*ExtraCondensed*.ttf
rm -f NotoSans-*SemiCondensed*.ttf
rm -f NotoSans-*Black*.ttf
rm -f NotoSans-*ExtraBold*.ttf
rm -f NotoSans-*Thin*.ttf
rm -f NotoSans-*Light*.ttf
rm -f NotoSans-*Medium*.ttf

echo "[*] Clearing font cache..."
rm -rf ../../../../var/cache/fontconfig/* || true

echo "[*] Final noto cleanup done."
