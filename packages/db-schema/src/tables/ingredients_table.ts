import { sql } from "drizzle-orm";
import { check, index, pgTable, text, timestamp, uniqueIndex, uuid } from "drizzle-orm/pg-core";
import { ingredientCategoriesTable } from "./ingredient_categories_table";

/** ingredients 的领域持久化记录。 */
export const ingredientsTable = pgTable(
  "ingredients",
  {
    /** 应用生成的稳定身份。 */ id: uuid("id").primaryKey().defaultRandom(),
    /** 规范食材名称。 */ name: text("name").notNull(),
    /** Original recipe-name binding; immutable on edits, null for legacy direct imports. */ sourceName:
      text("source_name"),
    /** Bundled image identifier; null means unassigned. */ imageKey: text("image_key"),
    /** 未分类时为空。 */ categoryId: uuid("category_id").references(
      () => ingredientCategoriesTable.id,
      { onDelete: "restrict" },
    ),
    /** 食材说明。 */ description: text("description").notNull().default(""),
    /** 创建时间。 */ createdAt: timestamp("created_at", { withTimezone: true, precision: 3 })
      .notNull()
      .defaultNow(),
    /** 最后修改时间，用于乐观锁。 */ updatedAt: timestamp("updated_at", {
      withTimezone: true,
      precision: 3,
    })
      .notNull()
      .defaultNow(),
  },
  (table) => [
    uniqueIndex("ingredients_name_unique").on(sql`lower(normalize(${table.name}, NFKC))`),
    check("ingredients_name_not_blank", sql`char_length(btrim(${table.name})) between 1 and 100`),
    index("ingredients_category_index").on(table.categoryId),
  ],
);
