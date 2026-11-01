import { check, pgTable, text, timestamp, unique, uuid } from "drizzle-orm/pg-core";
import { sql } from "drizzle-orm";
import { ingredientsTable } from "./ingredients_table";
/** A successful kernel check of one exact ingredient data module and its model. */
export const ingredientLeanCertificatesTable = pgTable(
  "ingredient_lean_certificates",
  {
    /** Certificate identity. */ id: uuid("id").primaryKey().defaultRandom(),
    /** Owning ingredient; certificates disappear with that ingredient. */ ingredientId: uuid(
      "ingredient_id",
    )
      .notNull()
      .references(() => ingredientsTable.id, { onDelete: "cascade" }),
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
    unique("ingredient_lean_certificates_owner_digest_unique").on(
      table.ingredientId,
      table.contentDigest,
    ),
    check("ingredient_lean_certificates_digest", sql`${table.contentDigest} ~ '^[a-f0-9]{64}$'`),
  ],
);
