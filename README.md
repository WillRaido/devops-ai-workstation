<div align="center">

# DEVOPS AI WORKSTATION

### Your engineering environment, composed with intent.

**A practical, safety-first starter for DevOps, security, and AI-assisted work.**  
macOS · Linux · WSL2 &nbsp; / &nbsp; Ghostty preferred · Windows Terminal on native Windows

[Get started](#get-started) · [Themes & screenshots](#themes-and-installer-screens) · [Choose tools](#choose-tools-and-personalize) · [What’s inside](#the-workstation) · [Roadmap](docs/ROADMAP.md)

![Terminal preview of the DevOps AI Workstation](assets/workstation-preview.svg)

**v0.1.0 · Experimental starter · Apache-2.0**

</div>

---

## A calmer command line for serious work

The goal is one coherent workstation: a fast shell, useful navigation, cloud and Kubernetes tooling, security checks, and AI coding assistants—with clear boundaries around what gets installed and what still needs your choice.

This repository is the first, intentionally small foundation. The visual above is a **design preview**, not a screenshot of a completed installation. Profiles for cloud and AI, native Windows setup, and several tool installers are still on the roadmap.

## Get started

Copy this command to clone the project and start the interactive installer:

```bash
git clone https://github.com/WillRaido/devops-ai-workstation.git && cd devops-ai-workstation && ./install.sh --profile base
```

On Windows, open PowerShell in WSL2 and run the same command. For a native Windows terminal, use Windows Terminal; native PowerShell setup is not implemented yet.

The installer walks through the choices in the console. In a capable terminal, use ↑/↓ to move, Space to select tools, and Enter to continue; theme choices use ↑/↓ and Enter. Press `a` to select all base tools or `c` to clear the selection. It checks for existing base tools and Ghostty, and optionally sets a custom Zsh welcome message such as `WillDevOps`. It previews the plan and asks before applying it. Already installed packages are skipped. Existing Zsh and Starship configuration files are preserved. If you opt into the welcome message, the installer backs up an existing `.zshrc` before adding its startup hook. The ASCII style uses `figlet` for large letters when available and otherwise shows a framed banner. In terminals without interactive arrow-key support, text prompts remain available.

On macOS, Homebrew installs selected tools. On Linux, the wizard detects apt, dnf, or pacman but does not install packages yet; it never invokes `sudo`. If Ghostty is detected or you choose to install it through Homebrew, you can select Nord, Dracula, Catppuccin Mocha, or Gruvbox Dark. When a Ghostty config already exists, the installer saves a timestamped backup before changing its theme. Ghostty also provides a larger built-in theme list through `ghostty +list-themes`. Other platform package integrations and full cloud/security/AI profiles remain planned.

You can also pass choices directly, for example `./install.sh --with zsh,starship,fzf --theme Nord --welcome WillDevOps`. Run `./install.sh --help` to see options. Review the scripts before running them if you want to see exactly what they do.

## Themes and installer screens

These are visual previews of the available choices and setup flow. They are **illustrative mockups**, not screenshots of a completed installation.

### Ghostty themes

Choose Nord, Dracula, Catppuccin Mocha, or Gruvbox Dark during setup. To see the full theme list available in your installed Ghostty, run `ghostty +list-themes`.

![Visual previews of four Ghostty themes: Nord, Dracula, Catppuccin Mocha, and Gruvbox Dark](assets/theme-gallery.svg)

### Console setup

The wizard detects tools already installed, asks which missing base tools to add, offers Ghostty and a theme, then lets you set an optional Zsh welcome banner such as `WillDevOps`. It shows the plan and asks before applying it.

![Illustrative screenshot of the interactive terminal installer](assets/installer-walkthrough.svg)

## Choose tools and personalize

Start the guided flow:

```bash
bash ./install.sh
```

In the interactive tool list, move with ↑/↓, press Space to mark or unmark an item, and Enter to continue. Press `a` to select all or `c` to clear. Already installed packages are skipped. The current selectable base list is Zsh, Starship, zoxide, fzf, ripgrep, jq, eza, bat, Atuin, tmux, and figlet.

You can also pass selections directly:

```bash
./install.sh --with zsh,starship,fzf
./install.sh --theme Nord --welcome 'WillDevOps' --welcome-style ascii
./install.sh --welcome 'Platform Team' --welcome-style plain
./scripts/workstation/workstation doctor
```

The ASCII welcome style prints large letters with `figlet` when installed; otherwise it uses a text frame. The plain style prints a short decorated line. The banner waits until Zsh has finished initializing and displays just before the first prompt, so it does not write to the shell startup stream used by Powerlevel10k instant prompt. If an existing `.zshrc` needs a startup hook, the installer saves a timestamped backup first. Ghostty theme changes also back up an existing config.

To inspect supported options and examples:

```bash
./install.sh --help
```

Cloud, security, AI, `workstation theme`, `workstation skills`, and `workstation mcp` management are planned; the current installer does not claim to install those tools yet.

### Check your setup

```bash
./scripts/workstation/workstation doctor
```

The `doctor` command reports platform and shell-tool availability. It does not inspect credentials or sign in to cloud services.

## The workstation

| Layer | Included in the starter | Status |
| --- | --- | --- |
| **Shell** | Zsh, Starship, zoxide, fzf, ripgrep, jq, eza, bat, Atuin, tmux, figlet | Base profile; Homebrew installs on macOS |
| **Cloud & delivery** | AWS CLI, Azure CLI, gcloud, kubectl, Helm, K9s, kubectx, Terraform/OpenTofu, Terragrunt, Docker/Podman, Ansible, Packer | Cataloged; managed profile planned |
| **Security** | CodeQL, Semgrep, Gitleaks, OSV-Scanner, Trivy, Grype, Syft, Cosign, Checkov, TFLint, actionlint, Zizmor, GitHub CLI | Cataloged; managed profile planned |
| **AI** | Claude Code, Codex CLI, Cursor, Gemini CLI, Aider | Cataloged; managed profile planned |
| **Agent Skills** | Terraform review, GHAS triage, Kubernetes operations (`SKILL.md`) | Starter examples included |
| **MCP** | Least-privilege catalog guidance | Documentation only; no servers start automatically |

Commands `install` and `doctor` work in this starter. `update`, `cloud`, `security`, `ai`, `theme`, `skills`, `mcp`, and `clean` clearly report that they are planned.

## Built around trust

- **You stay in control:** no credentials, cloud logins, or MCP servers are provisioned or started.
- **No privilege surprises:** no automatic `sudo`; Linux package installation is left to the user.
- **Your settings are respected:** existing Zsh and Starship configuration is preserved.
- **No hidden download pipeline:** no `curl | bash`; inspectable scripts live in this repository.
- **Honest support status:** package coverage varies by platform, and this starter has not been tested on real macOS, Linux, or Windows machines.

## Explore

- [Screenshots, themes, and command guide](docs/SHOWCASE.md)
- [Architecture and platform behavior](docs/ARCHITECTURE.md)
- [Tool inventory and installation status](docs/MANIFEST.md)
- [MCP least-privilege guidance](docs/MCP-CATALOG.md)
- [Roadmap](docs/ROADMAP.md)

---

<div align="center">

**A useful workstation should feel intentional—and stay understandable.**

</div>
