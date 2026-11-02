#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE=base
while (($#)); do case "$1" in --profile) PROFILE="${2:?missing profile}"; shift 2;; -h|--help) echo 'Usage: install.sh [--profile base|full]'; exit 0;; *) echo "Unknown option: $1" >&2; exit 2;; esac; done
[[ $PROFILE == base || $PROFILE == full ]] || { echo 'Profile must be base or full' >&2; exit 2; }
case "$(uname -s)" in Darwin|Linux) ;; *) echo 'Unsupported host; use macOS/Linux/WSL2.' >&2; exit 1;; esac
if [[ -z "${WSL_DISTRO_NAME:-}" && "$(uname -s)" == Linux && -n "${WSL_INTEROP:-}" ]]; then :; fi
command -v workstation >/dev/null 2>&1 && echo 'Existing workstation command found; using repository scripts for this run.'
export WORKSTATION_ROOT="$ROOT"
bash "$ROOT/scripts/workstation/install" --profile "$PROFILE"
echo 'Starter bootstrap completed. Review skipped tools and limitations above.'
