import { db } from "@repo/db";
import {
  recipesTable,
  recipeSourcesTable,
  recipeRequirementsTable,
  recipeStepsTable,
} from "@repo/db-schema";
import { eq, sql } from "drizzle-orm";
import type { RecipeInput } from "@repo/schemas/catalog";
type SourceInsert = Omit<
  typeof recipeSourcesTable.$inferInsert,
  "id" | "recipeId" | "createdAt" | "updatedAt"
>;
export const importSourceOperation = (input: {
  values: RecipeInput;
  source: SourceInsert;
}): Promise<{ id: string; inserted: boolean }> =>
  db.transaction(async (tx) => {
    await tx.execute(sql`select pg_advisory_xact_lock(41979)`);
    const existing = await tx.query.recipeSourcesTable.findFirst({
      where: eq(recipeSourcesTable.sourceId, input.source.sourceId),
    });
    if (existing) return { id: existing.recipeId, inserted: false };
    const id = crypto.randomUUID();
    await tx.insert(recipesTable).values({
      id,
      title: input.values.title,
      description: input.values.description,
      categoryId: input.values.categoryId,
      servings: input.values.servings,
      notes: input.values.notes,
    });
    await tx.insert(recipeRequirementsTable).values(
      input.values.requirements.map((r, position) => ({
        ...r,
        recipeId: id,
        position: position + 1,
      })),
    );
    await tx.insert(recipeStepsTable).values(
      input.values.steps.map((instruction, position) => ({
        instruction,
        recipeId: id,
        position: position + 1,
      })),
    );
    await tx.insert(recipeSourcesTable).values({ ...input.source, recipeId: id });

    return { id, inserted: true };
  });
