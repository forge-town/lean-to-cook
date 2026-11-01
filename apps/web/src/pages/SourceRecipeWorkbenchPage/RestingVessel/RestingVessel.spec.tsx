// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { RestingVessel } from "./RestingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("keeps the action vessel separate from unrelated operations", () => {
  render(<RestingVessel scene={actionSceneAt("tomato-scrambled-eggs", 7)} />);
  expect(screen.getByTestId("egg-curds")).toBeTruthy();
  expect(screen.queryByTestId("cooking-knife")).toBeNull();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
