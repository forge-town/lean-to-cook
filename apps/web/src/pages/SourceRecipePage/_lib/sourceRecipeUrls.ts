import { sourceRecipeCatalog, type SourceRecipe } from "@repo/schemas";
import { defaultUrlTransform } from "react-markdown";

const prefix = "../../../../../../content/how-to-cook/";
const images = import.meta.glob<string>(
  "../../../../../../content/how-to-cook/dishes/**/*.{jpg,jpeg,JPG,JPEG,png,PNG,gif,GIF,webp,svg}",
  { eager: true, import: "default", query: "?url" }
);
const recipeByPath = new Map(
  sourceRecipeCatalog.map((recipe) => [
    new URL(recipe.sourcePath, "https://snapshot.invalid/").pathname,
    recipe,
  ])
);
const imageByPath = new Map(
  Object.entries(images).map(([path, url]) => [
    new URL(path.slice(prefix.length), "https://snapshot.invalid/").pathname,
    url,
  ])
);

/** Resolve snapshot-relative assets and recipes without changing vendored Markdown. */
export const createSourceRecipeUrlTransform =
  (recipe: SourceRecipe) => (url: string, key: string) => {
    const safeUrl = defaultUrlTransform(url);
    if (!safeUrl || safeUrl.startsWith("#") || /^(?:[a-z][\w+.-]*:|\/\/)/i.test(safeUrl))
      return safeUrl;
    const relative = new URL(safeUrl, `https://snapshot.invalid/${recipe.sourcePath}`);
    if (key === "src") {
      const localImage = imageByPath.get(relative.pathname);
      if (localImage) return localImage;
    }
    const linkedRecipe = recipeByPath.get(relative.pathname);
    if (key === "href" && linkedRecipe)
      return `/source-recipe/${linkedRecipe.id}${relative.search}${relative.hash}`;

    return new URL(
      safeUrl,
      key === "src"
        ? recipe.sourceUrl
            .replace("github.com/", "raw.githubusercontent.com/")
            .replace("/blob/", "/")
        : recipe.sourceUrl
    ).href;
  };
