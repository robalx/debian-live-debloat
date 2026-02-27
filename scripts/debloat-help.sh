#!/usr/bin/env bash
#
# Debian Live squashfs help/doc remover
#
# usage:
#   sudo ./debloat-help.sh
#   sudo DRYRUN=1 ./debloat-help.sh   -> tylko podgląd (nic nie usuwa)
#

set -euo pipefail

ROOT="squashfs-root"

if [[ ! -d "$ROOT/usr/share" ]]; then
    echo "ERROR: nie znaleziono $ROOT/usr/share"
    exit 1
fi

# --- TRYB DRYRUN ---
if [[ "${DRYRUN:-0}" == "1" ]]; then
    echo "[i] TRYB DRYRUN aktywny (nic nie będzie usunięte)"
    RM="echo rm -rf"
    FINDACTION="-print"
else
    RM="rm -rf"
    FINDACTION="-delete"
fi

echo "[*] Usuwanie katalogów dokumentacji..."

$RM "$ROOT/usr/share/man"
$RM "$ROOT/usr/share/doc"
$RM "$ROOT/usr/share/info"
$RM "$ROOT/usr/share/help"
$RM "$ROOT/usr/share/gnome/help"
$RM "$ROOT/usr/share/gtk-doc"
$RM "$ROOT/usr/share/devhelp"
$RM "$ROOT/usr/share/lintian"
$RM "$ROOT/usr/share/doc-base"

# bardziej agresywne (opcjonalne, ale zostawione aktywne)
$RM "$ROOT/usr/share/common-licenses"
$RM "$ROOT/usr/share/examples"
$RM "$ROOT/usr/share/bug"

echo "[*] README / CHANGELOG / NEWS..."

find "$ROOT/usr" -type f \( \
 -iname "README*" -o \
 -iname "NEWS*" -o \
 -iname "CHANGELOG*" -o \
 -iname "AUTHORS*" -o \
 -iname "THANKS*" -o \
 -iname "TODO*" \
\) $FINDACTION

echo "[*] Dokumenty po rozszerzeniach..."

find "$ROOT/usr/share" -type f \( \
 -iname "*.pdf" -o \
 -iname "*.epub" -o \
 -iname "*.txt" -o \
 -iname "*.md" -o \
 -iname "*.rst" -o \
 -iname "*.html" -o \
 -iname "*.htm" \
\) $FINDACTION

echo "[*] Manpage poza katalogiem man..."

find "$ROOT/usr" -type f -regex '.*\.[1-9]\.gz' $FINDACTION

echo "[*] Gotowe."
