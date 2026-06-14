import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}

export function formatDate(date: Date) {
  return Intl.DateTimeFormat("en-US", {
    month: "short",
    day: "2-digit",
    year: "numeric"
  }).format(date);
}

export function readingTime(content: string) {
  const textOnly = content
    .replace(/<[^>]+>/g, "")
    .replace(/[#*`~>\[\]()!_-]/g, "")
    .replace(/\s+/g, " ")
    .trim();
  const wordCount = textOnly.split(/\s+/).filter(Boolean).length;
  const readingTimeMinutes = ((wordCount / 200) + 1).toFixed();
  return `${readingTimeMinutes} min read`;
}

