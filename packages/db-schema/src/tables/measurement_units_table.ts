import { sql } from "drizzle-orm";
import { check, pgTable, text, timestamp, uniqueIndex, uuid } from "drizzle-orm/pg-core";

/** measurement_units 的领域持久化记录。 */
export const measurementUnitsTable = pgTable(
  "measurement_units",
  {
    /** 应用生成的稳定身份。 */ id: uuid("id").primaryKey().defaultRandom(),
    /** 稳定单位代码。 */ code: text("code").notNull(),
    /** 单位显示名称。 */ name: text("name").notNull(),
    /** mass、volume、count 或 other。 */ dimension: text("dimension").notNull(),
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
    uniqueIndex("measurement_units_name_unique").on(sql`lower(normalize(${table.name}, NFKC))`),
    check(
      "measurement_units_name_not_blank",
      sql`char_length(btrim(${table.name})) between 1 and 100`,
    ),
    uniqueIndex("measurement_units_code_unique").on(sql`lower(${table.code})`),
    check(
      "measurement_units_dimension",
      sql`${table.dimension} in ('mass', 'volume', 'count', 'other')`,
    ),
  ],
);
