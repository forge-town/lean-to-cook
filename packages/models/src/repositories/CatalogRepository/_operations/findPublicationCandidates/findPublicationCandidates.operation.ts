import { db } from "@repo/db";
import { recipesTable, recipePublicationsTable } from "@repo/db-schema";
import { and, asc, eq, ilike } from "drizzle-orm";
import type { CatalogListInput } from "@repo/schemas/catalog";
export const findPublicationCandidatesOperation = (
  input: CatalogListInput,
): Promise<{ id: string }[]> => {
  const pattern = `%${input.search.replaceAll("\\", "\\\\").replaceAll("%", "\\%").replaceAll("_", "\\_")}%`;

  return db
    .select({ id: recipesTable.id })
    .from(recipesTable)
    .innerJoin(recipePublicationsTable, eq(recipePublicationsTable.recipeId, recipesTable.id))
    .where(
      and(
        ilike(recipesTable.title, pattern),
        input.categoryId ? eq(recipesTable.categoryId, input.categoryId) : undefined,
      ),
    )
    .orderBy(asc(recipesTable.title), asc(recipesTable.id));
};
