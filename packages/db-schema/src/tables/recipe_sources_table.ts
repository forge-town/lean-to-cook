import { pgTable, text, timestamp, unique, uuid } from "drizzle-orm/pg-core";
import { recipesTable } from "./recipes_table";

/** recipe_sources 的领域持久化记录。 */
export const recipeSourcesTable = pgTable(
  "recipe_sources",
  {
    /** 应用生成的稳定身份。 */ id: uuid("id").primaryKey().defaultRandom(),
    /** 所属菜谱，一道菜只绑定一个原始快照。 */ recipeId: uuid("recipe_id")
      .notNull()
      .references(() => recipesTable.id, { onDelete: "cascade" }),
    /** 原始目录的稳定编号。 */ sourceId: text("source_id").notNull(),
    /** 上游相对路径。 */ path: text("path").notNull(),
    /** 锁定版本的源地址。 */ url: text("url").notNull(),
    /** 上游 commit。 */ commit: text("commit").notNull(),
    /** 源许可证。 */ license: text("license").notNull(),
    /** 导入时原文，后台不改写。 */ markdown: text("markdown").notNull(),
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
    unique("recipe_sources_recipe_unique").on(table.recipeId),
    unique("recipe_sources_source_id_unique").on(table.sourceId),
  ],
);
