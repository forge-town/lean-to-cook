import { findUnclassifiedRequirementsOperation } from "./_operations/findUnclassifiedRequirements/findUnclassifiedRequirements.operation";
import { linkIngredientsOperation } from "./_operations/linkIngredients/linkIngredients.operation";
import { findPublicationCandidatesOperation } from "./_operations/findPublicationCandidates/findPublicationCandidates.operation";
import { importSourceOperation } from "./_operations/importSource/importSource.operation";
import { publishOperation } from "./_operations/publish/publish.operation";
import { getOperation } from "./_operations/get/get.operation";
import { saveOperation } from "./_operations/save/save.operation";
import { removeOperation } from "./_operations/remove/remove.operation";
import { readPageOperation, usageCountOperation } from "./_operations/readPage/readPage.operation";
export const CatalogRepository = {
  findPublicationCandidates: findPublicationCandidatesOperation,
  findUnclassifiedRequirements: findUnclassifiedRequirementsOperation,
  linkIngredients: linkIngredientsOperation,
  save: saveOperation,
  importSource: importSourceOperation,
  get: getOperation,
  remove: removeOperation,
  readPage: readPageOperation,
  usageCount: usageCountOperation,
  publish: publishOperation,
};
export type CatalogRepository = typeof CatalogRepository;
