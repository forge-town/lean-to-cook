// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { DeepFryingVessel } from "./DeepFryingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("renders the liquid process without unrelated utensils", () => {
  render(<DeepFryingVessel scene={actionSceneAt("three-fresh", 5)} />);
  expect(screen.getByTestId("frying-bubbles")).toBeTruthy();
  expect(screen.queryByTestId("cooking-spatula")).toBeNull();
});
