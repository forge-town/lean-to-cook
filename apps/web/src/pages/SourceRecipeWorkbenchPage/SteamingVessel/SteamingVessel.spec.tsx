// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { SteamingVessel } from "./SteamingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("keeps food above the water on a rack", () => {
  render(<SteamingVessel scene={actionSceneAt("steamed-sea-bass", 5)} />);
  expect(screen.getByTestId("steamer-rack")).toBeTruthy();
  expect(screen.getByTestId("steamer-food").parentElement).not.toBe(
    screen.getByTestId("steamer-water").parentElement
  );
});
