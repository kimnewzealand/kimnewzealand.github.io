# PowerShell script to render a single Quarto post
# Usage: .\render-single.ps1 example-python-analysis.qmd

param(
    [Parameter(Mandatory=$true)]
    [string]$FileName
)

Write-Host "🚀 Rendering $FileName..." -ForegroundColor Cyan

# Change to quarto-posts directory
Set-Location $PSScriptRoot

# Check if file exists
if (-not (Test-Path $FileName)) {
    Write-Host "❌ File not found: $FileName" -ForegroundColor Red
    exit 1
}

# Render the post
quarto render $FileName

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Post rendered successfully!" -ForegroundColor Green
    
    # Get the output filename
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($FileName)
    $outputFile = "../blog/$baseName.html"
    
    if (Test-Path $outputFile) {
        Write-Host "📁 Output: $outputFile" -ForegroundColor Yellow
        
        # Get file size
        $size = (Get-Item $outputFile).Length
        $sizeKB = [math]::Round($size / 1KB, 2)
        Write-Host "📊 Size: $sizeKB KB" -ForegroundColor Gray
    }
} else {
    Write-Host "❌ Rendering failed!" -ForegroundColor Red
    exit 1
}

