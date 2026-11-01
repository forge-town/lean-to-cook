import type { SourceRecipe } from "@repo/schemas";
import thumbnails from "./recipeThumbnails.json";
const prefix = "../../../../../content/how-to-cook/";
const assets = import.meta.glob<string>(
  "../../../../../content/how-to-cook/dishes/**/*.{jpg,jpeg,JPG,JPEG,png,PNG,gif,GIF,webp,svg}",
  { eager: true, import: "default", query: "?url" }
);
const imageByPath = new Map(
  Object.entries(assets).map(([path, url]) => [path.slice(prefix.length), url])
);
const paths: Readonly<Record<string, string | null>> = thumbnails;
export const getSourceRecipeThumbnail = (recipe: SourceRecipe) => {
  const path = paths[recipe.id];
  const photograph = path ? imageByPath.get(path) : undefined;

  return {
    src: photograph ?? "/ingredient-icons/fluent-flat/cooking.svg",
    isPhotograph: !!photograph,
  };
};
