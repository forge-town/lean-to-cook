import type { CatalogRepository, catalogDao } from "@repo/models";
type Requirement = Awaited<ReturnType<CatalogRepository["findUnclassifiedRequirements"]>>[number];
type Ingredient = Pick<
  Awaited<ReturnType<typeof catalogDao.listIngredients>>[number],
  "id" | "name" | "sourceName" | "aliases"
>;
const normalize = (value: string) => value.trim().normalize("NFKC").toLocaleLowerCase();
export const planIngredientLinks = (ingredients: Ingredient[], requirements: Requirement[]) => {
  const names = new Map<string, Set<string>>();
  for (const ingredient of ingredients) {
    for (const name of [ingredient.name, ingredient.sourceName, ...ingredient.aliases]) {
      if (!name) continue;
      const key = normalize(name);
      const ids = names.get(key) ?? new Set<string>();
      ids.add(ingredient.id);
      names.set(key, ids);
    }
  }
  const matches = requirements.map((requirement) => ({
    requirement,
    ids: [...(names.get(normalize(requirement.label)) ?? [])],
  }));

  return {
    links: matches.flatMap(({ requirement, ids }) =>
      ids.length === 1 ? [{ requirement, ingredientId: ids[0]! }] : [],
    ),
    unmatched: matches.filter(({ ids }) => ids.length === 0).length,
    ambiguous: matches.filter(({ ids }) => ids.length > 1).length,
  };
};
