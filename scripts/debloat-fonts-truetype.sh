#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root/usr/share/fonts/truetype"

cd "$ROOT"

echo "[*] Truetype deep cleanup..."

rm -rf lohit-* \
       fonts-deva-extra \
       fonts-beng-extra \
       fonts-gujr-extra \
       fonts-telu-extra \
       teluguvijayam \
       malayalam \
       dzongkha \
       khmeros \
       annapurna \
       samyak* \
       fonts-arabeyes \
       farsiweb \
       scheherazade \
       sahel \
       vazirmatn \
       fonts-ukij-uyghur \
       unikurdweb \
       culmus \
       vlgothic \
       ancient-scripts \
       abyssinica \
       fonts-bpg-georgian \
       andika || true

echo "[*] Czyszczenie cache..."
rm -rf ../../../../var/cache/fontconfig/* || true

echo "[*] Truetype cleanup finished."
