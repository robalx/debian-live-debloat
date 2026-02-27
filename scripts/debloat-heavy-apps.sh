#!/usr/bin/env bash
set -euo pipefail

ROOT="squashfs-root"

echo "[*] Removing LibreOffice..."
rm -rf "$ROOT/usr/lib/libreoffice" || true
rm -rf "$ROOT/usr/share/libreoffice" || true
rm -f  "$ROOT/usr/share/applications/libreoffice"* || true

echo "[*] Removing Thunderbird..."
rm -rf "$ROOT/usr/lib/thunderbird" || true
rm -rf "$ROOT/usr/share/thunderbird" || true
rm -f  "$ROOT/usr/share/applications/thunderbird"* || true

echo "[*] Cleaning leftover icons..."
find "$ROOT/usr/share/icons" -type f -iname "*libreoffice*" -delete 2>/dev/null || true
find "$ROOT/usr/share/icons" -type f -iname "*thunderbird*" -delete 2>/dev/null || true

echo "[*] Cleaning MIME leftovers..."
rm -f "$ROOT/usr/share/mime/packages/libreoffice"* 2>/dev/null || true
rm -f "$ROOT/usr/share/mime/packages/thunderbird"* 2>/dev/null || true

echo "[*] Heavy apps removed."
