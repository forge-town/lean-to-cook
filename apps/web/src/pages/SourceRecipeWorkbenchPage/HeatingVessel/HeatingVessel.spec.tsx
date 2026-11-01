// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { HeatingVessel } from "./HeatingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("keeps the action vessel separate from unrelated operations", () => {
  render(<HeatingVessel scene={actionSceneAt("tomato-scrambled-eggs", 5)} />);
  expect(screen.getByTestId("heating-oil")).toBeTruthy();
  expect(screen.queryByTestId("cooking-food")).toBeNull();
});
