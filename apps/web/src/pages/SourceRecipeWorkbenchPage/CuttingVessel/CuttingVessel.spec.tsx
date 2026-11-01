// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { CuttingVessel } from "./CuttingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("renders the physical action with the selected ingredients", () => {
  render(<CuttingVessel scene={actionSceneAt("tomato-scrambled-eggs", 3)} />);
  expect(screen.getAllByTestId("ingredient-pieces").length).toBeGreaterThan(0);
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
