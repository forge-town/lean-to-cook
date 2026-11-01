import { db } from "@repo/db";
import { recipesTable, recipeRequirementsTable } from "@repo/db-schema";
import { and, eq, inArray, isNull, or, sql } from "drizzle-orm";
import type { findUnclassifiedRequirementsOperation } from "../findUnclassifiedRequirements/findUnclassifiedRequirements.operation";
export const linkIngredientsOperation = async (
  choices: {
    requirement: Awaited<ReturnType<typeof findUnclassifiedRequirementsOperation>>[number];
    ingredientId: string;
  }[],
): Promise<{ linked: number; recipes: number }> => {
  if (choices.length === 0) return { linked: 0, recipes: 0 };
  const recipeIds = [...new Set(choices.map((choice) => choice.requirement.recipeId))].sort();

  return db.transaction(async (tx) => {
    const result = { linked: 0, recipes: 0 };
    for (const recipeId of recipeIds) {
      const group = choices.filter((choice) => choice.requirement.recipeId === recipeId);
      const [parent] = await tx
        .select({ id: recipesTable.id })
        .from(recipesTable)
        .where(
          and(
            eq(recipesTable.id, recipeId),
            eq(recipesTable.updatedAt, group[0]!.requirement.recipeUpdatedAt),
          ),
        )
        .for("update");
      if (!parent) continue;
      const ingredientCase = sql`case ${sql.join(
        group.map(
          (choice) =>
            sql`when ${recipeRequirementsTable.id} = ${choice.requirement.id} then ${choice.ingredientId}::uuid`,
        ),
        sql` `,
      )} end`;
      const linked = await tx
        .update(recipeRequirementsTable)
        .set({
          kind: "ingredient",
          ingredientId: ingredientCase,
          updatedAt: sql`greatest(clock_timestamp(), ${recipeRequirementsTable.updatedAt} + interval '1 millisecond')`,
        })
        .where(
          and(
            inArray(
              recipeRequirementsTable.id,
              group.map((choice) => choice.requirement.id),
            ),
            eq(recipeRequirementsTable.kind, "unclassified"),
            isNull(recipeRequirementsTable.ingredientId),
            or(
              ...group.map((choice) =>
                and(
                  eq(recipeRequirementsTable.id, choice.requirement.id),
                  eq(recipeRequirementsTable.updatedAt, choice.requirement.updatedAt),
                ),
              ),
            ),
          ),
        )
        .returning({ id: recipeRequirementsTable.id });
      if (linked.length === 0) continue;
      await tx
        .update(recipesTable)
        .set({
          updatedAt: sql`greatest(clock_timestamp(), ${recipesTable.updatedAt} + interval '1 millisecond')`,
        })
        .where(eq(recipesTable.id, recipeId));
      result.linked += linked.length;
      result.recipes += 1;
    }

    return result;
  });
};
