// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { MixingVessel } from "./MixingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("renders the physical action with the selected ingredients", () => {
  render(<MixingVessel scene={actionSceneAt("tomato-scrambled-eggs", 4)} />);
  expect(screen.getByRole("img", { name: "在碗中打散鸡蛋" })).toBeTruthy();
  expect(screen.getByTestId("beaten-egg")).toBeTruthy();
  expect(screen.getByTestId("mixing-utensil")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
