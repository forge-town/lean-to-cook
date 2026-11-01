import { check, pgTable, text, timestamp, unique, uuid } from "drizzle-orm/pg-core";
import { sql } from "drizzle-orm";
import { recipesTable } from "./recipes_table";
/** A successful kernel check of one exact recipe data module and its model. */
export const recipeLeanCertificatesTable = pgTable(
  "recipe_lean_certificates",
  {
    /** Certificate identity. */ id: uuid("id").primaryKey().defaultRandom(),
    /** Owning recipe; certificates disappear with that recipe. */ recipeId: uuid("recipe_id")
      .notNull()
      .references(() => recipesTable.id, { onDelete: "cascade" }),
    /** SHA-256 of the exact checked module and model bytes. */ contentDigest:
      text("content_digest").notNull(),
    /** Checked record module. */ source: text("source").notNull(),
    /** Exact imported data model checked with it. */ modelSource: text("model_source").notNull(),
    /** Compiler's actual version string. */ leanVersion: text("lean_version").notNull(),
    /** Certificate issuance time after successful compilation. */ createdAt: timestamp(
      "created_at",
      { withTimezone: true, precision: 3 },
    )
      .notNull()
      .defaultNow(),
    /** Persistence envelope; certificates are not updated in place. */ updatedAt: timestamp(
      "updated_at",
      { withTimezone: true, precision: 3 },
    )
      .notNull()
      .defaultNow(),
  },
  (table) => [
    unique("recipe_lean_certificates_owner_digest_unique").on(table.recipeId, table.contentDigest),
    check("recipe_lean_certificates_digest", sql`${table.contentDigest} ~ '^[a-f0-9]{64}$'`),
  ],
);
