# Quarto Python Posts

This directory contains Quarto documents (`.qmd`) and Python scripts (`.py`) that are rendered to HTML for the Hugo blog.

## Directory Structure

```
quarto-posts/
├── _quarto.yml                    # Quarto project configuration
├── _metadata.yml                  # Default metadata for all posts
├── README.md                      # This file
├── example-python-analysis.qmd    # Example .qmd file (TESTED ✅)
├── example-python-script.py       # Example .py file with Quarto comments
├── render-all.ps1                 # Render all posts
├── render-single.ps1              # Render a single post
├── preview.ps1                    # Live preview with auto-reload
└── new-post.ps1                   # Create new posts from templates
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

## Output

Rendered HTML files are placed in the `../blog/` directory, ready to be committed to your Hugo site.

## Tips

- Use `freeze: auto` to cache expensive computations
- Add `#| echo: false` to hide code cells
- Add `#| output: false` to hide output
- Use `#| fig-cap: "Caption"` for figure captions

