import { sql } from "drizzle-orm";
import {
  boolean,
  check,
  index,
  integer,
  numeric,
  pgTable,
  text,
  timestamp,
  unique,
  uuid,
} from "drizzle-orm/pg-core";
import { ingredientsTable } from "./ingredients_table";
import { measurementUnitsTable } from "./measurement_units_table";
import { recipesTable } from "./recipes_table";

/** recipe_requirements 的领域持久化记录。 */
export const recipeRequirementsTable = pgTable(
  "recipe_requirements",
  {
    /** 应用生成的稳定身份。 */ id: uuid("id").primaryKey().defaultRandom(),
    /** 所属菜谱。 */ recipeId: uuid("recipe_id")
      .notNull()
      .references(() => recipesTable.id, { onDelete: "cascade" }),
    /** 清单顺序从 1 开始。 */ position: integer("position").notNull(),
    /** 保留的清单原文。 */ label: text("label").notNull(),
    /** unclassified、ingredient 或 tool。 */ kind: text("kind").notNull(),
    /** 人工确认后关联食材。 */ ingredientId: uuid("ingredient_id").references(
      () => ingredientsTable.id,
      { onDelete: "restrict" },
    ),
    /** 保留适量等原文。 */ quantityText: text("quantity_text").notNull().default(""),
    /** 明确数量，无值表示未知。 */ amount: numeric("amount", {
      precision: 18,
      scale: 6,
      mode: "string",
    }),
    /** 明确数量对应的单位。 */ unitId: uuid("unit_id").references(() => measurementUnitsTable.id, {
      onDelete: "restrict",
    }),
    /** 是否可省略。 */ optional: boolean("optional").notNull().default(false),
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
    unique("recipe_requirements_recipe_position_unique").on(table.recipeId, table.position),
    check("recipe_requirements_position_positive", sql`${table.position} > 0`),
    check("recipe_requirements_kind", sql`${table.kind} in ('unclassified', 'ingredient', 'tool')`),
    check(
      "recipe_requirements_food_link",
      sql`(${table.kind} = 'ingredient') = (${table.ingredientId} is not null)`,
    ),
    check(
      "recipe_requirements_quantity_pair",
      sql`(${table.amount} is null) = (${table.unitId} is null)`,
    ),
    check(
      "recipe_requirements_amount_positive",
      sql`${table.amount} is null or ${table.amount} > 0`,
    ),
    index("recipe_requirements_ingredient_index").on(table.ingredientId),
    index("recipe_requirements_unit_index").on(table.unitId),
  ],
);
