// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { ThickeningVessel } from "./ThickeningVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("renders the liquid process without unrelated utensils", () => {
  render(<ThickeningVessel scene={actionSceneAt("three-fresh", 10)} />);
  expect(screen.getByTestId("thickening-liquid")).toBeTruthy();
  expect(screen.getByRole("img", { name: "将料汁倒入锅中并搅拌勾芡" })).toBeTruthy();
});
