# Déploie vscode-copilot vers un projet cible
# Usage : .\install.ps1 -TargetPath "C:\dev\mon-projet"

param(
    [Parameter(Mandatory = $false)]
    [string]$TargetPath = (Get-Location).Path
)

$SourceRoot = $PSScriptRoot
$TargetPath = Resolve-Path $TargetPath -ErrorAction Stop

Write-Host "Source  : $SourceRoot"
Write-Host "Cible   : $TargetPath"
Write-Host ""

function Copy-MergedDirectory {
    param([string]$RelativePath)
    $src = Join-Path $SourceRoot $RelativePath
    $dst = Join-Path $TargetPath $RelativePath
    if (-not (Test-Path $src)) { return }
    New-Item -ItemType Directory -Path $dst -Force | Out-Null
    Copy-Item -Path (Join-Path $src "*") -Destination $dst -Recurse -Force
    Write-Host "  OK  $RelativePath"
}

Write-Host "Copie des fichiers projet..."
Copy-MergedDirectory ".github"
Copy-MergedDirectory ".vscode"

Write-Host ""
Write-Host "Optionnel — agents utilisateur (tous projets) :"
Write-Host "  Copy-Item '$SourceRoot\.github\agents\*' '$env:USERPROFILE\.copilot\agents\' -Force"
Write-Host ""
Write-Host "Etapes suivantes :"
Write-Host "  1. Ouvrir le projet dans VS Code"
Write-Host "  2. Installer les extensions recommandées (popup ou Extensions > @recommended)"
Write-Host "  3. Command Palette > MCP: List Servers (auth GitHub si demandé)"
Write-Host "  4. Chat Copilot > Agents > Enterprise Principal Review"
