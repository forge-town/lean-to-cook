import { db } from "@repo/db";
import { recipesTable, recipePublicationsTable } from "@repo/db-schema";
import type { RecipePublicationInput } from "@repo/schemas/catalog";
import { and, eq } from "drizzle-orm";
import { CatalogPersistenceError } from "../../../../errors/CatalogPersistenceError";
export const publishOperation = (
  input: RecipePublicationInput & { contentDigest: string | null },
): Promise<{ id: string }> =>
  db.transaction(async (tx) => {
    const [record] = await tx
      .select({ id: recipesTable.id })
      .from(recipesTable)
      .where(
        and(
          eq(recipesTable.id, input.id),
          eq(recipesTable.updatedAt, new Date(input.expectedUpdatedAt)),
        ),
      )
      .for("update");
    if (!record) throw new CatalogPersistenceError("CONFLICT", "菜谱已被修改，请重新打开后再发布");
    await tx.delete(recipePublicationsTable).where(eq(recipePublicationsTable.recipeId, input.id));
    if (input.contentDigest !== null)
      await tx
        .insert(recipePublicationsTable)
        .values({ recipeId: input.id, contentDigest: input.contentDigest });

    return { id: input.id };
  });
