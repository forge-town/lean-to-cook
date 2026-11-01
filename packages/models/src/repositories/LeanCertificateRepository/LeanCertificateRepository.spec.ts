import { afterAll, expect, it } from "vitest";
import { db, databaseClient } from "@repo/db";
import { ingredientsTable, ingredientLeanCertificatesTable } from "@repo/db-schema";
import { eq } from "drizzle-orm";
import { LeanCertificateRepository } from "./LeanCertificateRepository";
import { leanCertificateDao } from "../../daos/leanCertificateDao/leanCertificate.dao";
const id = crypto.randomUUID();
afterAll(async () => {
  await db.delete(ingredientsTable).where(eq(ingredientsTable.id, id));
  await databaseClient.end();
});
it("stores immutable owner/digest certificates and rolls back a mixed invalid batch", async () => {
  await db
    .insert(ingredientsTable)
    .values({ id, name: `Lean test ${id}`, sourceName: `Lean test ${id}` });
  const row = {
    ingredientId: id,
    contentDigest: "a".repeat(64),
    source: "test source",
    modelSource: "test model",
    leanVersion: "test compiler",
  };
  expect(await LeanCertificateRepository.saveBatch({ recipes: [], ingredients: [row] })).toEqual({
    inserted: 1,
  });
  expect(
    await LeanCertificateRepository.saveBatch({
      recipes: [],
      ingredients: [{ ...row, source: "must not replace" }],
    }),
  ).toEqual({ inserted: 0 });
  expect(
    (
      await leanCertificateDao.findIngredient({
        ingredientId: id,
        contentDigest: row.contentDigest,
      })
    )?.source,
  ).toBe(row.source);
  expect(
    await leanCertificateDao.findIngredient({ ingredientId: id, contentDigest: "b".repeat(64) }),
  ).toBeNull();
  await expect(
    LeanCertificateRepository.saveBatch({
      recipes: [],
      ingredients: [
        { ...row, contentDigest: "b".repeat(64) },
        { ...row, ingredientId: crypto.randomUUID() },
      ],
    }),
  ).rejects.toBeDefined();
  expect(
    await leanCertificateDao.findIngredient({ ingredientId: id, contentDigest: "b".repeat(64) }),
  ).toBeNull();
  await db.delete(ingredientsTable).where(eq(ingredientsTable.id, id));
  expect(
    await db
      .select()
      .from(ingredientLeanCertificatesTable)
      .where(eq(ingredientLeanCertificatesTable.ingredientId, id)),
  ).toEqual([]);
});
