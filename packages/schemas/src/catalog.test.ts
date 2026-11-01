import { describe, expect, test } from "vitest";
import {
  buildProofTrace,
  crossRecipeInferences,
  getRecipeById,
  recipeCatalog,
  recipeSchema,
  type RecipeCategory,
  resolveRecipeQuantities,
  validateRecipeFlow,
} from "./index";

describe("recipe proof catalog", () => {
  test("turns the heat off before pouring chili oil and adds sugar only after cooling", () => {
    const recipe = getRecipeById("chili-oil")!;
    const [prepare, process, finish, plate] = recipe.steps;
    if (!prepare || !process || !finish || !plate) throw new Error("Missing chili oil stages");
    expect(recipe.ingredients.map(({ id }) => id)).toEqual(expect.arrayContaining(["salt", "garlic", "freshChili", "vinegar"]));
    expect(prepare.inputs).not.toContain("sugar");
    expect(process.actions).toContain("turnOffHeat");
    expect(process.effects).toEqual(expect.arrayContaining([{ predicate: "heat.on", value: false }, { predicate: "heat.off", value: true }]));
    expect(finish.requires).toContain("heat.off");
    expect(plate.inputs).toContain("sugar");
    expect(plate.instruction).toContain("温热");
    expect(validateRecipeFlow(recipe)).toEqual({ errors: [], valid: true });
  });
  test("names cooking actions rather than completed states throughout the navigator", () => {
    for (const recipe of recipeCatalog) {
      for (const step of recipe.steps) {
        expect(step.stageTitle).not.toMatch(/已经|已完成|正在|已装|都已|约束满足/u);
      }
    }
    expect(getRecipeById("milk-tea")?.steps.map(({ stageTitle, formalAction, actions }) => ({ stageTitle, formalAction, actions }))).toEqual([
      { stageTitle: "放入茶包，备好沸水", formalAction: "prepareCatalogCase", actions: ["add"] },
      { stageTitle: "注水焖泡 20–30 分钟", formalAction: "processCatalogCase", actions: ["brew"] },
      { stageTitle: "加奶加糖，搅拌均匀", formalAction: "finishCatalogCase", actions: ["add", "mix"] },
      { stageTitle: "装杯", formalAction: "plateCatalogCase", actions: ["plate"] },
    ]);
  });
  test("publishes twenty strict and continuous recipe cases", () => {
    expect(recipeCatalog).toHaveLength(20);

    for (const recipe of recipeCatalog) {
      expect(recipeSchema.parse(recipe)).toEqual(recipe);
      expect(validateRecipeFlow(recipe)).toEqual({ errors: [], valid: true });
      expect(buildProofTrace(recipe).steps).toHaveLength(recipe.steps.length);
    }
  });

  test("covers every official category with exactly two cases", () => {
    const counts = Object.fromEntries(
      recipeCatalog.map(({ category }) => [category, 0]),
    ) as Record<RecipeCategory, number>;

    for (const recipe of recipeCatalog) {
      counts[recipe.category] += 1;
    }

    expect(counts).toEqual({
      aquatic: 2,
      breakfast: 2,
      condiment: 2,
      dessert: 2,
      drink: 2,
      meat: 2,
      semiFinished: 2,
      soup: 2,
      staple: 2,
      vegetable: 2,
    });
  });

  test("covers pan-frying, soup simmering, and steaming", () => {
    expect(getRecipeById("butter-pan-fried-shrimp")?.presentation.scene).toBe("butterShrimp");
    expect(getRecipeById("corn-rib-soup")?.presentation.scene).toBe("cornRibSoup");
    expect(getRecipeById("steamed-sea-bass")?.presentation.scene).toBe("steamedSeaBass");
  });

  test("resolves the two new source-batch quantity contracts", () => {
    const wings = getRecipeById("cola-chicken-wings");
    const fresh = getRecipeById("three-fresh");

    expect(wings).toBeDefined();
    expect(fresh).toBeDefined();

    if (!wings || !fresh) {
      return;
    }

    expect(resolveRecipeQuantities(wings, 1).chickenWings).toMatchObject({
      max: 12,
      min: 10,
      unit: "piece",
    });
    expect(resolveRecipeQuantities(wings, 1).cola).toMatchObject({
      max: 500,
      min: 500,
      unit: "milliliter",
    });
    expect(resolveRecipeQuantities(fresh, 1).eggplant).toMatchObject({
      max: 200,
      min: 200,
      unit: "gram",
    });
    expect(resolveRecipeQuantities(fresh, 1).pepper).toMatchObject({
      max: 4,
      min: 3,
      unit: "piece",
    });
  });

  test("connects every cross-recipe premise to a real verified theorem", () => {
    expect(crossRecipeInferences).toHaveLength(12);

    for (const inference of crossRecipeInferences) {
      for (const premise of inference.premises) {
        const recipe = getRecipeById(premise.recipeId);
        const theorem = recipe?.proof.theorems.find((item) => item.name === premise.theorem);

        expect(theorem?.status).toBe("verified");
      }
    }
  });
});
