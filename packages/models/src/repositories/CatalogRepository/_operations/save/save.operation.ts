import { db } from "@repo/db";
import {
  recipesTable,
  ingredientsTable,
  ingredientAliasesTable,
  recipeRequirementsTable,
  recipeStepsTable,
} from "@repo/db-schema";
import type { CatalogWrite } from "@repo/schemas/catalog";
import { and, eq, ne, sql } from "drizzle-orm";
import { catalogDao } from "../../../../daos/catalogDao/catalog.dao";
import { CatalogPersistenceError } from "../../../../errors/CatalogPersistenceError";

const normalize = (name: string) => name.normalize("NFKC").toLocaleLowerCase();

export const saveOperation = async (input: CatalogWrite): Promise<{ id: string }> => {
  if (input.resource !== "recipes" && input.resource !== "ingredients")
    return catalogDao.saveDictionary(input);

  return db.transaction(async (tx) => {
    const id = input.id ?? crypto.randomUUID();
    const table = input.resource === "recipes" ? recipesTable : ingredientsTable;
    if (input.resource === "ingredients") {
      await tx.execute(sql`select pg_advisory_xact_lock(41978)`);
      const names = new Set([input.values.name, ...input.values.aliases].map(normalize));
      const canonical = await tx
        .select({ name: ingredientsTable.name, sourceName: ingredientsTable.sourceName })
        .from(ingredientsTable)
        .where(ne(ingredientsTable.id, id));
      const aliases = await tx
        .select({ name: ingredientAliasesTable.name })
        .from(ingredientAliasesTable)
        .where(ne(ingredientAliasesTable.ingredientId, id));
      const knownNames = [
        ...canonical.flatMap((row) => (row.sourceName ? [row.name, row.sourceName] : [row.name])),
        ...aliases.map((row) => row.name),
      ];
      if (knownNames.some((name) => names.has(normalize(name))))
        throw new CatalogPersistenceError("DUPLICATE", "名称或别名已被其他食材使用");
    }
    const values =
      input.resource === "recipes"
        ? {
            title: input.values.title,
            categoryId: input.values.categoryId,
            description: input.values.description,
            servings: input.values.servings,
            notes: input.values.notes,
          }
        : {
            name: input.values.name,
            ...(input.values.imageKey === undefined ? {} : { imageKey: input.values.imageKey }),
            categoryId: input.values.categoryId,
            description: input.values.description,
          };
    if (input.id !== null) {
      const [record] = await tx
        .update(table)
        .set({
          ...values,
          updatedAt: sql`greatest(clock_timestamp(), ${table.updatedAt} + interval '1 millisecond')`,
        })
        .where(and(eq(table.id, id), eq(table.updatedAt, new Date(input.expectedUpdatedAt!))))
        .returning({ id: table.id });
      if (!record)
        throw new CatalogPersistenceError("CONFLICT", "记录已被修改或删除，请重新打开后再保存");
    } else if (input.resource === "recipes")
      await tx.insert(recipesTable).values({ ...input.values, id });
    else
      await tx
        .insert(ingredientsTable)
        .values({ ...input.values, sourceName: input.values.name, id });
    if (input.resource === "recipes") {
      await tx.delete(recipeRequirementsTable).where(eq(recipeRequirementsTable.recipeId, id));
      await tx.delete(recipeStepsTable).where(eq(recipeStepsTable.recipeId, id));
      await tx.insert(recipeRequirementsTable).values(
        input.values.requirements.map((item, position) => ({
          ...item,
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
    } else {
      await tx.delete(ingredientAliasesTable).where(eq(ingredientAliasesTable.ingredientId, id));
      if (input.values.aliases.length > 0)
        await tx
          .insert(ingredientAliasesTable)
          .values(input.values.aliases.map((name) => ({ name, ingredientId: id })));
    }

    return { id };
  });
};
