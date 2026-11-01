// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { PastryFillingVessel } from "./PastryFillingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("fills pastry shells without packaged milk in the batter", () => {
  render(<PastryFillingVessel scene={actionSceneAt("baked-egg-tarts", 1)} />);
  expect(screen.getByTestId("pastry-filling").querySelector("img")).toBeNull();
});
