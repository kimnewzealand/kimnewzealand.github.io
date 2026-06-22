# Astro Posts

Astro-based blog posts for [kimnewzealand.github.io](https://kimnewzealand.github.io), using the [Astro Nano](https://github.com/markhorn-dev/astro-nano) theme.

## Commands

| Command       | Action                                         |
| ------------- | ---------------------------------------------- |
| `pnpm dev`    | Start dev server at `localhost:4321` where http://localhost:4321/blog/astro-blog-folder-name/         |
| `pnpm build`  | Type-check and build to `dist/`                |
| `./merge.sh`  | Build + copy output to site root               |
| `pnpm add post` | Scaffold a new blog post                    |

## Adding a Post

Add an `.md` or `.mdx` file in `src/content/blog/` with frontmatter (`title`, `description`, `date`), then run `./merge.sh` and deploy.
