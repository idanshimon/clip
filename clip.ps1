<#
.SYNOPSIS
    Copy file contents to clipboard.
.DESCRIPTION
    clip.ps1 - Cross-platform clipboard copy using PowerShell.
    Works on Windows, macOS, and Linux (PowerShell 7+).
.EXAMPLE
    ./clip.ps1 myfile.txt
#>

param(
    [Parameter(Position = 0)]
    [string]$File,

    [Alias("h")]
    [switch]$Help,

    [Alias("v")]
    [switch]$Version
)

$AppVersion = "1.0.0"

if ($Help) {
    Write-Host "clip v$AppVersion - Copy file contents to clipboard"
    Write-Host ""
    Write-Host "Usage: clip.ps1 <file>"
    Write-Host ""
    Write-Host "Options:"
    Write-Host "  -Help, -h       Show this help message"
    Write-Host "  -Version, -v    Show version"
    exit 0
}

if ($Version) {
    Write-Host "clip v$AppVersion"
    exit 0
}

if (-not $File) {
    Write-Host "clip v$AppVersion - Copy file contents to clipboard" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage: clip.ps1 <file>"
    Write-Host "Run 'clip.ps1 -Help' for more info."
    exit 1
}

if (-not (Test-Path -Path $File -PathType Leaf)) {
    Write-Error "Error: '$File' is not a file"
    exit 1
}

$content = Get-Content -Path $File -Raw
Set-Clipboard -Value $content

$lines = (Get-Content -Path $File).Count
Write-Host "✓ Copied $lines lines from '$File' to clipboard" -ForegroundColor Green
