import { existsSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { expect, it } from "vitest";
import { sourceRecipeCatalog } from "@repo/schemas";
import paths from "./recipeThumbnails.json";
import { getSourceRecipeThumbnail } from "./sourceRecipeThumbnails";
it("keeps a valid local asset or an explicit illustration for every dish", () => {
  expect(Object.keys(paths).sort()).toEqual(sourceRecipeCatalog.map((recipe) => recipe.id).sort());
  for (const recipe of sourceRecipeCatalog) {
    const image = getSourceRecipeThumbnail(recipe);
    const path = paths[recipe.id as keyof typeof paths];
    expect(image.isPhotograph).toBe(!!path);
    if (path)
      expect(
        existsSync(
          fileURLToPath(new URL(`../../../../../content/how-to-cook/${path}`, import.meta.url))
        )
      ).toBe(true);
    else expect(image.src).toBe("/ingredient-icons/fluent-flat/cooking.svg");
  }
  const greens = sourceRecipeCatalog.find((recipe) => recipe.title === "白灼菜心")!;
  expect(getSourceRecipeThumbnail(greens).isPhotograph).toBe(true);
});
