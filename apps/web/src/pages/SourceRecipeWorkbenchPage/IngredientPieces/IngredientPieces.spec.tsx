// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { IngredientPieces } from "./IngredientPieces";
afterEach(cleanup);
it("represents cut food as pieces without the whole ingredient asset", () => {
  render(
    <IngredientPieces
      ingredient={{ kind: "tomato", name: "西红柿", state: "prepped", form: "pieces" }}
    />
  );
  expect(screen.getByTestId("ingredient-pieces").children).toHaveLength(6);
  expect(document.querySelector("img")).toBeNull();
});

it.each(["corn", "carrot", "meat"] as const)("preserves the identity of cut %s", (kind) => {
  render(<IngredientPieces ingredient={{ kind, name: kind, state: "prepped", form: "pieces" }} />);
  expect(screen.getByTestId("ingredient-pieces").dataset.kind).toBe(kind);
});

it("keeps sliced lemon as citrus rounds", () => {
  render(
    <IngredientPieces
      ingredient={{ kind: "fruit", name: "柠檬", state: "prepped", form: "pieces" }}
    />
  );
  expect(screen.getByTestId("citrus-rounds")).toBeTruthy();
});
