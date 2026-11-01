import { LeanCertificateRepository } from "@repo/models";
import type { CatalogLeanArtifact, CatalogLeanIdentity } from "@repo/schemas/catalog";
import { ResultAsync } from "neverthrow";
import { CatalogServiceError, mapCatalogError } from "../../Catalog.service.error";
import { getLeanMethod } from "../getLean/getLean.method";
import { loadLeanModel } from "../../helpers/loadLeanModel/loadLeanModel.helper";
import { compileCatalogLean } from "../../helpers/compileCatalogLean/compileCatalogLean.helper";
export const checkLeanMethod = (
  input: CatalogLeanIdentity,
): ResultAsync<CatalogLeanArtifact, CatalogServiceError> =>
  getLeanMethod(input).andThen((artifact) => {
    if (artifact.verification === "checked")
      return ResultAsync.fromSafePromise(Promise.resolve(artifact));

    return ResultAsync.fromPromise(
      (async () => {
        const { leanVersion } = await compileCatalogLean([artifact.source]);
        if ((await loadLeanModel()) !== artifact.modelSource)
          throw new CatalogServiceError("CONFLICT", "Lean 模型已变化，请重新校验");
        const values = {
          contentDigest: artifact.digest,
          source: artifact.source,
          modelSource: artifact.modelSource,
          leanVersion,
        };
        await LeanCertificateRepository.saveBatch({
          recipes: input.resource === "recipes" ? [{ ...values, recipeId: input.id }] : [],
          ingredients:
            input.resource === "ingredients" ? [{ ...values, ingredientId: input.id }] : [],
        });
      })(),
      mapCatalogError,
    ).andThen(() => getLeanMethod(input));
  });
