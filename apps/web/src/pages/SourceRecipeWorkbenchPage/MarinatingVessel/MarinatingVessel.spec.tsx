// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { MarinatingVessel } from "./MarinatingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("uses the operation's vessel without unrelated cutting tools", () => {
  render(<MarinatingVessel scene={actionSceneAt("cola-chicken-wings", 2)} />);
  expect(screen.getByRole("img", { name: "在碗中裹匀调料并静置腌制" })).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
