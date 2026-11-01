// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { BlendingVessel } from "./BlendingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
afterEach(cleanup);
it("keeps the blade still when loading and runs it only after activation", () => {
  const scene = { ...actionSceneAt("lemon-water", 1), method: "blend" as const };
  const { rerender } = render(
    <BlendingVessel scene={{ ...scene, instruction: "一起倒入榨汁机搅拌杯" }} />
  );
  expect(screen.getByTestId("blending-vessel").dataset.running).toBe("false");
  rerender(<BlendingVessel scene={{ ...scene, instruction: "启动搅拌机" }} />);
  expect(screen.getByTestId("blender-liquid")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
});
