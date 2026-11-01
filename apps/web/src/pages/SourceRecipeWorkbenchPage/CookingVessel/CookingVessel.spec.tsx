// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { CookingVessel } from "./CookingVessel";
import { potatoSceneAt } from "../sceneFixtures";
afterEach(cleanup);
it("switches cutting, frying and syrup effects instead of reusing a generic animation", () => {
  const { rerender } = render(
    <CookingVessel
      scene={{
        ...potatoSceneAt(1),
        method: "prep",
        methodLabel: "切配处理",
        vesselLabel: "木质砧板",
      }}
    />
  );
  expect(screen.getByTestId("cooking-knife")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  rerender(<CookingVessel scene={potatoSceneAt(2)} />);
  expect(screen.queryByTestId("cooking-knife")).toBeNull();
  expect(screen.getByTestId("cooking-liquid")).toBeTruthy();
  expect(screen.getByTestId("cooking-heat")).toBeTruthy();
  rerender(<CookingVessel scene={potatoSceneAt(4)} />);
  expect(screen.getByTestId("cooking-syrup")).toBeTruthy();
  expect(screen.getByTestId("cooking-spatula")).toBeTruthy();
});
