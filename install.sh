#!/usr/bin/env bash
set -euo pipefail

REPO="idanshimon/clip"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

PREFIX="${1:-/usr/local}"
BINDIR="${PREFIX}/bin"

detect_os() {
  case "$(uname -s)" in
    Darwin*)  echo "macos" ;;
    Linux*)   echo "linux" ;;
    MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
    *)        echo "unknown" ;;
  esac
}

OS="$(detect_os)"

echo "Detected OS: ${OS}"

if [ ! -d "$BINDIR" ]; then
  echo "Creating ${BINDIR}..."
  mkdir -p "$BINDIR"
fi

case "$OS" in
  macos|linux)
    if command -v curl &>/dev/null; then
      curl -fsSL "${BASE_URL}/clip" -o "${BINDIR}/clip"
    elif command -v wget &>/dev/null; then
      wget -qO "${BINDIR}/clip" "${BASE_URL}/clip"
    else
      echo "Error: curl or wget is required" >&2
      exit 1
    fi
    chmod +x "${BINDIR}/clip"
    echo "✓ Installed clip to ${BINDIR}/clip"
    ;;
  windows)
    echo "On Windows, download clip.bat or clip.ps1 from:"
    echo "  ${BASE_URL}/clip.bat"
    echo "  ${BASE_URL}/clip.ps1"
    echo "and place it in a folder in your PATH."
    exit 0
    ;;
  *)
    echo "Error: Unsupported OS '$(uname -s)'" >&2
    exit 1
    ;;
esac

echo "  Make sure ${BINDIR} is in your PATH."
