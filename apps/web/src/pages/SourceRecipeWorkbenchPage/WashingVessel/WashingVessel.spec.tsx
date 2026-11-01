// @vitest-environment jsdom
import { cleanup, render, screen, within } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { WashingVessel } from "./WashingVessel";
import { washingSceneFor } from "./washingFixtures";
afterEach(cleanup);
it("rinses every selected vegetable without a board, knife or flame", () => {
  render(<WashingVessel scene={washingSceneFor()} />);
  const basin = screen.getByRole("img", { name: "清水冲洗食材，使用水槽和沥水篮" });
  expect(screen.getByTestId("wash-tap")).toBeTruthy();
  expect(within(basin).getByLabelText("土豆，已洗净")).toBeTruthy();
  expect(within(basin).getByLabelText("茄子，已洗净")).toBeTruthy();
  expect(within(basin).getByLabelText("尖椒，已洗净")).toBeTruthy();
  expect(screen.queryByTestId("cooking-knife")).toBeNull();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
it("uses the same washing vessel for tomatoes and supports an empty visual model", () => {
  const scene = washingSceneFor("tomato-scrambled-eggs");
  const { rerender } = render(<WashingVessel scene={scene} />);
  expect(screen.getByLabelText("西红柿，已洗净")).toBeTruthy();
  rerender(<WashingVessel scene={{ ...scene, activeIngredients: [] }} />);
  expect(screen.getByTestId("wash-basin")).toBeTruthy();
  expect(screen.queryByRole("figure")).toBeNull();
});
