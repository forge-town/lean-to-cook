import { sql } from "drizzle-orm";
import { check, integer, pgTable, text, timestamp, unique, uuid } from "drizzle-orm/pg-core";
import { recipesTable } from "./recipes_table";

/** recipe_steps 的领域持久化记录。 */
export const recipeStepsTable = pgTable(
  "recipe_steps",
  {
    /** 应用生成的稳定身份。 */ id: uuid("id").primaryKey().defaultRandom(),
    /** 所属菜谱。 */ recipeId: uuid("recipe_id")
      .notNull()
      .references(() => recipesTable.id, { onDelete: "cascade" }),
    /** 操作顺序从 1 开始。 */ position: integer("position").notNull(),
    /** 操作内容。 */ instruction: text("instruction").notNull(),
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
    unique("recipe_steps_recipe_position_unique").on(table.recipeId, table.position),
    check("recipe_steps_position_positive", sql`${table.position} > 0`),
    check("recipe_steps_not_blank", sql`char_length(btrim(${table.instruction})) > 0`),
  ],
);
