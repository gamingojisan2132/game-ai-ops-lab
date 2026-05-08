$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot

$requiredPaths = @(
    "AGENTS.md",
    "README.md",
    "docs/TASKS.md",
    "docs/DECISIONS.md",
    "docs/WORKLOG.md",
    "docs/GAME_IDEAS.md",
    "docs/REVIEW_GUIDE.md",
    "prompts/setup.md",
    "prompts/next_task.md",
    "prompts/review.md",
    "scripts/check-repo.ps1",
    "public/assets/images/.gitkeep",
    "public/assets/audio/.gitkeep",
    ".github/workflows/build.yml"
)

$missing = @()

foreach ($path in $requiredPaths) {
    $fullPath = Join-Path $root $path
    if (-not (Test-Path -LiteralPath $fullPath)) {
        $missing += $path
    }
}

if ($missing.Count -gt 0) {
    Write-Host "Required files or directories are missing."
    foreach ($path in $missing) {
        Write-Host "- $path"
    }
    exit 1
}

Write-Host "Repository structure check passed."
