#!/usr/bin/env bash
set -euo pipefail
root="$(cd -- "$(dirname "$0")/.." && pwd)"
[[ -f "$root/README.md" && -x "$root/install.sh" ]]
bash -n "$root/install.sh" "$root/scripts/bootstrap.sh" "$root/scripts/workstation/install" "$root/scripts/workstation/doctor" "$root/scripts/workstation/workstation"
help=$(bash "$root/scripts/workstation/workstation" --help)
[[ $help == *"install"* && $help == *"mcp"* ]]
if bash "$root/scripts/workstation/workstation" mcp; then exit 1; else rc=$?; [[ $rc -eq 3 ]]; fi
echo 'Smoke checks passed.'
