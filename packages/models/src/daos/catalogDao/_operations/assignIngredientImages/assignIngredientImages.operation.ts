import { db } from "@repo/db";
import { ingredientsTable } from "@repo/db-schema";
import { and, inArray, isNull, sql } from "drizzle-orm";
export const assignIngredientImagesOperation = async (
  choices: { id: string; imageKey: string }[],
): Promise<{ updated: number }> => {
  if (choices.length === 0) return { updated: 0 };
  const imageCase = sql`case ${sql.join(
    choices.map(
      (choice) => sql`when ${ingredientsTable.id} = ${choice.id} then ${choice.imageKey}`,
    ),
    sql` `,
  )} end`;
  const rows = await db
    .update(ingredientsTable)
    .set({
      imageKey: imageCase,
      updatedAt: sql`greatest(clock_timestamp(), ${ingredientsTable.updatedAt} + interval '1 millisecond')`,
    })
    .where(
      and(
        inArray(
          ingredientsTable.id,
          choices.map((choice) => choice.id),
        ),
        isNull(ingredientsTable.imageKey),
      ),
    )
    .returning({ id: ingredientsTable.id });

  return { updated: rows.length };
};
