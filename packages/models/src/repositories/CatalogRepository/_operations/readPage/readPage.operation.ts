import { db } from "@repo/db";
import {
  ingredientsTable,
  ingredientAliasesTable,
  ingredientCategoriesTable,
  recipesTable,
  recipeCategoriesTable,
  measurementUnitsTable,
} from "@repo/db-schema";
import type { CatalogListInput } from "@repo/schemas/catalog";
import { and, asc, count, eq, exists, ilike, or, sql } from "drizzle-orm";
export const readPageOperation = async (input: CatalogListInput) => {
  const table = {
    recipes: recipesTable,
    ingredients: ingredientsTable,
    units: measurementUnitsTable,
    "ingredient-categories": ingredientCategoriesTable,
    "recipe-categories": recipeCategoriesTable,
  }[input.resource];
  const titleColumn =
    input.resource === "recipes"
      ? recipesTable.title
      : input.resource === "ingredients"
        ? ingredientsTable.name
        : input.resource === "units"
          ? measurementUnitsTable.name
          : input.resource === "recipe-categories"
            ? recipeCategoriesTable.name
            : ingredientCategoriesTable.name;
  const search = `%${input.search.replaceAll("\\", "\\\\").replaceAll("%", "\\%").replaceAll("_", "\\_")}%`;
  const nameMatch = ilike(titleColumn, search);
  const aliasMatch = exists(
    db
      .select({ id: ingredientAliasesTable.id })
      .from(ingredientAliasesTable)
      .where(
        and(
          eq(ingredientAliasesTable.ingredientId, ingredientsTable.id),
          ilike(ingredientAliasesTable.name, search),
        ),
      ),
  );
  const categoryMatch =
    input.categoryId &&
    (input.resource === "recipes"
      ? eq(recipesTable.categoryId, input.categoryId)
      : input.resource === "ingredients"
        ? eq(ingredientsTable.categoryId, input.categoryId)
        : undefined);
  const where = and(
    input.resource === "ingredients" ? or(nameMatch, aliasMatch) : nameMatch,
    categoryMatch || undefined,
  );
  const total = await db.select({ count: count() }).from(table).where(where);
  const data = await db
    .select({ id: table.id })
    .from(table)
    .where(where)
    .orderBy(asc(titleColumn), asc(table.id))
    .limit(input.pageSize)
    .offset((input.page - 1) * input.pageSize);

  if (input.resource === "recipes")
    return { data, total: total[0]?.count ?? 0, dictionaryRows: null };
  const base = { id: table.id, name: titleColumn, updatedAt: table.updatedAt };
  const empty = {
    categoryName: sql<string | null>`null`,
    aliases: sql<string[]>`array[]::text[]`,
    code: sql<string | null>`null`,
    dimension: sql<string | null>`null`,
  };
  const dictionaryRows =
    input.resource === "ingredients"
      ? await db
          .select({
            id: ingredientsTable.id,
            name: ingredientsTable.name,
            updatedAt: ingredientsTable.updatedAt,
            ...empty,
            categoryName: ingredientCategoriesTable.name,
            aliases: sql<
              string[]
            >`array(select a.name from ingredient_aliases a where a.ingredient_id = ${ingredientsTable.id} order by a.name)`,
            usageCount: sql<number>`(select count(*)::int from recipe_requirements r where r.ingredient_id = ${ingredientsTable.id})`,
          })
          .from(ingredientsTable)
          .leftJoin(
            ingredientCategoriesTable,
            eq(ingredientCategoriesTable.id, ingredientsTable.categoryId),
          )
          .where(where)
          .orderBy(asc(titleColumn), asc(table.id))
          .limit(input.pageSize)
          .offset((input.page - 1) * input.pageSize)
      : await db
          .select({
            ...base,
            ...empty,
            code: input.resource === "units" ? measurementUnitsTable.code : empty.code,
            dimension:
              input.resource === "units" ? measurementUnitsTable.dimension : empty.dimension,
            usageCount:
              input.resource === "units"
                ? sql<number>`(select count(*)::int from recipe_requirements r where r.unit_id = ${table.id})`
                : input.resource === "ingredient-categories"
                  ? sql<number>`(select count(*)::int from ingredients i where i.category_id = ${table.id})`
                  : sql<number>`(select count(*)::int from recipes r where r.category_id = ${table.id})`,
          })
          .from(table)
          .where(where)
          .orderBy(asc(titleColumn), asc(table.id))
          .limit(input.pageSize)
          .offset((input.page - 1) * input.pageSize);

  return { data, total: total[0]?.count ?? 0, dictionaryRows };
};
export const usageCountOperation = async (input: {
  resource: CatalogListInput["resource"];
  id: string;
}): Promise<number> => {
  const query =
    input.resource === "ingredients"
      ? sql`select count(*)::int as n from recipe_requirements where ingredient_id=${input.id}`
      : input.resource === "units"
        ? sql`select count(*)::int as n from recipe_requirements where unit_id=${input.id}`
        : input.resource === "ingredient-categories"
          ? sql`select count(*)::int as n from ingredients where category_id=${input.id}`
          : input.resource === "recipe-categories"
            ? sql`select count(*)::int as n from recipes where category_id=${input.id}`
            : sql`select 0 as n`;
  const rows = await db.execute<{ n: number }>(query);

  return rows[0]?.n ?? 0;
};
