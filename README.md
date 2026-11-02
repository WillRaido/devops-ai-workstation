# DevOps AI Workstation

**v0.1.0 starter · experimental · Apache-2.0**

A modular bootstrap for macOS, Linux, and Windows on WSL2, aimed at DevOps, security, and AI-assisted engineering. Ghostty is preferred where available; Windows-native terminals use Windows Terminal. This repository is a starter, not a production installer. It has not been validated on real macOS, Linux, or Windows machines.

## Quick start

Inspect the scripts first. On macOS/Linux/WSL2, run `bash install.sh --profile base` (or `full`). On Windows PowerShell, run `./install.ps1 -Profile base`. No credentials are created or authenticated. Installers do not use `sudo` automatically. Package availability and versions depend on the platform package manager and are reported rather than hidden.

`base` installs shell and terminal essentials; `full` also attempts selected cloud, security, and AI CLIs when their platform-native package manager is available. Review `docs/ARCHITECTURE.md` and `docs/ROADMAP.md`. Cloud and AI profiles are planned and are not implemented.

## CLI

`workstation install|update|doctor|cloud|security|ai|theme|skills|mcp|clean`. Only install/update/doctor are implemented initially; other command groups report that they are planned.

## Included tools

Shell: Zsh, Starship, zoxide, fzf, ripgrep, jq, eza, bat, Atuin, tmux. Cloud/dev: AWS CLI, Azure CLI, gcloud, kubectl, Helm, K9s, kubectx, Terraform/OpenTofu, Terragrunt, Docker/Podman, Ansible, Packer. Security: CodeQL, Semgrep, Gitleaks, OSV-Scanner, Trivy, Grype, Syft, Cosign, Checkov, TFLint, actionlint, Zizmor, GitHub CLI. AI: Claude Code, Codex CLI, Cursor, Gemini CLI, Aider. The full inventory is aspirational: each platform's supported package manager determines what's installed. Unsupported items are skipped with a note.

Portable Agent Skills (`SKILL.md`) are in `skills/`. The MCP catalog is documentation only; it recommends narrow, task-scoped permissions and never starts servers.

## Safety

Install is idempotent, backs up config files before replacing them, verifies TLS downloads where applicable, avoids shell-piped installers, and never provisions or stores credentials. Third-party installers can change; inspect them before use. See `CONTRIBUTING.md`.
