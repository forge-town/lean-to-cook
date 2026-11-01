import { getSourceRecipeById } from "@repo/schemas";
import type { CatalogDetail } from "@repo/schemas/catalog";
export const catalogPublicPath = (
  id: string,
  publication: CatalogDetail["publication"],
  source?: { sourceId: string; commit: string; path: string },
): string | null => {
  if (publication === "published") return `/catalog/recipes/${id}`;
  const known = source ? getSourceRecipeById(source.sourceId) : undefined;

  return source &&
    known &&
    source.commit === known.upstreamCommit &&
    source.path === known.sourcePath
    ? `/source-recipe/${known.id}`
    : null;
};
