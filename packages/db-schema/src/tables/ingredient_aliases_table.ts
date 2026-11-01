import { sql } from "drizzle-orm";
import { check, index, pgTable, text, timestamp, uniqueIndex, uuid } from "drizzle-orm/pg-core";
import { ingredientsTable } from "./ingredients_table";

/** ingredient_aliases 的领域持久化记录。 */
export const ingredientAliasesTable = pgTable(
  "ingredient_aliases",
  {
    /** 应用生成的稳定身份。 */ id: uuid("id").primaryKey().defaultRandom(),
    /** 别名对应的规范食材。 */ ingredientId: uuid("ingredient_id")
      .notNull()
      .references(() => ingredientsTable.id, { onDelete: "cascade" }),
    /** 食材其他名称。 */ name: text("name").notNull(),
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
    uniqueIndex("ingredient_aliases_name_unique").on(sql`lower(normalize(${table.name}, NFKC))`),
    check(
      "ingredient_aliases_name_not_blank",
      sql`char_length(btrim(${table.name})) between 1 and 100`,
    ),
    index("ingredient_aliases_ingredient_index").on(table.ingredientId),
  ],
);
