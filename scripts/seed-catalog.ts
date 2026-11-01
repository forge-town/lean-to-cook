import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { fileURLToPath } from "node:url";
import { eq } from "drizzle-orm";
import { db, databaseClient } from "../packages/db/src/connection";
import {
  ingredientCategoriesTable,
  recipeCategoriesTable,
  ingredientsTable,
  measurementUnitsTable,
} from "../packages/db-schema/src";
import { matchIngredientImage } from "../packages/schemas/src/catalog/matchIngredientImage";
import { RecipeInputSchema } from "../packages/schemas/src/catalog/RecipeInput.schema";
import { recipeCatalog } from "../packages/schemas/src/recipes/recipeCatalog";
import { sourceRecipeCatalog } from "../packages/schemas/src/sourceRecipes/sourceRecipeCatalog";
import { CatalogRepository } from "../packages/models/src/repositories/CatalogRepository/CatalogRepository";
import { parseRecipeForLean } from "./generate-source-recipe-proofs";
const root = fileURLToPath(new URL("..", import.meta.url));
const categoryLabels: Record<string, string> = {
  aquatic: "水产",
  breakfast: "早餐",
  condiment: "酱料",
  dessert: "甜品",
  drink: "饮品",
  meat: "荤菜",
  meat_dish: "荤菜",
  semiFinished: "半成品",
  semi_finished: "半成品",
  soup: "汤与粥",
  staple: "主食",
  vegetable: "素菜",
  vegetable_dish: "素菜",
};
for (const source of sourceRecipeCatalog) {
  const name = categoryLabels[source.category] ?? source.category;
  await db.insert(recipeCategoriesTable).values({ name }).onConflictDoNothing();
}
await db.insert(ingredientCategoriesTable).values({ name: "待分类" }).onConflictDoNothing();
const ingredientCategory = await db.query.ingredientCategoriesTable.findFirst({
  where: eq(ingredientCategoriesTable.name, "待分类"),
});
for (const name of [...new Set(recipeCatalog.flatMap((r) => r.ingredients.map((i) => i.name)))]) {
  const existingNames = await db.query.ingredientsTable.findMany({
    with: { ingredientAliases: true },
  });
  const normalizedName = name.normalize("NFKC").toLocaleLowerCase();
  const existing = existingNames.find((row) =>
    [
      row.sourceName ?? row.name,
      row.name,
      ...row.ingredientAliases.map((alias) => alias.name),
    ].some((candidate) => candidate.normalize("NFKC").toLocaleLowerCase() === normalizedName),
  );
  if (!existing)
    await CatalogRepository.save({
      resource: "ingredients",
      id: null,
      expectedUpdatedAt: null,
      values: {
        name,
        description: "",
        categoryId: ingredientCategory!.id,
        aliases: [],
        imageKey: matchIngredientImage(name),
      },
    });
}
for (const unit of [
  { code: "g", name: "克", dimension: "mass" },
  { code: "kg", name: "千克", dimension: "mass" },
  { code: "ml", name: "毫升", dimension: "volume" },
  { code: "l", name: "升", dimension: "volume" },
  { code: "piece", name: "个", dimension: "count" },
  { code: "clove", name: "瓣", dimension: "count" },
  { code: "slice", name: "片", dimension: "count" },
])
  await db.insert(measurementUnitsTable).values(unit).onConflictDoNothing();
const outcomes = [];
for (const source of sourceRecipeCatalog) {
  const markdown = readFileSync(resolve(root, "content/how-to-cook", source.sourcePath), "utf8");
  const parsed = parseRecipeForLean(markdown);
  const category = await db.query.recipeCategoriesTable.findFirst({
    where: eq(recipeCategoriesTable.name, categoryLabels[source.category] ?? source.category),
  });
  const values = RecipeInputSchema.parse({
    title: source.title,
    description: "",
    notes: "",
    servings: null,
    categoryId: category!.id,
    requirements: parsed.ingredients.map((label) => ({
      label,
      kind: "unclassified",
      ingredientId: null,
      quantityText: "",
      amount: null,
      unitId: null,
      optional: false,
    })),
    steps: parsed.steps,
  });
  outcomes.push(
    await CatalogRepository.importSource({
      values,
      source: {
        sourceId: source.id,
        path: source.sourcePath,
        url: source.sourceUrl,
        commit: source.upstreamCommit,
        license: source.license,
        markdown,
      },
    }),
  );
}
const counts = {
  imported: outcomes.filter((o) => o.inserted).length,
  skipped: outcomes.filter((o) => !o.inserted).length,
  recipes: (await db.query.recipesTable.findMany()).length,
  ingredients: (await db.query.ingredientsTable.findMany()).length,
  units: (await db.query.measurementUnitsTable.findMany()).length,
};
await databaseClient.end();
console.log(JSON.stringify(counts, null, 2));
