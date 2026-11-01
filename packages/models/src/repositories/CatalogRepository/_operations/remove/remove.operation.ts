import { db } from "@repo/db";
import {
  recipesTable,
  ingredientsTable,
  measurementUnitsTable,
  ingredientCategoriesTable,
  recipeCategoriesTable,
} from "@repo/db-schema";
import type { CatalogDelete } from "@repo/schemas/catalog";
import { and, eq } from "drizzle-orm";
import { CatalogPersistenceError } from "../../../../errors/CatalogPersistenceError";
export const removeOperation = async (input: CatalogDelete): Promise<{ id: string }> => {
  const table = {
    recipes: recipesTable,
    ingredients: ingredientsTable,
    units: measurementUnitsTable,
    "ingredient-categories": ingredientCategoriesTable,
    "recipe-categories": recipeCategoriesTable,
  }[input.resource];
  const [record] = await db
    .delete(table)
    .where(and(eq(table.id, input.id), eq(table.updatedAt, new Date(input.expectedUpdatedAt))))
    .returning({ id: table.id });
  if (!record)
    throw new CatalogPersistenceError("CONFLICT", "记录已被修改或删除，请重新打开后再删除");

  return record;
};
