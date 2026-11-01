// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { CrackingVessel } from "./CrackingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("preserves one cracked egg without a stove flame", () => {
  render(<CrackingVessel scene={actionSceneAt("microwave-sunny-side-egg", 1)} />);
  expect(screen.getAllByTestId("sunny-egg")).toHaveLength(1);
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
