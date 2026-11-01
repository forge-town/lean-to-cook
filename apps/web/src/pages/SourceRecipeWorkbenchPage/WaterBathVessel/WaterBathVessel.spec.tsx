// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { WaterBathVessel } from "./WaterBathVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("uses two vessels and a single transferring egg", () => {
  render(<WaterBathVessel scene={actionSceneAt("perfect-boiled-egg", 2)} />);
  expect(screen.getByTestId("bath-egg").dataset.transfers).toBe("16");
});
