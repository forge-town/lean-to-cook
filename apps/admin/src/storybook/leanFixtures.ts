import type { CatalogDetail, CatalogLeanArtifact } from "@repo/schemas/catalog";
import quantities from "@repo/lean-proofs/Core/Quantities.lean?raw";
import references from "@repo/lean-proofs/DataContracts/References.lean?raw";
import ingredients from "@repo/lean-proofs/DataContracts/Ingredients.lean?raw";
import recipes from "@repo/lean-proofs/DataContracts/Recipes.lean?raw";
import proofs from "@repo/lean-proofs/DataContracts/Proofs.lean?raw";
const modelSource = [quantities, references, ingredients, recipes, proofs]
  .map((part) => part.replaceAll(/^import .+\n/gm, ""))
  .join("\n");
export const leanFixtureFor = (record: CatalogDetail): CatalogLeanArtifact => {
  const ingredient = record.resource === "ingredients";
  const name = "title" in record.values ? record.values.title : record.values.name;
  const namespace = `LeanToCook.AdminSnapshots.${ingredient ? "Ingredient" : "Recipe"}_${record.id.replaceAll("-", "")}`;
  const body = ingredient
    ? `def allowedImages : List String := []
def record : Ingredient := {
 id := "${record.id}"
 revision := "${record.updatedAt}"
 name := ${JSON.stringify(name)}
 sourceName := "西红柿"
 category := none
 description := "适合炒菜、煮汤。"
 aliases := ["番茄"]
 imageKey := none
 recipeIds := []
}
theorem data_valid : ingredientValid allowedImages record = true := by decide`
    : `def record : Recipe := {
 id := "${record.id}"
 revision := "${record.updatedAt}"
 title := ${JSON.stringify(name)}
 category := none
 description := "一道常做的家常菜。"
 servings := some 2
 notes := "出锅前尝一下咸淡。"
 ingredients := []
 units := []
 requirements := [{ label := "鸡蛋 3 个", kind := .unclassified, ingredientId := none, quantityText := "3 个", quantity := none, optional := false }]
 steps := [{ index := 1, instruction := "打散鸡蛋，加入少许盐。" }, { index := 2, instruction := "炒熟鸡蛋后盛出，再炒番茄，最后拌匀。" }]
}
theorem data_valid : recipeValid record = true := by decide`;

  return {
    resource: ingredient ? "ingredients" : "recipes",
    id: record.id,
    updatedAt: record.updatedAt,
    digest: "a".repeat(64),
    source: `import LeanToCook.DataContracts.Recipes\nnamespace ${namespace}\nopen LeanToCook.CatalogData\n${body}\nend ${namespace}\n`,
    modelSource,
    modelPath: "LeanToCook/DataContracts/Recipes.lean",
    declaration: `${namespace}.data_valid`,
    verification: "pending",
    checkedAt: null,
    leanVersion: null,
    origin: null,
  };
};
