import { db } from "@repo/db";
import { recipeLeanCertificatesTable } from "@repo/db-schema";
import { and, eq } from "drizzle-orm";
export const findRecipeOperation = async (
  input: Pick<typeof recipeLeanCertificatesTable.$inferSelect, "recipeId" | "contentDigest">,
) =>
  (await db.query.recipeLeanCertificatesTable.findFirst({
    where: and(
      eq(recipeLeanCertificatesTable.recipeId, input.recipeId),
      eq(recipeLeanCertificatesTable.contentDigest, input.contentDigest),
    ),
  })) ?? null;
