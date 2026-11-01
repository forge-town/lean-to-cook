import { db } from "@repo/db";
import { recipeLeanCertificatesTable, ingredientLeanCertificatesTable } from "@repo/db-schema";
export const saveBatchOperation = (input: {
  recipes: (typeof recipeLeanCertificatesTable.$inferInsert)[];
  ingredients: (typeof ingredientLeanCertificatesTable.$inferInsert)[];
}): Promise<{ inserted: number }> =>
  db.transaction(async (tx) => {
    const recipes =
      input.recipes.length > 0
        ? await tx
            .insert(recipeLeanCertificatesTable)
            .values(input.recipes)
            .onConflictDoNothing()
            .returning({ id: recipeLeanCertificatesTable.id })
        : [];
    const ingredients =
      input.ingredients.length > 0
        ? await tx
            .insert(ingredientLeanCertificatesTable)
            .values(input.ingredients)
            .onConflictDoNothing()
            .returning({ id: ingredientLeanCertificatesTable.id })
        : [];

    return { inserted: recipes.length + ingredients.length };
  });
