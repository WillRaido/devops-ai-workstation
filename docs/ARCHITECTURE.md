# Architecture

The Bash bootstrap delegates to small CLI scripts. `base` is terminal-focused; `full` makes best-effort package-manager attempts. Cloud and AI profiles are planned. macOS uses Homebrew when present. Linux package installation is intentionally skipped unless it can be done without privilege surprises; package names differ by distribution. Windows PowerShell currently delegates only inside WSL2; native support is planned and Windows Terminal is recommended.

Config samples are copied only when a target does not exist. Existing files are preserved. Backups are required before any future replacement feature. The MCP catalog is informational and no server is started.
