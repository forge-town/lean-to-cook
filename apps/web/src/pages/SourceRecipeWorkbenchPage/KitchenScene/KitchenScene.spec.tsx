// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { KitchenScene } from "./KitchenScene";
import { potatoSceneModel } from "../sceneFixtures";
import { getRecipeById } from "@repo/schemas";
import { buildSimulatorSceneModel } from "../../SimulatorPage/simulatorModel";
afterEach(cleanup);
it("deep fries without tossing, thickens a sauce and plates only edible main ingredients", () => {
  const recipe = getRecipeById("three-fresh")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={5} />);
  expect(screen.getByTestId("deep-frying-vessel")).toBeTruthy();
  rerender(<KitchenScene {...props} currentStepIndex={10} />);
  expect(screen.getByTestId("thickening-vessel")).toBeTruthy();
  expect(screen.getByTestId("thickening-liquid")).toBeTruthy();
  rerender(<KitchenScene {...props} currentStepIndex={12} />);
  const plate = screen.getByRole("img", { name: "地三鲜成品构成" });
  expect(plate.querySelector('[aria-label^="淀粉"]')).toBeNull();
  expect(plate.querySelector('[data-kind="sauce"]')).toBeNull();
});
it("uses explicit pan-frying, simmering, reducing and preheating actions ahead of wording", () => {
  const cola = getRecipeById("cola-chicken-wings")!;
  const model = buildSimulatorSceneModel(cola);
  const props = { category: cola.category, recipeTitle: cola.title, model };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={3} />);
  expect(screen.getByTestId("pan-frying-vessel")).toBeTruthy();
  rerender(<KitchenScene {...props} currentStepIndex={6} />);
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("simmer");
  rerender(<KitchenScene {...props} currentStepIndex={7} />);
  expect(screen.getByTestId("reduction-vessel")).toBeTruthy();
  const fresh = getRecipeById("three-fresh")!;
  rerender(
    <KitchenScene
      category={fresh.category}
      currentStepIndex={4}
      model={buildSimulatorSceneModel(fresh)}
      recipeTitle={fresh.title}
    />
  );
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("heat");
});
it("keeps cooked contents during seasoning and uses distinct pots and marinating bowls", () => {
  const tomato = getRecipeById("tomato-scrambled-eggs")!;
  const { rerender } = render(
    <KitchenScene
      category={tomato.category}
      currentStepIndex={10}
      model={buildSimulatorSceneModel(tomato)}
      recipeTitle={tomato.title}
    />
  );
  const food = screen.getAllByTestId("cooking-food");
  expect(
    food.some(
      (element) =>
        element.textContent !== undefined && element.querySelector('[aria-label^="西红柿"]')
    )
  ).toBe(true);
  expect(food.some((element) => element.querySelector('[aria-label^="鸡蛋"]'))).toBe(true);
  const cola = getRecipeById("cola-chicken-wings")!;
  rerender(
    <KitchenScene
      category={cola.category}
      currentStepIndex={1}
      model={buildSimulatorSceneModel(cola)}
      recipeTitle={cola.title}
    />
  );
  expect(screen.getByTestId("simmering-vessel")).toBeTruthy();
  rerender(
    <KitchenScene
      category={cola.category}
      currentStepIndex={2}
      model={buildSimulatorSceneModel(cola)}
      recipeTitle={cola.title}
    />
  );
  expect(screen.getByTestId("marinating-vessel")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
it("heats oil without tossing food, cooks egg liquid into curds and rests it without chopping", () => {
  const recipe = getRecipeById("tomato-scrambled-eggs")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={5} />);
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("heat");
  expect(screen.getByTestId("heating-oil")).toBeTruthy();
  expect(screen.queryByTestId("cooking-food")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={6} />);
  expect(screen.getAllByTestId("egg-curds").length).toBeGreaterThan(0);
  rerender(<KitchenScene {...props} currentStepIndex={7} />);
  expect(screen.getByTestId("resting-vessel")).toBeTruthy();
  expect(screen.queryByTestId("cooking-knife")).toBeNull();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
it("renders peeling, actual cutting and egg beating as separate shared actions", () => {
  const recipe = getRecipeById("tomato-scrambled-eggs")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={2} />);
  expect(screen.getByTestId("peeling-vessel")).toBeTruthy();
  expect(screen.queryByTestId("mixing-vessel")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={3} />);
  expect(screen.getByTestId("cutting-vessel")).toBeTruthy();
  expect(screen.getAllByTestId("ingredient-pieces").length).toBeGreaterThan(0);
  rerender(<KitchenScene {...props} currentStepIndex={4} />);
  expect(screen.getByTestId("mixing-vessel")).toBeTruthy();
  expect(screen.getByTestId("beaten-egg")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
it.each(["three-fresh", "tomato-scrambled-eggs"])(
  "uses the shared wash action for %s, then switches to the next action",
  (id) => {
    const recipe = getRecipeById(id)!;
    const model = buildSimulatorSceneModel(recipe);
    const props = { category: recipe.category, recipeTitle: recipe.title, model };
    const { rerender } = render(<KitchenScene {...props} currentStepIndex={1} />);
    expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("wash");
    expect(screen.getByTestId("washing-vessel")).toBeTruthy();
    expect(screen.getByTestId("wash-water")).toBeTruthy();
    expect(screen.queryByTestId("cooking-knife")).toBeNull();
    expect(screen.queryByTestId("cooking-heat")).toBeNull();
    expect(screen.queryByTestId("cooking-vessel")).toBeNull();
    if (id === "three-fresh") {
      expect(screen.getAllByLabelText("尖椒，已洗净")).toHaveLength(2);
    }
    rerender(<KitchenScene {...props} currentStepIndex={id === "three-fresh" ? 2 : 3} />);
    expect(screen.queryByTestId("washing-vessel")).toBeNull();
    expect(screen.getByTestId("cooking-knife")).toBeTruthy();
  }
);
it("changes vessels and shows finished plating using the recipe step model", () => {
  const props = {
    category: "vegetable",
    currentStepIndex: 0,
    model: potatoSceneModel,
    recipeTitle: "拔丝土豆",
  } as const;
  const { rerender } = render(<KitchenScene {...props} />);
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("prep");
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={2} />);
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("deepFry");
  expect(screen.getByTestId("cooking-heat")).toBeTruthy();
  rerender(<KitchenScene {...props} currentStepIndex={potatoSceneModel.steps.length} />);
  expect(screen.getByRole("img", { name: "拔丝土豆成品构成" })).toBeTruthy();
  expect(screen.queryByTestId("cooking-vessel")).toBeNull();
});

it("scores shrimp without chopping and melts butter in hot sauce", () => {
  const recipe = getRecipeById("butter-pan-fried-shrimp")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={1} />);
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("score");
  expect(screen.getByTestId("scoring-line")).toBeTruthy();
  expect(screen.queryByTestId("ingredient-pieces")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={5} />);
  expect(screen.getAllByTestId("melted-fat").length).toBeGreaterThan(0);
  rerender(<KitchenScene {...props} currentStepIndex={6} />);
  expect(screen.getAllByTestId("melted-fat").length).toBeGreaterThan(0);
});

it("keeps soup on the stove for seasoning and serves broth at the final plate action", () => {
  const recipe = getRecipeById("corn-rib-soup")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={7} />);
  expect(screen.getByTestId("simmering-vessel")).toBeTruthy();
  rerender(<KitchenScene {...props} currentStepIndex={8} />);
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("plate");
  expect(screen.queryByTestId("mixing-vessel")).toBeNull();
});

it("racks fish, preheats an empty steamer, then steams above water", () => {
  const recipe = getRecipeById("steamed-sea-bass")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={3} />);
  expect(screen.getByTestId("steamer-rack")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={4} />);
  expect(screen.getByTestId("steamer-water")).toBeTruthy();
  expect(screen.queryByTestId("steamer-food")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={5} />);
  expect(screen.getByTestId("steamer-food")).toBeTruthy();
  expect(screen.getByTestId("steamer-rack")).toBeTruthy();
});

it("pours sauce and hot oil over plated fish, and caramelizes sugar", () => {
  const fish = getRecipeById("steamed-sea-bass")!;
  const props = {
    category: fish.category,
    recipeTitle: fish.title,
    model: buildSimulatorSceneModel(fish),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={7} />);
  expect(screen.getByTestId("pouring-stream")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={9} />);
  expect(screen.getByTestId("pouring-stream")).toBeTruthy();
  const pork = getRecipeById("simple-braised-pork")!;
  rerender(
    <KitchenScene
      category={pork.category}
      currentStepIndex={2}
      model={buildSimulatorSceneModel(pork)}
      recipeTitle={pork.title}
    />
  );
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("caramelize");
});

it("boils only seaweed before adding egg ribbons to the soup", () => {
  const recipe = getRecipeById("seaweed-egg-drop-soup")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={2} />);
  const pot = screen.getByTestId("simmering-vessel");
  expect(pot.querySelector('[data-kind="leaf"]')).toBeTruthy();
  expect(pot.querySelector('[data-kind="egg"]')).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={3} />);
  expect(screen.getByTestId("simmering-vessel")).toBeTruthy();
  expect(screen.getAllByTestId("egg-ribbons").length).toBeGreaterThan(0);
});

it("cracks one sunny egg and heats it on a microwave plate", () => {
  const recipe = getRecipeById("microwave-sunny-side-egg")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={1} />);
  expect(screen.getByTestId("egg-cracking")).toBeTruthy();
  expect(screen.queryByTestId("beaten-egg")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={2} />);
  const appliance = screen.getByTestId("appliance-vessel");
  expect(appliance.querySelectorAll('[data-testid="sunny-egg"]')).toHaveLength(1);
  rerender(<KitchenScene {...props} currentStepIndex={4} />);
  expect(screen.getAllByTestId("sunny-egg").length).toBeGreaterThan(0);
});

it("prepares two baths, transfers one egg, and cools it in ice water", () => {
  const recipe = getRecipeById("perfect-boiled-egg")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={1} />);
  expect(screen.getByTestId("water-baths")).toBeTruthy();
  expect(screen.queryByTestId("bath-egg")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={2} />);
  expect(screen.getByTestId("bath-egg").dataset.transfers).toBe("16");
  rerender(<KitchenScene {...props} currentStepIndex={3} />);
  expect(screen.getByTestId("ice-bath")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});

it("uses loose rice and minced meat instead of packaged meal icons in cooking vessels", () => {
  const rice = getRecipeById("egg-fried-rice")!;
  const { rerender } = render(
    <KitchenScene
      category={rice.category}
      currentStepIndex={2}
      model={buildSimulatorSceneModel(rice)}
      recipeTitle={rice.title}
    />
  );
  expect(screen.getAllByTestId("loose-rice").length).toBeGreaterThan(0);
  const noodles = getRecipeById("zhajiang-noodles")!;
  rerender(
    <KitchenScene
      category={noodles.category}
      currentStepIndex={2}
      model={buildSimulatorSceneModel(noodles)}
      recipeTitle={noodles.title}
    />
  );
  const pan = screen.getByTestId("reduction-vessel");
  expect(pan.querySelector('[data-kind="noodle"]')).toBeNull();
  expect(pan.querySelector('[data-testid="minced-meat"]')).toBeTruthy();
});

it("shows boiling then mixing noodles, and dumplings in a cold then boiling pot", () => {
  const noodles = getRecipeById("zhajiang-noodles")!;
  const { rerender } = render(
    <KitchenScene
      category={noodles.category}
      currentStepIndex={3}
      model={buildSimulatorSceneModel(noodles)}
      recipeTitle={noodles.title}
    />
  );
  expect(screen.getByTestId("boil-mix-sequence")).toBeTruthy();
  const dumplings = getRecipeById("frozen-dumplings")!;
  const props = {
    category: dumplings.category,
    recipeTitle: dumplings.title,
    model: buildSimulatorSceneModel(dumplings),
  };
  rerender(<KitchenScene {...props} currentStepIndex={1} />);
  expect(
    screen.getByTestId("simmering-vessel").querySelector('[data-testid="dumpling-food"]')
  ).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={2} />);
  expect(screen.getByTestId("cooking-heat")).toBeTruthy();
});

it("stirs and tops up boiling dumplings, then air fries in a dry basket with a flip", () => {
  const dumplings = getRecipeById("frozen-dumplings")!;
  const { rerender } = render(
    <KitchenScene
      category={dumplings.category}
      currentStepIndex={3}
      model={buildSimulatorSceneModel(dumplings)}
      recipeTitle={dumplings.title}
    />
  );
  expect(screen.getByTestId("pot-stirrer")).toBeTruthy();
  expect(screen.getByTestId("pot-water-pour")).toBeTruthy();
  const wings = getRecipeById("air-fryer-chicken-wings")!;
  const props = {
    category: wings.category,
    recipeTitle: wings.title,
    model: buildSimulatorSceneModel(wings),
  };
  rerender(<KitchenScene {...props} currentStepIndex={2} />);
  expect(screen.getByTestId("air-fryer-basket")).toBeTruthy();
  expect(screen.queryByTestId("frying-oil")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={3} />);
  expect(screen.getByTestId("appliance-food").dataset.flip).toBe("true");
});

it("stirs reducing sauce and fills pastries before preheating an empty oven", () => {
  const sauce = getRecipeById("sweet-sour-sauce")!;
  const { rerender } = render(
    <KitchenScene
      category={sauce.category}
      currentStepIndex={3}
      model={buildSimulatorSceneModel(sauce)}
      recipeTitle={sauce.title}
    />
  );
  expect(screen.getByTestId("reduction-stirrer")).toBeTruthy();
  const tarts = getRecipeById("baked-egg-tarts")!;
  const props = {
    category: tarts.category,
    recipeTitle: tarts.title,
    model: buildSimulatorSceneModel(tarts),
  };
  rerender(<KitchenScene {...props} currentStepIndex={1} />);
  expect(screen.getByTestId("pastry-filling")).toBeTruthy();
  rerender(<KitchenScene {...props} currentStepIndex={2} />);
  expect(screen.queryByTestId("appliance-food")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={3} />);
  expect(
    screen.getByTestId("appliance-food").querySelector('[data-testid="custard-tart"]')
  ).toBeTruthy();
});

it("gently warms coffee dairy without boiling and sets it in a chilled mold", () => {
  const recipe = getRecipeById("coffee-coconut-jelly")!;
  const props = {
    category: recipe.category,
    recipeTitle: recipe.title,
    model: buildSimulatorSceneModel(recipe),
  };
  const { rerender } = render(<KitchenScene {...props} currentStepIndex={2} />);
  expect(screen.getByTestId("kitchen-scene").dataset.method).toBe("warmMix");
  expect(screen.queryByTestId("pot-bubbles")).toBeNull();
  expect(screen.getByTestId("simmering-vessel").querySelector("img")).toBeNull();
  rerender(<KitchenScene {...props} currentStepIndex={3} />);
  expect(screen.getByTestId("chilling-mold")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});

it("keeps small-fire scrambling gentle and removes heat after turning it off", () => {
  const recipe = getRecipeById("tomato-scrambled-eggs")!;
  const model = buildSimulatorSceneModel(recipe);
  const steps = model.steps.map((step, index) =>
    index === 5 ? { ...step, instruction: "小火翻动蛋液", heatOn: false } : step
  );
  render(
    <KitchenScene
      category={recipe.category}
      currentStepIndex={6}
      model={{ ...model, steps }}
      recipeTitle={recipe.title}
    />
  );
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  expect(document.querySelector('[data-testid="cooking-food"]')?.className).not.toContain(
    "animate-cooking-toss"
  );
});
