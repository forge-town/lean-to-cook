import { expect, it, vi, afterEach } from "vitest";
import { createAppShellStore } from "./appShellStore";
afterEach(() => vi.unstubAllGlobals());
it("keeps pane choices while entering and leaving focus mode", () => {
  vi.stubGlobal("matchMedia", () => ({ matches: false }));
  const store = createAppShellStore();
  store.getState().handleLeftButtonClick();
  expect(store.getState().left).toBe(false);
  store.getState().handleFocusButtonClick();
  expect(store.getState().focus).toBe(true);
  store.getState().handleFocusButtonClick();
  expect(store.getState().left).toBe(false);
  expect(store.getState().right).toBe(true);
});
it("opens only one mobile panel and closes it through the backdrop", () => {
  vi.stubGlobal("matchMedia", () => ({ matches: true }));
  const store = createAppShellStore();
  store.getState().handleLeftButtonClick();
  expect(store.getState().mobilePanel).toBe("left");
  store.getState().handleRightButtonClick();
  expect(store.getState().mobilePanel).toBe("right");
  store.getState().handleBackdropButtonClick();
  expect(store.getState().mobilePanel).toBe("none");
});
