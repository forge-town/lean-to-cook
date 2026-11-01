import { existsSync, mkdirSync, readFileSync, writeFileSync } from "node:fs";
import { dirname, extname, relative, resolve } from "node:path";
import { fileURLToPath } from "node:url";
import catalog from "../packages/schemas/src/sourceRecipes/sourceRecipeCatalogData.json";
const root = fileURLToPath(new URL("../", import.meta.url));
const snapshot = resolve(root, "content/how-to-cook");
const target = resolve(root, "apps/web/src/pages/SourceRecipeLibraryPage/recipeThumbnails.json");
const thumbnails = Object.fromEntries(
  catalog.map((recipe) => {
    const document = resolve(snapshot, recipe.sourcePath);
    const markdown = readFileSync(document, "utf8");
    const matches = [...markdown.matchAll(/!\[[^\]]*\]\(\s*(?:<([^>]+)>|([^\n)]+))\s*\)/g)];
    const sectionStart = markdown.indexOf("\n## ");
    const ordered =
      sectionStart < 0
        ? matches
        : [
            ...matches.filter((match) => match.index < sectionStart),
            ...matches.filter((match) => match.index >= sectionStart).reverse(),
          ];
    const references = ordered.map((match) =>
      (match[1] ?? match[2] ?? "").replace(/\s+["'][^"']*["']\s*$/, "").trim(),
    );
    const image =
      references
        .map((reference) => {
          const url = new URL(reference, `https://snapshot.invalid/${recipe.sourcePath}`);
          if (url.origin !== "https://snapshot.invalid") return null;
          const path = resolve(snapshot, `.${decodeURIComponent(url.pathname)}`);
          if (
            !path.startsWith(snapshot + "/") ||
            !/\.(jpe?g|png|gif|webp|svg)$/i.test(extname(path)) ||
            !existsSync(path)
          )
            return null;
          return relative(snapshot, path).split("\\").join("/");
        })
        .find(Boolean) ?? null;
    return [recipe.id, image];
  }),
);
mkdirSync(dirname(target), { recursive: true });
writeFileSync(target, JSON.stringify(thumbnails, null, 2) + "\n");
console.log(
  JSON.stringify({
    recipes: catalog.length,
    photographs: Object.values(thumbnails).filter(Boolean).length,
    placeholders: Object.values(thumbnails).filter((value) => !value).length,
  }),
);
