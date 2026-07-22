# Run once after: gh auth login
$ErrorActionPreference = "Stop"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

$repo = "mashboh/Arabic-mashboh-FFXIV"
$ver = "4.2601.722.1326"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

if (-not (Test-Path ".git")) {
  git init -b main
  git add pluginmaster.json README.md images dist/Arabic-mashboh-FFXIV.zip
  git -c user.name=mashboh -c user.email=mashboha@gmail.com commit -m "Initial release: Arabic - mashboh for Dalamud"
}

gh auth status
gh repo create Arabic-mashboh-FFXIV --public --source=. --remote=origin --push --description "Arabic EN→AR translator for FFXIV (Dalamud)"
gh release create "v$ver" "dist/Arabic-mashboh-FFXIV.zip" --title "Arabic - mashboh v$ver" --notes "First public release for Dalamud custom repository."

Write-Host ""
Write-Host "DONE. Custom repo URL:"
Write-Host "https://raw.githubusercontent.com/mashboh/Arabic-mashboh-FFXIV/main/pluginmaster.json"
