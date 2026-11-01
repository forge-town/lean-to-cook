// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { IngredientContext } from "../../../integrations/catalog/ingredientContext";
import type { PublicIngredient } from "@repo/schemas/catalog";
import { IngredientIllustration } from "./IngredientIllustration";
afterEach(cleanup);
it("renders chili powder and sesame as particles instead of whole pepper or salt icons", () => {
  const { rerender } = render(
    <IngredientIllustration ingredient={{ kind: "chili", name: "干辣椒面", state: "raw" }} />
  );
  expect(screen.getByTestId("ingredient-powder")).toBeTruthy();
  expect(screen.getByLabelText("干辣椒面，原始").querySelector("img")).toBeNull();
  rerender(
    <IngredientIllustration ingredient={{ kind: "seasoning", name: "熟白芝麻", state: "raw" }} />
  );
  expect(screen.getByTestId("ingredient-sesame")).toBeTruthy();
});
it("preserves accessible ingredient state while compact mode hides duplicate captions", () => {
  const ingredient = { kind: "potato", name: "土豆", state: "raw" } as const;
  const { rerender } = render(<IngredientIllustration ingredient={ingredient} />);
  expect(screen.getByLabelText("土豆，原始")).toBeTruthy();
  expect(screen.getByText("土豆")).toBeTruthy();
  rerender(<IngredientIllustration compact ingredient={{ ...ingredient, state: "cooking" }} />);
  expect(screen.getByLabelText("土豆，受热中")).toBeTruthy();
  expect(screen.queryByText("土豆")).toBeNull();
});

it("uses the configured ingredient image and display name from the catalog", () => {
  const record: PublicIngredient = {
    id: "e90db989-55cf-4b13-909f-fffc1d79a561",
    name: "可乐饮料",
    sourceName: "可乐",
    description: "",
    categoryId: null,
    imageKey: "jar",
    aliases: [],
    updatedAt: "2026-10-31T00:00:00.000Z",
  };
  render(
    <IngredientContext.Provider value={[record]}>
      <IngredientIllustration ingredient={{ kind: "liquid", name: "可乐", state: "raw" }} />
    </IngredientContext.Provider>
  );
  const visual = screen.getByLabelText("可乐饮料，原始");
  expect(visual.getAttribute("data-icon")).toBe("jar");
  expect(visual.querySelector("img")?.getAttribute("src")).toContain("jar.svg");
});

it("describes prepared liquids without claiming they were chopped", () => {
  render(
    <IngredientIllustration ingredient={{ kind: "liquid", name: "饮用水", state: "prepped" }} />
  );
  expect(screen.getByLabelText("饮用水，已备好")).toBeTruthy();
});

it("renders a tea packet rather than a teacup inside a brewing cup", () => {
  render(
    <IngredientIllustration compact ingredient={{ kind: "tea", name: "茶包", state: "prepped" }} />
  );
  expect(screen.getByTestId("tea-packet")).toBeTruthy();
  expect(document.querySelector("img")).toBeNull();
});
