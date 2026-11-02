# Architecture

The Bash entry point dispatches to small scripts under `scripts/workstation/`. The `base` profile is currently implemented only as a Homebrew installer for macOS. On Linux, the script detects apt, dnf, or pacman but does not install packages; users choose their distribution-specific package workflow. `full` currently installs no additional tools and reports that cloud, security, and AI profiles are planned.

The sample Starship and Zsh files are copied only when their destinations do not exist. The installer does not overwrite user configuration, authenticate to services, provision credentials, or invoke sudo. `doctor` reports platform, package manager, and availability of shell tools without inspecting credentials.

Windows PowerShell delegates to the Bash installer only from WSL2. Native Windows setup is planned; Windows Terminal is the recommended terminal. Ghostty is the preferred terminal where supported. MCP documentation is advisory only, and no MCP server is launched.
