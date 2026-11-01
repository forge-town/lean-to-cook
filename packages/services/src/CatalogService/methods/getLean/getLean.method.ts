import { createHash } from "node:crypto";
import { CatalogRepository, leanCertificateDao } from "@repo/models";
import {
  CatalogLeanArtifactSchema,
  type CatalogLeanArtifact,
  type CatalogLeanIdentity,
} from "@repo/schemas/catalog";
import { ResultAsync } from "neverthrow";
import { CatalogServiceError, mapCatalogError } from "../../Catalog.service.error";
import { describeRecord } from "../../helpers/describeRecord/describeRecord.helper";
import { renderCatalogLean } from "../../helpers/renderCatalogLean/renderCatalogLean.helper";
import { loadLeanModel, loadOriginLean } from "../../helpers/loadLeanModel/loadLeanModel.helper";
export const getLeanMethod = (
  input: CatalogLeanIdentity,
): ResultAsync<CatalogLeanArtifact, CatalogServiceError> =>
  ResultAsync.fromPromise(
    (async () => {
      const raw = await CatalogRepository.get(input);
      if (!raw) throw new CatalogServiceError("NOT_FOUND", "这条记录不存在");
      const detail = describeRecord(raw).detail;
      const rendered = renderCatalogLean(
        detail,
        raw.resource === "ingredients" ? raw.record.sourceName : null,
      );
      const modelSource = await loadLeanModel();
      const digest = createHash("sha256")
        .update(`${rendered.source}\0${modelSource}`)
        .digest("hex");
      const certificate =
        input.resource === "recipes"
          ? await leanCertificateDao.findRecipe({ recipeId: input.id, contentDigest: digest })
          : await leanCertificateDao.findIngredient({
              ingredientId: input.id,
              contentDigest: digest,
            });
      const checked =
        certificate?.source === rendered.source && certificate.modelSource === modelSource;

      return CatalogLeanArtifactSchema.parse({
        ...input,
        updatedAt: detail.updatedAt,
        ...rendered,
        modelSource,
        modelPath: "LeanToCook/DataContracts/Recipes.lean",
        digest,
        verification: checked ? "checked" : "pending",
        checkedAt: checked ? certificate.createdAt.toISOString() : null,
        leanVersion: checked ? certificate.leanVersion : null,
        origin: await loadOriginLean(raw),
      });
    })(),
    mapCatalogError,
  );
