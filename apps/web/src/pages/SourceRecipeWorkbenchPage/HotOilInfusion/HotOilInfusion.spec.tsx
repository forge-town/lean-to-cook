// @vitest-environment jsdom
import { cleanup, render, screen } from "@testing-library/react";
import { afterEach, expect, it } from "vitest";
import { HotOilInfusion } from "./HotOilInfusion";
import { oilSceneAt } from "./hotOilFixtures";
afterEach(cleanup);
it("keeps the bowl off the stove, pours from a separate pan and finishes as red oil", () => {
  const { rerender } = render(<HotOilInfusion scene={oilSceneAt(1)} />);
  expect(screen.getByRole("img", { name: "拌匀辣椒面，使用耐热碗" })).toBeTruthy();
  expect(screen.queryByTestId("oil-pan")).toBeNull();
  rerender(<HotOilInfusion scene={oilSceneAt(2)} />);
  expect(screen.getByTestId("oil-pan")).toBeTruthy();
  expect(screen.getByTestId("oil-cooling").textContent).toContain("关火");
  expect(screen.queryByTestId("oil-stream")).toBeNull();
  rerender(<HotOilInfusion scene={oilSceneAt(3)} />);
  expect(screen.getByTestId("oil-stream")).toBeTruthy();
  expect(screen.queryByTestId("oil-heating-flame")).toBeNull();
  expect(screen.getByTestId("oil-bubbles")).toBeTruthy();
  rerender(<HotOilInfusion scene={oilSceneAt(4)} />);
  expect(screen.getByTestId("oil-finished")).toBeTruthy();
  expect(screen.getByTestId("oil-sugar")).toBeTruthy();
  expect(screen.queryByTestId("oil-pan")).toBeNull();
  expect(screen.queryByTestId("oil-bubbles")).toBeNull();
});
