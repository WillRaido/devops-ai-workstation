[CmdletBinding()] param([ValidateSet('base','full')][string]$Profile='base')
$ErrorActionPreference='Stop'
Write-Host "DevOps AI Workstation v0.1.0 (experimental) — profile: $Profile"
if (-not $env:WSL_DISTRO_NAME) { Write-Warning 'Windows-native bootstrap is planned; Windows Terminal is the recommended terminal. No changes made.'; exit 0 }
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
& bash (Join-Path $root 'scripts/bootstrap.sh') --profile $Profile
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
