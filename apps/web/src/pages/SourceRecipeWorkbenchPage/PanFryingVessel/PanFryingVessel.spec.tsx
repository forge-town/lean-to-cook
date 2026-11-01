// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { PanFryingVessel } from "./PanFryingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("uses the real cooking operation and keeps its tools distinct", () => {
  render(<PanFryingVessel scene={actionSceneAt("cola-chicken-wings", 3)} />);
  expect(screen.getByRole("img", { name: "在平底锅中煎制并翻面" })).toBeTruthy();
  expect(screen.getByTestId("cooking-heat")).toBeTruthy();
  expect(screen.queryByTestId("cooking-knife")).toBeNull();
});
