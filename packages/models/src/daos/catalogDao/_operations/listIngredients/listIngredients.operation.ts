import { db } from "@repo/db";
import { ingredientsTable } from "@repo/db-schema";
import { asc } from "drizzle-orm";
export const listIngredientsOperation = async () => {
  const rows = await db.query.ingredientsTable.findMany({
    with: { ingredientAliases: true },
    orderBy: [asc(ingredientsTable.name), asc(ingredientsTable.id)],
  });

  return rows.map(({ ingredientAliases, ...row }) => ({
    ...row,
    aliases: ingredientAliases.map((alias) => alias.name),
  }));
};
