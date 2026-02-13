# PowerShell script to create a new Quarto post
# Usage: .\new-post.ps1 -Title "My Python Analysis" -Type qmd

param(
    [Parameter(Mandatory=$true)]
    [string]$Title,
    
    [Parameter(Mandatory=$false)]
    [ValidateSet("qmd", "py")]
    [string]$Type = "qmd"
)

# Change to quarto-posts directory
Set-Location $PSScriptRoot

# Create slug from title
$slug = $Title.ToLower() -replace '[^a-z0-9]+', '-' -replace '^-|-$', ''
$date = Get-Date -Format "yyyy-MM-dd"
$fileName = "$slug.$Type"

Write-Host "📝 Creating new post: $fileName" -ForegroundColor Cyan

if (Test-Path $fileName) {
    Write-Host "❌ File already exists: $fileName" -ForegroundColor Red
    exit 1
}

if ($Type -eq "qmd") {
    # Create .qmd template
    $template = @"
---
title: "$Title"
author: "Kim Fitter"
date: $date
tags: ["Python", "tutorial"]
description: "A short description of your post"
format:
  html:
    code-fold: false
    toc: true
---

## Introduction

Write your introduction here.

``````{python}
import pandas as pd
import numpy as np

print("Hello from Python!")
``````

## Analysis

Add your analysis here.

## Conclusions

Summarize your findings.
"@
} else {
    # Create .py template
    $template = @"
# %% [markdown]
# ---
# title: "$Title"
# author: "Kim Fitter"
# date: $date
# tags: ["Python", "tutorial"]
# description: "A short description of your post"
# ---

# %% [markdown]
# ## Introduction
#
# Write your introduction here.

# %%
import pandas as pd
import numpy as np

print("Hello from Python!")

# %% [markdown]
# ## Analysis
#
# Add your analysis here.

# %% [markdown]
# ## Conclusions
#
# Summarize your findings.
"@
}

# Write template to file
$template | Out-File -FilePath $fileName -Encoding UTF8

Write-Host "✅ Created: $fileName" -ForegroundColor Green
Write-Host "`nNext steps:" -ForegroundColor Yellow
Write-Host "  1. Edit the file: code $fileName" -ForegroundColor Gray
Write-Host "  2. Preview: .\preview.ps1 $fileName" -ForegroundColor Gray
Write-Host "  3. Render: .\render-single.ps1 $fileName" -ForegroundColor Gray

