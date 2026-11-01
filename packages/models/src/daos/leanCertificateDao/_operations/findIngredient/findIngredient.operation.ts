import { db } from "@repo/db";
import { ingredientLeanCertificatesTable } from "@repo/db-schema";
import { and, eq } from "drizzle-orm";
export const findIngredientOperation = async (
  input: Pick<
    typeof ingredientLeanCertificatesTable.$inferSelect,
    "ingredientId" | "contentDigest"
  >,
) =>
  (await db.query.ingredientLeanCertificatesTable.findFirst({
    where: and(
      eq(ingredientLeanCertificatesTable.ingredientId, input.ingredientId),
      eq(ingredientLeanCertificatesTable.contentDigest, input.contentDigest),
    ),
  })) ?? null;
