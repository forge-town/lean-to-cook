import { sql } from "drizzle-orm";
import { check, pgTable, text, timestamp, uniqueIndex, uuid } from "drizzle-orm/pg-core";

/** ingredient_categories 的领域持久化记录。 */
export const ingredientCategoriesTable = pgTable(
  "ingredient_categories",
  {
    /** 应用生成的稳定身份。 */ id: uuid("id").primaryKey().defaultRandom(),
    /** 分类名称。 */ name: text("name").notNull(),
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
    uniqueIndex("ingredient_categories_name_unique").on(sql`lower(normalize(${table.name}, NFKC))`),
    check(
      "ingredient_categories_name_not_blank",
      sql`char_length(btrim(${table.name})) between 1 and 100`,
    ),
  ],
);
