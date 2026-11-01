// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { BoilMixVessel } from "./BoilMixVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("boils noodles separately before combining the meat sauce", () => {
  render(<BoilMixVessel scene={actionSceneAt("zhajiang-noodles", 3)} />);
  expect(screen.getByTestId("simmering-vessel").querySelector('[data-kind="meat"]')).toBeNull();
  expect(screen.getByTestId("mixing-vessel").querySelector('[data-kind="meat"]')).toBeTruthy();
});
