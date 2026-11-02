# Contributing

Keep the starter safe by default: idempotent operations, explicit platform checks, no credential provisioning, no automatically started services, no `curl | bash`, and no non-interactive sudo. Back up files before edits. Avoid claiming support until syntax and behavior are checked. Document source and version policy for new tools.

Before a change, run `make check` where Bash is available. PowerShell checks may be run with PSScriptAnalyzer when installed. Keep planned commands honest and document platform limitations.
