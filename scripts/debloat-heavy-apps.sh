#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root"

echo "[*] Removing LibreOffice..."
rm -rf "$ROOT/usr/lib/libreoffice" || true
rm -rf "$ROOT/usr/share/libreoffice" || true
rm -f "$ROOT/usr/share/applications/libreoffice"* || true

echo "[*] Removing Thunderbird..."
rm -rf "$ROOT/usr/lib/thunderbird" || true
rm -rf "$ROOT/usr/share/thunderbird" || true
rm -f "$ROOT/usr/share/applications/thunderbird"* || true

echo "[*] Removing Firefox language packs..."
find "$ROOT/usr/lib/firefox-esr" -type f -name 'langpack-*.xpi' -delete 2>/dev/null || true

echo "[*] Removing dictionaries..."
rm -rf "$ROOT/usr/share/hunspell" || true
rm -rf "$ROOT/usr/share/myspell" || true
rm -rf "$ROOT/usr/share/mythes" || true

echo "[*] Removing unused locales..."
find "$ROOT/usr/share/locale" -mindepth 1 -maxdepth 1 ! -name pl ! -name en ! -name 'en_GB' -exec rm -rf {} + 2>/dev/null || true

echo "[*] Removing documentation..."
rm -rf "$ROOT/usr/share/doc" || true
rm -rf "$ROOT/usr/share/help" || true
rm -rf "$ROOT/usr/share/man" || true
rm -rf "$ROOT/usr/share/info" || true
rm -rf "$ROOT/usr/share/lintian" || true
rm -rf "$ROOT/usr/share/gnome/help" || true

echo "[*] Cleaning leftover icons..."
find "$ROOT/usr/share/icons" -type f -iname "*libreoffice*" -delete 2>/dev/null || true
find "$ROOT/usr/share/icons" -type f -iname "*thunderbird*" -delete 2>/dev/null || true

echo "[*] Cleaning MIME leftovers..."
rm -f "$ROOT/usr/share/mime/packages/libreoffice"* 2>/dev/null || true
rm -f "$ROOT/usr/share/mime/packages/thunderbird"* 2>/dev/null || true

echo "[*] Heavy apps and unnecessary files removed."