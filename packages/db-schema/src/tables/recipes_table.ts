import { sql } from "drizzle-orm";
import { check, index, integer, pgTable, text, timestamp, uuid } from "drizzle-orm/pg-core";
import { recipeCategoriesTable } from "./recipe_categories_table";

/** recipes 的领域持久化记录。 */
export const recipesTable = pgTable(
  "recipes",
  {
    /** 应用生成的稳定身份。 */ id: uuid("id").primaryKey().defaultRandom(),
    /** 菜谱标题。 */ title: text("title").notNull(),
    /** 未分类时为空。 */ categoryId: uuid("category_id").references(
      () => recipeCategoriesTable.id,
      { onDelete: "restrict" },
    ),
    /** 菜谱介绍。 */ description: text("description").notNull().default(""),
    /** 原文未说明时为空。 */ servings: integer("servings"),
    /** 做法提示。 */ notes: text("notes").notNull().default(""),
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
    check("recipes_title_not_blank", sql`char_length(btrim(${table.title})) between 1 and 200`),
    check(
      "recipes_servings_positive",
      sql`${table.servings} is null or ${table.servings} between 1 and 10000`,
    ),
    index("recipes_category_index").on(table.categoryId),
  ],
);
