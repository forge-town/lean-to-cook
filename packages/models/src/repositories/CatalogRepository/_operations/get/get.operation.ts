import { db, type Database } from "@repo/db";
import type { CatalogIdentity } from "@repo/schemas/catalog";
import { asc, eq } from "drizzle-orm";
import {
  recipesTable,
  ingredientsTable,
  ingredientCategoriesTable,
  recipeCategoriesTable,
  measurementUnitsTable,
  recipeStepsTable,
  recipeRequirementsTable,
  ingredientAliasesTable,
} from "@repo/db-schema";

export const getRecordWithExecutor = async (
  executor: Pick<Database, "query">,
  input: CatalogIdentity,
) => {
  switch (input.resource) {
    case "recipes": {
      const record = await executor.query.recipesTable.findFirst({
        where: eq(recipesTable.id, input.id),
        with: {
          category: true,
          recipeSources: true,
          recipePublications: true,
          recipeSteps: { orderBy: asc(recipeStepsTable.position) },
          recipeRequirements: {
            orderBy: asc(recipeRequirementsTable.position),
            with: {
              ingredient: {
                with: { ingredientAliases: { orderBy: asc(ingredientAliasesTable.name) } },
              },
              unit: true,
            },
          },
        },
      });

      return record ? { resource: "recipes" as const, record } : null;
    }
    case "ingredients": {
      const record = await executor.query.ingredientsTable.findFirst({
        where: eq(ingredientsTable.id, input.id),
        with: {
          category: true,
          ingredientAliases: { orderBy: asc(ingredientAliasesTable.name) },
          recipeRequirements: {
            columns: { recipeId: true },
            with: { recipe: { columns: { id: true, title: true } } },
          },
        },
      });

      return record ? { resource: "ingredients" as const, record } : null;
    }
    case "units": {
      const record = await executor.query.measurementUnitsTable.findFirst({
        where: eq(measurementUnitsTable.id, input.id),
      });

      return record ? { resource: "units" as const, record } : null;
    }
    case "ingredient-categories": {
      const record = await executor.query.ingredientCategoriesTable.findFirst({
        where: eq(ingredientCategoriesTable.id, input.id),
      });

      return record ? { resource: "ingredient-categories" as const, record } : null;
    }
    case "recipe-categories": {
      const record = await executor.query.recipeCategoriesTable.findFirst({
        where: eq(recipeCategoriesTable.id, input.id),
      });

      return record ? { resource: "recipe-categories" as const, record } : null;
    }
  }
};
export const getOperation = (input: CatalogIdentity) => getRecordWithExecutor(db, input);
