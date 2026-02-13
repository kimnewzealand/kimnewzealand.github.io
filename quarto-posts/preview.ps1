# PowerShell script to preview a Quarto post with live reload
# Usage: .\preview.ps1 example-python-analysis.qmd

param(
    [Parameter(Mandatory=$true)]
    [string]$FileName
)

Write-Host "👀 Starting preview for $FileName..." -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the preview server" -ForegroundColor Yellow

# Change to quarto-posts directory
Set-Location $PSScriptRoot

# Check if file exists
if (-not (Test-Path $FileName)) {
    Write-Host "❌ File not found: $FileName" -ForegroundColor Red
    exit 1
}

# Start preview server
quarto preview $FileName

