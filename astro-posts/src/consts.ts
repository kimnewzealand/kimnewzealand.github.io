import type { Site, Metadata, Socials } from "@types";

export const SITE: Site = {
  NAME: "Kim Fitter",
  EMAIL: "",
  NUM_POSTS_ON_HOMEPAGE: 5,
  NUM_WORKS_ON_HOMEPAGE: 0,
  NUM_PROJECTS_ON_HOMEPAGE: 0,
};

export const HOME: Metadata = {
  TITLE: "New Posts",
  DESCRIPTION: "New blog posts built with Astro, alongside the existing Hugo and Quarto site.",
};

export const BLOG: Metadata = {
  TITLE: "Blog",
  DESCRIPTION: "Data viz, web dev, and whatever else catches my interest.",
};

export const WORK: Metadata = {
  TITLE: "Work",
  DESCRIPTION: "Where I have worked and what I have done.",
};

export const PROJECTS: Metadata = {
  TITLE: "Projects",
  DESCRIPTION: "A collection of my projects, with links to repositories and demos.",
};

export const SOCIALS: Socials = [
  {
    NAME: "github",
    HREF: "https://github.com/kimnewzealand",
  },
  {
    NAME: "x",
    HREF: "https://x.com/kim_fitter",
  },
];
