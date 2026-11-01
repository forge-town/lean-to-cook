// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { SimmeringVessel } from "./SimmeringVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("uses the operation's vessel without unrelated cutting tools", () => {
  render(<SimmeringVessel scene={actionSceneAt("cola-chicken-wings", 1)} />);
  expect(screen.getByTestId("cooking-liquid")).toBeTruthy();
  expect(screen.getByTestId("pot-bubbles")).toBeTruthy();
  expect(screen.queryByTestId("cooking-knife")).toBeNull();
});
