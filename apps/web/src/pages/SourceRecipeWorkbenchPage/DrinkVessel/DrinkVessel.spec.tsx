// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { DrinkVessel } from "./DrinkVessel";
import { lemonSceneAt } from "./drinkVesselFixtures";
afterEach(cleanup);
it("keeps the cup dry on loading, shows a muddler, and fills only when water is added", () => {
  const { rerender } = render(<DrinkVessel scene={lemonSceneAt(1)} />);
  expect(screen.getByRole("img", { name: "食材入杯，使用玻璃杯" })).toBeTruthy();
  expect(screen.getAllByTestId("drink-slice")).toHaveLength(3);
  expect(screen.queryByTestId("drink-liquid")).toBeNull();
  expect(screen.queryByTestId("drink-muddler")).toBeNull();
  rerender(<DrinkVessel scene={lemonSceneAt(2)} />);
  expect(screen.getByTestId("drink-muddler")).toBeTruthy();
  expect(screen.getByTestId("drink-liquid")).toBeTruthy();
  expect(screen.queryByTestId("drink-pour")).toBeNull();
  rerender(<DrinkVessel scene={lemonSceneAt(3)} />);
  expect(screen.getByTestId("drink-spoon")).toBeTruthy();
  expect(screen.getByTestId("drink-pour")).toBeTruthy();
  expect(screen.queryByTestId("drink-muddler")).toBeNull();
  rerender(<DrinkVessel scene={lemonSceneAt(4)} />);
  expect(screen.getByTestId("drink-liquid")).toBeTruthy();
  expect(screen.queryByTestId("drink-spoon")).toBeNull();
});
it("renders a plain filled glass when there is no solid garnish", () => {
  render(<DrinkVessel scene={{ ...lemonSceneAt(3), allIngredients: [] }} />);
  expect(screen.getByTestId("drink-vessel")).toBeTruthy();
  expect(screen.queryByTestId("drink-slice")).toBeNull();
});
