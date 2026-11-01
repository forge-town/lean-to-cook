// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { PouringVessel } from "./PouringVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("dresses fish without putting its plate on a flame", () => {
  render(<PouringVessel scene={actionSceneAt("steamed-sea-bass", 7)} />);
  expect(screen.getByTestId("pouring-stream")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
