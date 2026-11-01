import { db } from "@repo/db";
import {
  ingredientCategoriesTable,
  recipeCategoriesTable,
  measurementUnitsTable,
} from "@repo/db-schema";
import type { CatalogWrite } from "@repo/schemas/catalog";
import { and, eq, sql } from "drizzle-orm";
import { CatalogPersistenceError } from "../../../../errors/CatalogPersistenceError";

type DictionaryWrite = Exclude<CatalogWrite, { resource: "recipes" | "ingredients" }>;
export const saveDictionaryOperation = async (input: DictionaryWrite): Promise<{ id: string }> => {
  const id = input.id ?? crypto.randomUUID();
  const table =
    input.resource === "units"
      ? measurementUnitsTable
      : input.resource === "recipe-categories"
        ? recipeCategoriesTable
        : ingredientCategoriesTable;
  if (input.id !== null) {
    const [record] = await db
      .update(table)
      .set({
        ...input.values,
        updatedAt: sql`greatest(clock_timestamp(), ${table.updatedAt} + interval '1 millisecond')`,
      })
      .where(
        and(
          eq(table.id, id),
          eq(table.updatedAt, new Date(input.expectedUpdatedAt!)),
          input.resource === "units"
            ? and(
                eq(measurementUnitsTable.code, input.values.code),
                eq(measurementUnitsTable.dimension, input.values.dimension),
              )
            : undefined,
        ),
      )
      .returning({ id: table.id });
    if (!record)
      throw new CatalogPersistenceError(
        "CONFLICT",
        "记录已被修改，或单位代码、类型发生变化。请重新打开记录；如需更换单位，请新建",
      );

    return record;
  }
  if (input.resource === "units")
    await db.insert(measurementUnitsTable).values({ ...input.values, id });
  else if (input.resource === "recipe-categories")
    await db.insert(recipeCategoriesTable).values({ ...input.values, id });
  else await db.insert(ingredientCategoriesTable).values({ ...input.values, id });

  return { id };
};
