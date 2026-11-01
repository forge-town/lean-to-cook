import { pgTable, text, timestamp, unique, uuid } from "drizzle-orm/pg-core";
import { recipesTable } from "./recipes_table";

/** recipe_publications 的领域持久化记录。 */
export const recipePublicationsTable = pgTable(
  "recipe_publications",
  {
    /** 应用生成的稳定身份。 */ id: uuid("id").primaryKey().defaultRandom(),
    /** 所属菜谱，一道菜一个当前发布摘要。 */ recipeId: uuid("recipe_id")
      .notNull()
      .references(() => recipesTable.id, { onDelete: "cascade" }),
    /** 发布时完整解析内容的 SHA256。 */ contentDigest: text("content_digest").notNull(),
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
  (table) => [unique("recipe_publications_recipe_unique").on(table.recipeId)],
);
