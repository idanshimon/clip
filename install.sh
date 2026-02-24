#!/usr/bin/env bash
set -euo pipefail

PREFIX="${1:-/usr/local}"
BINDIR="${PREFIX}/bin"

if [ ! -d "$BINDIR" ]; then
  echo "Creating ${BINDIR}..."
  mkdir -p "$BINDIR"
fi

cp clip "$BINDIR/clip"
chmod +x "$BINDIR/clip"

echo "✓ Installed clip to ${BINDIR}/clip"
echo "  Make sure ${BINDIR} is in your PATH."
