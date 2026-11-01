import { CatalogRepository, catalogDao } from "@repo/models";
import { ResultAsync } from "neverthrow";
import { IngredientLinkReportSchema, type IngredientLinkReport } from "@repo/schemas/catalog";
import { mapCatalogError, type CatalogServiceError } from "../../Catalog.service.error";
import { planIngredientLinks } from "../../helpers/planIngredientLinks/planIngredientLinks.helper";
export const reconcileIngredientsMethod = (input: {
  apply: boolean;
}): ResultAsync<IngredientLinkReport, CatalogServiceError> =>
  ResultAsync.fromPromise(
    (async () => {
      const [ingredients, requirements] = await Promise.all([
        catalogDao.listIngredients(),
        CatalogRepository.findUnclassifiedRequirements(),
      ]);
      const plan = planIngredientLinks(ingredients, requirements);
      const outcome = input.apply
        ? await CatalogRepository.linkIngredients(plan.links)
        : { linked: 0, recipes: 0 };

      return IngredientLinkReportSchema.parse({
        applied: input.apply,
        matched: plan.links.length,
        ...outcome,
        unmatched: plan.unmatched,
        ambiguous: plan.ambiguous,
      });
    })(),
    mapCatalogError,
  );
