import {
  RecipeInputSchema,
  IngredientInputSchema,
  UnitInputSchema,
  CategoryInputSchema,
  type CatalogResource,
  type CatalogValues,
} from "@repo/schemas/catalog";
import type { EditorValues } from "../_schemas/EditorValues.schema";
export const emptyRequirement = (): EditorValues["requirements"][number] => ({
  key: crypto.randomUUID(),
  label: "",
  kind: "unclassified",
  ingredientId: "",
  quantityText: "",
  amount: "",
  unitId: "",
  optional: "required",
});
export const toEditorValues = (resource: CatalogResource, input?: CatalogValues): EditorValues => {
  const result: EditorValues = {
    imageKey: null,
    name: "",
    title: "",
    categoryId: "",
    description: "",
    servings: "",
    notes: "",
    code: "",
    dimension: "other",
    aliasesText: "",
    requirements: [emptyRequirement()],
    steps: [{ key: crypto.randomUUID(), instruction: "" }],
  };
  if (!input) return result;
  if (resource === "recipes") {
    const value = RecipeInputSchema.parse(input);

    return {
      ...result,
      ...value,
      categoryId: value.categoryId ?? "",
      servings: value.servings?.toString() ?? "",
      requirements: value.requirements.map((r) => ({
        ...r,
        key: crypto.randomUUID(),
        ingredientId: r.ingredientId ?? "",
        amount: r.amount?.toString() ?? "",
        unitId: r.unitId ?? "",
        optional: r.optional ? "optional" : "required",
      })),
      steps: value.steps.map((instruction) => ({ key: crypto.randomUUID(), instruction })),
    };
  }
  if (resource === "ingredients") {
    const value = IngredientInputSchema.parse(input);

    return {
      ...result,
      ...value,
      categoryId: value.categoryId ?? "",
      aliasesText: value.aliases.join("\n"),
      imageKey: value.imageKey ?? null,
    };
  }
  if (resource === "units") return { ...result, ...UnitInputSchema.parse(input) };

  return { ...result, ...CategoryInputSchema.parse(input) };
};
export const toWriteValues = (resource: CatalogResource, value: EditorValues) => {
  if (resource === "recipes")
    return {
      title: value.title,
      categoryId: value.categoryId || null,
      description: value.description,
      servings: value.servings.trim() === "" ? null : Number(value.servings),
      notes: value.notes,
      requirements: value.requirements.map((r) => ({
        label: r.label,
        kind: r.kind,
        ingredientId: r.kind === "ingredient" ? r.ingredientId || null : null,
        quantityText: r.quantityText,
        amount: r.amount.trim() === "" ? null : r.amount.trim(),
        unitId: r.unitId || null,
        optional: r.optional === "optional",
      })),
      steps: value.steps.map((s) => s.instruction),
    };
  if (resource === "ingredients")
    return {
      name: value.name,
      imageKey: value.imageKey,
      description: value.description,
      categoryId: value.categoryId || null,
      aliases: value.aliasesText
        .split("\n")
        .map((s) => s.trim())
        .filter(Boolean),
    };
  if (resource === "units")
    return { name: value.name, code: value.code, dimension: value.dimension };

  return { name: value.name };
};
