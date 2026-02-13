# Quarto Python Posts

This directory contains Quarto documents (`.qmd`) and Python scripts (`.py`) that are rendered to HTML for the Hugo blog.

## Directory Structure

```
quarto-posts/
├── _quarto.yml                    # Quarto project configuration
├── _metadata.yml                  # Default metadata for all posts
├── template.html                  # Custom Pandoc template for HTML output
├── quarto-custom.css              # Custom CSS matching Blackburn theme
├── README.md                      # This file
├── job-trends-nz.qmd              # Active blog post: Job Trends in NZ
├── _freeze/                       # Cached execution results
│   ├── job-trends-nz/             # Cache for job-trends-nz.qmd
│   └── site_libs/                 # Shared library cache
└── *.ps1                          # PowerShell automation scripts (optional)
```

## Creating a New Post

### Option 1: Using .qmd files (Recommended)

Create a new `.qmd` file:

```bash
# In quarto-posts directory
quarto create post my-python-analysis.qmd
```

Or manually create with this template:

```yaml
---
title: "My Python Analysis"
date: 2026-02-13
tags: ["Python", "tutorial"]
description: "A short description of your post"
---

## Introduction

Your content here.

```{python}
import pandas as pd
print("Hello from Python!")
```
```

### Option 2: Using .py files

Create a Python script with special Quarto comments:

```python
# %% [markdown]
# ---
# title: "My Python Analysis"
# date: 2026-02-13
# tags: ["Python", "tutorial"]
# ---

# %% [markdown]
# ## Introduction
# Your content here.

# %%
import pandas as pd
print("Hello from Python!")
```

## Building Posts

### Render a single post:
```bash
quarto render my-post.qmd
```

### Render all posts:
```bash
quarto render
```

### Preview while editing:
```bash
quarto preview my-post.qmd
```

## Running Quarto Locally

### Quick Start (Recommended)

The simplest way to run Quarto is to use the full path to the executable:

```powershell
# In PowerShell, navigate to the quarto-posts directory
cd quarto-posts

# Render a single post
& "C:\Program Files\Quarto\bin\quarto.exe" render job-trends-nz.qmd

# Render all posts
& "C:\Program Files\Quarto\bin\quarto.exe" render

# Preview while editing
& "C:\Program Files\Quarto\bin\quarto.exe" preview job-trends-nz.qmd
```

### Option 1: Using PowerShell Alias (Recommended)

Add this to your PowerShell profile (`$PROFILE`) to create a shortcut:

```powershell
# Open your PowerShell profile
notepad $PROFILE

# Add this line to the file
Set-Alias quarto "C:\Program Files\Quarto\bin\quarto.exe"

# Save and reload PowerShell
. $PROFILE
```

Then you can use Quarto normally:
```powershell
cd quarto-posts
quarto render job-trends-nz.qmd
```

### Option 2: Using Git Bash

From Git Bash, use the full path with the `call` operator:

```bash
# Navigate to quarto-posts directory
cd quarto-posts

# Render a post
/c/Program\ Files/Quarto/bin/quarto.exe render job-trends-nz.qmd
```

Or create a bash alias in `~/.bashrc`:

```bash
# Add to ~/.bashrc
alias quarto="/c/Program\ Files/Quarto/bin/quarto.exe"

# Reload
source ~/.bashrc

# Now use it directly
quarto render job-trends-nz.qmd
```

### Option 3: Add Quarto to System PATH (Permanent)

To make Quarto available everywhere without the full path:

1. **Open Environment Variables:**
   - Press `Win + X` and select "System"
   - Click "Advanced system settings"
   - Click "Environment Variables"

2. **Add Quarto to PATH:**
   - Click "New" under "System variables"
   - Variable name: `Path`
   - Variable value: `C:\Program Files\Quarto\bin`
   - Click OK and restart your terminal

3. **Verify it works:**
   ```powershell
   quarto --version
   ```

### Troubleshooting

**Problem: "quarto: command not found"**

Solution 1: Use the full path
```powershell
& "C:\Program Files\Quarto\bin\quarto.exe" render job-trends-nz.qmd
```

Solution 2: Check if Quarto is installed
```powershell
Get-ChildItem "C:\Program Files\Quarto\bin\"
```

Solution 3: Reinstall Quarto
```powershell
winget uninstall Posit.Quarto
winget install Posit.Quarto
```

**Problem: Python errors when rendering**

Make sure all required Python packages are installed:
```bash
pip install pytrends matplotlib pandas numpy
```

## Output

Rendered HTML files are placed in the `../blog/` directory, ready to be committed to your Hugo site.

## Tips

- Use `freeze: auto` to cache expensive computations
- Add `#| echo: false` to hide code cells
- Add `#| output: false` to hide output
- Use `#| fig-cap: "Caption"` for figure captions

