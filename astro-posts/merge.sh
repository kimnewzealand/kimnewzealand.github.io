#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
HERE="$(cd "$(dirname "$0")" && pwd)"

cd "$HERE"

echo "==> Building Astro site..."
pnpm astro check && pnpm astro build

echo "==> Merging assets and posts into site root..."
# Replace hashed assets (remove stale files first)
rm -rf "$ROOT/_astro"
cp -r dist/_astro "$ROOT/_astro"

# Copy blog post directories (skip index.html listing page)
for dir in dist/blog/*/; do
  slug="$(basename "$dir")"
  echo "    -> Copying blog/$slug"
  cp -r "$dir" "$ROOT/blog/$slug"
done

echo "==> Done! Merged $(find dist/blog -maxdepth 1 -type d | wc -l | tr -d ' ') blog post(s)."
