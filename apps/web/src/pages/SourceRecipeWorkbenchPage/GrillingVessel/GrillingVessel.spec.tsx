// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { GrillingVessel } from "./GrillingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("uses a handheld flame rather than a closed oven for torching", () => {
  render(
    <GrillingVessel scene={{ ...actionSceneAt("simple-braised-pork", 2), method: "torch" }} />
  );
  expect(screen.getByTestId("cooking-torch")).toBeTruthy();
  expect(screen.queryByTestId("appliance-tray")).toBeNull();
});
