#!/usr/bin/env bash
set -euo pipefail

mksquashfs squashfs-root filesystem.squashfs \
-comp xz \
-b 1M \
-Xdict-size 100%