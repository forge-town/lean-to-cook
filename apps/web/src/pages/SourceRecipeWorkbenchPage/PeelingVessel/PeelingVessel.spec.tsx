// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { PeelingVessel } from "./PeelingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("renders the physical action with the selected ingredients", () => {
  render(<PeelingVessel scene={actionSceneAt("tomato-scrambled-eggs", 2)} />);
  expect(screen.getByRole("img", { name: "烫皮、冷却后剥去表皮" })).toBeTruthy();
  expect(screen.getByTestId("peeled-ingredient")).toBeTruthy();
  expect(screen.queryByTestId("cooking-spatula")).toBeNull();
});
