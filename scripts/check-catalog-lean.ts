import { ResultAsync } from "neverthrow";
import { db, databaseClient } from "../packages/db/src/connection";
import { recipesTable, ingredientsTable } from "../packages/db-schema/src";
import { LeanCertificateRepository } from "../packages/models/src/repositories/LeanCertificateRepository/LeanCertificateRepository";
import { CatalogService } from "../packages/services/src/CatalogService/Catalog.service";
import { compileCatalogLean } from "../packages/services/src/CatalogService/helpers/compileCatalogLean/compileCatalogLean.helper";
import { loadLeanModel } from "../packages/services/src/CatalogService/helpers/loadLeanModel/loadLeanModel.helper";
const result = await ResultAsync.fromPromise(
  (async () => {
    const [recipes, ingredients] = await Promise.all([
      db.select({ id: recipesTable.id }).from(recipesTable),
      db.select({ id: ingredientsTable.id }).from(ingredientsTable),
    ]);
    const identities = [
      ...recipes.map((row) => ({ ...row, resource: "recipes" as const })),
      ...ingredients.map((row) => ({ ...row, resource: "ingredients" as const })),
    ];
    const artifacts = await Promise.all(
      identities.map(async (identity) =>
        (await CatalogService.getLean(identity)).match(
          (value) => value,
          (error) => {
            throw error;
          },
        ),
      ),
    );
    const pending = artifacts.filter((artifact) => artifact.verification === "pending");
    if (pending.length === 0)
      return {
        recipes: recipes.length,
        ingredients: ingredients.length,
        checked: artifacts.length,
        inserted: 0,
      };
    const progress = { inserted: 0, leanVersion: "" };
    for (let offset = 0; offset < pending.length; offset += 5) {
      const chunk = pending.slice(offset, offset + 5);
      const compiled = await compileCatalogLean(chunk.map((artifact) => artifact.source));
      progress.leanVersion = compiled.leanVersion;
      const model = await loadLeanModel();
      if (chunk.some((artifact) => artifact.modelSource !== model))
        throw new Error("Lean model changed during checking");
      const values = chunk.map((artifact) => ({
        artifact,
        values: {
          contentDigest: artifact.digest,
          source: artifact.source,
          modelSource: artifact.modelSource,
          leanVersion: compiled.leanVersion,
        },
      }));
      const saved = await LeanCertificateRepository.saveBatch({
        recipes: values.flatMap(({ artifact, values }) =>
          artifact.resource === "recipes" ? [{ ...values, recipeId: artifact.id }] : [],
        ),
        ingredients: values.flatMap(({ artifact, values }) =>
          artifact.resource === "ingredients" ? [{ ...values, ingredientId: artifact.id }] : [],
        ),
      });
      progress.inserted += saved.inserted;
      console.log(`Lean checked ${Math.min(offset + 5, pending.length)}/${pending.length}`);
    }
    const current = await Promise.all(
      identities.map(async (identity) => {
        const result = await CatalogService.getLean(identity);
        return result._unsafeUnwrap();
      }),
    );
    if (current.some((artifact) => artifact.verification !== "checked"))
      throw new Error("Catalog changed during checking; run the command again");
    return {
      recipes: recipes.length,
      ingredients: ingredients.length,
      checked: artifacts.length,
      ...progress,
    };
  })(),
  (error) => (error instanceof Error ? error : new Error("Lean checking failed")),
);
result.match(
  (value) => console.log(JSON.stringify(value, null, 2)),
  (error) => {
    console.error(error.message);
    process.exitCode = 1;
  },
);
await databaseClient.end();
