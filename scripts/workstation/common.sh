#!/usr/bin/env bash
set -euo pipefail
ROOT="${WORKSTATION_ROOT:-$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)}"
backup_file() { local f="$1"; [[ -e "$f" ]] || return 0; cp -p "$f" "$f.backup.$(date +%Y%m%d%H%M%S)"; }
manager() { if command -v brew >/dev/null 2>&1; then echo brew; elif command -v apt-get >/dev/null 2>&1; then echo apt; elif command -v dnf >/dev/null 2>&1; then echo dnf; elif command -v pacman >/dev/null 2>&1; then echo pacman; else echo none; fi; }
install_pkg() { local m="$1" p="$2"; case "$m" in brew) brew list --versions "$p" >/dev/null 2>&1 || brew install "$p";; apt) dpkg -s "$p" >/dev/null 2>&1 || { echo "SKIP $p: apt requires explicit privileges; install manually."; };; dnf|pacman) echo "SKIP $p: package manager operations require review and explicit privileges.";; *) echo "SKIP $p: no supported manager.";; esac; }
