import { ingredientImageKeys, type CatalogDetail } from "@repo/schemas/catalog";
export const leanString = (value: string): string =>
  `"${[...value]
    .map((char) => {
      if (char === '"') return '\\"';
      if (char === "\\") return "\\\\";
      if (char === "\n") return "\\n";
      if (char === "\r") return "\\r";
      if (char === "\t") return "\\t";
      const point = char.codePointAt(0)!;

      return point < 32 || point === 127 ? `\\u${point.toString(16).padStart(4, "0")}` : char;
    })
    .join("")}"`;
const list = (items: string[]) => `[${items.join(", ")}]`;
const option = (value: string | null | undefined) =>
  value == null ? "none" : `some ${leanString(value)}`;
const reference = (value: CatalogDetail["references"][number]) =>
  `{ id := ${leanString(value.id)}, name := ${leanString(value.name)} }`;
const uniqueReferences = (
  record: CatalogDetail,
  kind: CatalogDetail["references"][number]["kind"],
) => [
  ...new Map(
    record.references.filter((row) => row.kind === kind).map((row) => [row.id, row]),
  ).values(),
];
const microUnits = (value: string) => {
  const [whole = "0", fraction = ""] = value.split(".");

  return (BigInt(whole) * 1_000_000n + BigInt(fraction.padEnd(6, "0"))).toString();
};
export const renderCatalogLean = (record: CatalogDetail, sourceName: string | null = null) => {
  const namespace = `LeanToCook.AdminSnapshots.${record.resource === "recipes" ? "Recipe" : "Ingredient"}_${record.id.replaceAll("-", "")}`;
  const values = record.values;
  const category =
    "categoryId" in values
      ? record.references.find((r) => r.kind === "category" && r.id === values.categoryId)
      : undefined;
  const common = `  id := ${leanString(record.id)}\n  revision := ${leanString(record.updatedAt)}`;
  const body =
    record.resource === "ingredients" && "aliases" in values
      ? `
def allowedImages : List String := ${list(ingredientImageKeys.map(leanString))}

def record : Ingredient := {
${common}
  name := ${leanString(values.name)}
  sourceName := ${leanString(sourceName ?? values.name)}
  category := ${category ? `some ${reference(category)}` : "none"}
  description := ${leanString(values.description)}
  aliases := ${list(values.aliases.map(leanString))}
  imageKey := ${option(values.imageKey)}
  recipeIds := ${list(uniqueReferences(record, "recipe").map((r) => leanString(r.id)))}
}

theorem data_valid : ingredientValid allowedImages record = true := by decide +kernel
`
      : record.resource === "recipes" && "requirements" in values
        ? `
def record : Recipe := {
${common}
  title := ${leanString(values.title)}
  category := ${category ? `some ${reference(category)}` : "none"}
  description := ${leanString(values.description)}
  servings := ${values.servings === null ? "none" : `some ${values.servings}`}
  notes := ${leanString(values.notes)}
  ingredients := ${list(uniqueReferences(record, "ingredient").map(reference))}
  units := ${list(uniqueReferences(record, "unit").map(reference))}
  requirements := [
${values.requirements.map((r) => `    { label := ${leanString(r.label)}, kind := .${r.kind}, ingredientId := ${option(r.ingredientId)}, quantityText := ${leanString(r.quantityText)}, quantity := ${r.amount === null || r.unitId === null ? "none" : `some { microUnits := ${microUnits(r.amount)}, unitId := ${leanString(r.unitId)} }`}, optional := ${r.optional} }`).join(",\n")}
  ]
  steps := [
${values.steps.map((step, index) => `    { index := ${index + 1}, instruction := ${leanString(step)} }`).join(",\n")}
  ]
}

theorem data_valid : recipeValid record = true := by decide +kernel
`
        : null;
  if (body === null) throw new Error("Lean data is only defined for recipes and ingredients");

  return {
    declaration: `${namespace}.data_valid`,
    source: `import LeanToCook.DataContracts.Recipes\n\nset_option maxRecDepth 10000\nset_option maxHeartbeats 2000000\n\nnamespace ${namespace}\nopen LeanToCook.CatalogData\n${body}\nend ${namespace}\n`,
  };
};
