// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { ChillingVessel } from "./ChillingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("sets a mixture in one mold without cooking flame", () => {
  render(<ChillingVessel scene={actionSceneAt("coffee-coconut-jelly", 3)} />);
  expect(screen.getByTestId("chilling-mold")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
