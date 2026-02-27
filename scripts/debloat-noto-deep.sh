#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root/usr/share/fonts/truetype/noto"
cd "$ROOT"

echo "[*] Deep noto cleanup..."

rm -f NotoSansDisplay* \
      NotoSerifDisplay* \
      NotoMusic* \
      NotoMath* \
      NotoSansSymbols* \
      NotoSansSymbols2* \
      NotoSansAdlam* \
      NotoSansBrahmi* \
      NotoSansOld* \
      NotoSansRunic* \
      NotoSansCuneiform* \
      NotoSansEgyptian* \
      NotoSansLinearB* \
      NotoSansPhoenician* \
      NotoSansOgham* \
      NotoSansYi* \
      NotoSerifYi* || true

echo "[*] Clear font cache..."
rm -rf ../../../../var/cache/fontconfig/* || true

echo "[*] Noto deep cleanup finished."
