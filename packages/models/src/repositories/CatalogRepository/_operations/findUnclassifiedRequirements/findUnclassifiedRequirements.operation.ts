import { db } from "@repo/db";
import { recipesTable, recipeRequirementsTable } from "@repo/db-schema";
import { and, asc, eq, isNull } from "drizzle-orm";
export const findUnclassifiedRequirementsOperation = () =>
  db
    .select({
      id: recipeRequirementsTable.id,
      recipeId: recipeRequirementsTable.recipeId,
      label: recipeRequirementsTable.label,
      updatedAt: recipeRequirementsTable.updatedAt,
      recipeUpdatedAt: recipesTable.updatedAt,
    })
    .from(recipeRequirementsTable)
    .innerJoin(recipesTable, eq(recipesTable.id, recipeRequirementsTable.recipeId))
    .where(
      and(
        eq(recipeRequirementsTable.kind, "unclassified"),
        isNull(recipeRequirementsTable.ingredientId),
      ),
    )
    .orderBy(asc(recipesTable.id), asc(recipeRequirementsTable.position));
