# PowerShell script to render all Quarto posts
# Usage: .\render-all.ps1

Write-Host "🚀 Rendering all Quarto posts..." -ForegroundColor Cyan

# Change to quarto-posts directory
Set-Location $PSScriptRoot

# Render all posts
quarto render

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ All posts rendered successfully!" -ForegroundColor Green
    Write-Host "📁 Output location: ../blog/" -ForegroundColor Yellow
    
    # List generated files
    Write-Host "`nGenerated files:" -ForegroundColor Cyan
    Get-ChildItem -Path "../blog" -Filter "*.html" | 
        Where-Object { $_.LastWriteTime -gt (Get-Date).AddMinutes(-5) } |
        ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor Gray }
} else {
    Write-Host "❌ Rendering failed!" -ForegroundColor Red
    exit 1
}

