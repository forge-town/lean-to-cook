import { catalogPublicPath } from "../catalogPublicPath/catalogPublicPath.helper";
import { createHash } from "node:crypto";
import type { CatalogRepository } from "@repo/models";
import { CatalogDetailSchema, type CatalogDetail } from "@repo/schemas/catalog";
import { CatalogServiceError } from "../../Catalog.service.error";

type RawRecord = NonNullable<Awaited<ReturnType<CatalogRepository["get"]>>>;
export const describeRecord = (
  raw: RawRecord,
): { detail: CatalogDetail; contentDigest: string | null } => {
  const common = {
    id: raw.record.id,
    resource: raw.resource,
    updatedAt: raw.record.updatedAt.toISOString(),
    verification: "not_verified" as const,
    source: null,
    references: [],
    publication: null,
  };
  if (raw.resource === "recipes") {
    const row = raw.record;
    const values = {
      title: row.title,
      description: row.description,
      categoryId: row.categoryId,
      servings: row.servings,
      notes: row.notes,
      requirements: row.recipeRequirements.map((r) => ({
        label: r.label,
        kind: r.kind,
        ingredientId: r.ingredientId,
        quantityText: r.quantityText,
        amount: r.amount,
        unitId: r.unitId,
        optional: r.optional,
      })),
      steps: row.recipeSteps.map((s) => s.instruction),
    };
    const source = row.recipeSources[0];
    const references = [
      ...(row.category
        ? [{ kind: "category", id: row.category.id, name: row.category.name, code: null }]
        : []),
      ...row.recipeRequirements.flatMap((r) => [
        ...(r.ingredient
          ? [{ kind: "ingredient", id: r.ingredient.id, name: r.ingredient.name, code: null }]
          : []),
        ...(r.unit ? [{ kind: "unit", id: r.unit.id, name: r.unit.name, code: r.unit.code }] : []),
      ]),
    ];
    const candidate = CatalogDetailSchema.safeParse({
      ...common,
      values,
      references,
      source: source
        ? {
            url: source.url,
            commit: source.commit,
            path: source.path,
            license: source.license,
            markdown: source.markdown,
          }
        : null,
      publication: "draft",
    });
    if (!candidate.success)
      throw new CatalogServiceError(
        "INTERNAL",
        "菜谱内容格式有误，请检查导入记录",
        candidate.error,
      );
    const contentDigest = createHash("sha256")
      .update(
        JSON.stringify({
          values: candidate.data.values,
          references: candidate.data.references,
          source: candidate.data.source,
        }),
      )
      .digest("hex");
    const publication = row.recipePublications[0];

    const state = publication
      ? publication.contentDigest === contentDigest
        ? "published"
        : "changed"
      : "draft";

    return {
      detail: {
        ...candidate.data,
        publication: state,
        publicPath: catalogPublicPath(row.id, state, source),
      },
      contentDigest,
    };
  }
  const values =
    raw.resource === "ingredients"
      ? {
          name: raw.record.name,
          imageKey: raw.record.imageKey,
          categoryId: raw.record.categoryId,
          description: raw.record.description,
          aliases: raw.record.ingredientAliases.map((a) => a.name),
        }
      : raw.resource === "units"
        ? { name: raw.record.name, code: raw.record.code, dimension: raw.record.dimension }
        : { name: raw.record.name };
  const references =
    raw.resource === "ingredients"
      ? [
          ...(raw.record.category
            ? [
                {
                  kind: "category",
                  id: raw.record.category.id,
                  name: raw.record.category.name,
                  code: null,
                },
              ]
            : []),
          ...[
            ...new Map(
              raw.record.recipeRequirements.map(({ recipe }) => [recipe.id, recipe]),
            ).values(),
          ]
            .sort((a, b) => a.title.localeCompare(b.title, "zh-CN"))
            .map((recipe) => ({ kind: "recipe", id: recipe.id, name: recipe.title, code: null })),
        ]
      : [];
  const parsed = CatalogDetailSchema.safeParse({ ...common, values, references });
  if (!parsed.success)
    throw new CatalogServiceError("INTERNAL", "记录格式有误，请检查数据", parsed.error);

  return { detail: parsed.data, contentDigest: null };
};
