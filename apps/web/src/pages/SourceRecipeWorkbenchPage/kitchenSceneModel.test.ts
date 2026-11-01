import { sourceRecipeCatalog, getRecipeById } from "@repo/schemas";
import { buildSimulatorSceneModel } from "../SimulatorPage/simulatorModel";
import { readFileSync } from "node:fs";
import { resolve } from "node:path";
import { describe, expect, it } from "vitest";

import { buildKitchenSceneModel } from "./kitchenSceneModel";
import { buildSourceRecipeWorkbenchModel } from "./sourceRecipeWorkbenchModel";

const loadModelByTitle = (title: string) => {
  const sourceRecipe = sourceRecipeCatalog.find((recipe) => recipe.title === title);

  if (!sourceRecipe) throw new Error(`Missing source recipe: ${title}`);

  const sourcePath = resolve(process.cwd(), "../../content/how-to-cook", sourceRecipe.sourcePath);
  const model = buildSourceRecipeWorkbenchModel(readFileSync(sourcePath, "utf8"));

  return { model, sourceRecipe };
};

describe("buildKitchenSceneModel", () => {
  it("distinguishes source washing from cutting and mixed drink or fish actions", () => {
    const source = loadModelByTitle("白灼菜心");
    expect(
      buildKitchenSceneModel(
        source.model,
        source.sourceRecipe.title,
        source.sourceRecipe.category,
        1
      ).method
    ).toBe("wash");
    for (const id of ["three-fresh", "tomato-scrambled-eggs"]) {
      const recipe = getRecipeById(id)!;
      const model = buildSimulatorSceneModel(recipe);
      const scene = buildKitchenSceneModel(model, recipe.title, recipe.category, 1);
      expect(scene.method).toBe("wash");
      expect(scene.activeIngredients.every(({ state }) => state === "washed")).toBe(true);
      expect(scene.atmosphere).toBe("dry");
    }
    const lemon = getRecipeById("lemon-water")!;
    expect(
      buildKitchenSceneModel(buildSimulatorSceneModel(lemon), lemon.title, lemon.category, 1).method
    ).toBe("cupAdd");
    const fish = getRecipeById("steamed-sea-bass")!;
    expect(
      buildKitchenSceneModel(buildSimulatorSceneModel(fish), fish.title, fish.category, 2).method
    ).toBe("marinate");
  });
  it("builds ingredient visuals and diverse actions for all 373 recipes", () => {
    const methods = new Set<string>();

    for (const sourceRecipe of sourceRecipeCatalog) {
      const sourcePath = resolve(
        process.cwd(),
        "../../content/how-to-cook",
        sourceRecipe.sourcePath
      );
      const model = buildSourceRecipeWorkbenchModel(readFileSync(sourcePath, "utf8"));
      const scenes = model.steps.map((_, index) =>
        buildKitchenSceneModel(model, sourceRecipe.title, sourceRecipe.category, index + 1)
      );

      expect(scenes.length).toBeGreaterThan(0);
      expect(scenes.slice(0, -1).every((scene) => scene.method !== "plate")).toBe(true);
      expect(scenes.every((scene) => scene.allIngredients.length > 0)).toBe(true);
      scenes.forEach((scene) => methods.add(scene.method));
    }

    expect(methods.size).toBeGreaterThanOrEqual(14);
  });

  it("uses recipe-specific vessels for distinct cooking workflows", () => {
    const potatoes = loadModelByTitle("拔丝土豆");
    const milkTea = loadModelByTitle("奶茶");
    const microwaveCake = loadModelByTitle("微波炉蛋糕");
    const boiledPork = loadModelByTitle("水煮肉片");

    expect(
      buildKitchenSceneModel(
        potatoes.model,
        potatoes.sourceRecipe.title,
        potatoes.sourceRecipe.category,
        2
      ).method
    ).toBe("deepFry");
    expect(
      buildKitchenSceneModel(
        potatoes.model,
        potatoes.sourceRecipe.title,
        potatoes.sourceRecipe.category,
        4
      ).method
    ).toBe("caramelize");
    expect(
      buildKitchenSceneModel(
        milkTea.model,
        milkTea.sourceRecipe.title,
        milkTea.sourceRecipe.category,
        1
      ).method
    ).toBe("brew");
    expect(
      buildKitchenSceneModel(
        microwaveCake.model,
        microwaveCake.sourceRecipe.title,
        microwaveCake.sourceRecipe.category,
        3
      ).method
    ).toBe("microwave");
    expect(
      buildKitchenSceneModel(
        boiledPork.model,
        boiledPork.sourceRecipe.title,
        boiledPork.sourceRecipe.category,
        10
      ).method
    ).toBe("boil");
  });
});

it("keeps removed potatoes in a holding bowl until the final plating step", () => {
  const { model, sourceRecipe } = loadModelByTitle("拔丝土豆");
  const hold = buildKitchenSceneModel(model, sourceRecipe.title, sourceRecipe.category, 3);
  expect(hold.method).toBe("rest");
  expect(hold.atmosphere).toBe("dry");
  expect(hold.allIngredients.find((i) => i.name === "土豆")?.state).toBe("cooked");
  expect(hold.allIngredients.find((i) => i.name === "白砂糖")?.state).not.toBe("cooked");
});

it("uses a cup for the accepted lemon loading, muddling and cold mixing steps", () => {
  const model = {
    ingredients: ["柠檬", "糖浆", "饮用水"],
    amounts: [],
    introduction: [],
    tips: [],
    steps: [
      {
        id: "prepare",
        sequence: 1,
        phase: "入杯",
        instruction: "柠檬洗净并切片，放入约 500ml 杯中。",
      },
      { id: "muddle", sequence: 2, phase: "捶打", instruction: "将柠檬捶打 10 次释放汁液。" },
      {
        id: "mix",
        sequence: 3,
        phase: "混合",
        instruction: "加入 40–45g 糖浆与水，搅匀至约 500ml。",
      },
      { id: "finish", sequence: 4, phase: "完成", instruction: "柠檬水调制完成，即可饮用。" },
    ],
  };
  const load = buildKitchenSceneModel(model, "柠檬水", "drink", 1);
  expect(load.method).toBe("cupAdd");
  expect(load.vesselLabel).toBe("玻璃杯");
  expect(load.atmosphere).toBe("dry");
  expect(load.cupFill).toBe(0);
  const muddle = buildKitchenSceneModel(model, "柠檬水", "drink", 2);
  expect(muddle.method).toBe("muddle");
  expect(muddle.cupFill).toBeGreaterThan(0);
  expect(muddle.cupFill).toBeLessThan(0.5);
  const mixed = buildKitchenSceneModel(model, "柠檬水", "drink", 3);
  expect(mixed.method).toBe("mix");
  expect(mixed.cupFill).toBeGreaterThan(0.5);
  expect(mixed.allIngredients.find((i) => i.name === "柠檬")?.state).toBe("prepped");
  expect(mixed.allIngredients.find((i) => i.name === "饮用水")?.state).toBe("prepped");
});

it("distinguishes manual whisking, torching and barbecue seasoning from appliances", () => {
  for (const [title, step, method] of [
    ["美式炒蛋", 1, "mix"],
    ["虎皮肘子", 2, "torch"],
    ["煎烤羊排", 7, "stirFry"],
  ] as const) {
    const { model, sourceRecipe } = loadModelByTitle(title);
    expect(buildKitchenSceneModel(model, title, sourceRecipe.category, step).method).toBe(method);
  }
});

it("recognizes blender activation, oil preheating and crushing from source actions", () => {
  for (const [title, step, method] of [
    ["奇异果菠菜特调", 8, "blend"],
    ["蒜蓉空心菜", 2, "heat"],
    ["蒜香酱油", 1, "crush"],
  ] as const) {
    const { model, sourceRecipe } = loadModelByTitle(title);
    expect(buildKitchenSceneModel(model, title, sourceRecipe.category, step).method).toBe(method);
  }
});

it("keeps source egg aliases, melted fat and cooked egg history across pan steps", () => {
  const { model, sourceRecipe } = loadModelByTitle("美式炒蛋");
  const cooking = buildKitchenSceneModel(model, sourceRecipe.title, sourceRecipe.category, 2);
  expect(cooking.method).toBe("stirFry");
  expect(cooking.activeIngredients.find(({ kind }) => kind === "egg")?.form).toBe("curds");
  expect(cooking.activeIngredients.find(({ kind }) => kind === "butter")?.form).toBe("melted");
  const stirring = buildKitchenSceneModel(model, sourceRecipe.title, sourceRecipe.category, 3);
  expect(stirring.method).toBe("stirFry");
  expect(stirring.activeIngredients.some(({ kind }) => kind === "egg")).toBe(true);
  expect(model.steps[0]?.actions).toBeUndefined();
});
