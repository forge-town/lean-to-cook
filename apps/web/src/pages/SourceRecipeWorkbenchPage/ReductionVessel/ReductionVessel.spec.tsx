// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { ReductionVessel } from "./ReductionVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("uses the real cooking operation and keeps its tools distinct", () => {
  render(<ReductionVessel scene={actionSceneAt("cola-chicken-wings", 7)} />);
  expect(screen.getByTestId("reducing-sauce")).toBeTruthy();
  expect(screen.getByRole("img", { name: "翻动食材并将酱汁收浓" })).toBeTruthy();
});
