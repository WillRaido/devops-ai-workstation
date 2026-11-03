# Architecture

The Bash entry point starts a short interactive wizard when run in a terminal. It detects the platform, package manager, Ghostty, and installed base tools; asks whether to install the missing base tools; optionally accepts a comma-separated selection; offers Ghostty installation on Homebrew; and asks before applying the plan. Explicit arguments support scripted selection.

On macOS, Homebrew installs selected base packages and skips already installed ones. On Linux, apt, dnf, and pacman are detected, but package installation is not yet wired up. The installer never invokes sudo. The `full` profile remains a catalog-only placeholder for cloud, security, and AI tools.

Sample Starship and Zsh files are copied only when the target does not exist. Ghostty themes (Nord, Dracula, Catppuccin Mocha, and Gruvbox Dark) can be selected when Ghostty is available. If a Ghostty config exists, a timestamped copy is made before changing its theme. No credentials or cloud logins are created or inspected.

Windows PowerShell delegates to the Bash installer only from WSL2. Native Windows setup is planned; Windows Terminal is the recommended terminal. Ghostty is preferred where supported. MCP documentation is advisory only, and no MCP server is launched.
