// @vitest-environment jsdom
import type { PointerEvent, KeyboardEvent } from "react";
import { afterEach, expect, it, vi } from "vitest";
import { createAppShellStore } from "./appShellStore";
import { paneResizeDom } from "./paneResizeDom";
afterEach(() => vi.restoreAllMocks());
const dividerElement = (side: string) => {
  const element = document.createElement("div");
  element.dataset.side = side;

  return element;
};
const pointer = (side: string, clientX: number, pointerId = 7) => {
  const event: Partial<PointerEvent<HTMLDivElement>> = {
    button: 0,
    clientX,
    pointerId,
    currentTarget: dividerElement(side),
    preventDefault: vi.fn(),
  };

  return event as PointerEvent<HTMLDivElement>;
};
const key = (side: string, value: string) => {
  const event: Partial<KeyboardEvent<HTMLDivElement>> = {
    key: value,
    currentTarget: dividerElement(side),
    preventDefault: vi.fn(),
  };

  return event as KeyboardEvent<HTMLDivElement>;
};
const mockDom = () => {
  vi.spyOn(paneResizeDom, "capture").mockImplementation(() => {});
  vi.spyOn(paneResizeDom, "release").mockImplementation(() => {});
  vi.spyOn(paneResizeDom, "measure").mockReturnValue({
    left: 100,
    right: 1100,
    width: 1000,
  } as DOMRect);
};
it("captures both boundaries, clamps sizes and ignores another pointer", () => {
  mockDom();
  const store = createAppShellStore();
  store.getState().handleDividerPointerDown(pointer("left", 290));
  store.getState().handleDividerPointerMove(pointer("left", 400, 8));
  expect(store.getState().leftWidth).toBe(19);
  store.getState().handleDividerPointerMove(pointer("left", 400));
  expect(store.getState().leftWidth).toBe(30);
  store.getState().handleDividerPointerMove(pointer("left", 2000));
  expect(store.getState().leftWidth).toBe(35);
  store.getState().handleDividerPointerUp(pointer("left", 2000));
  expect(store.getState().paneDrag).toBeNull();
  store.getState().handleDividerPointerDown(pointer("right", 850));
  store.getState().handleDividerPointerMove(pointer("right", 900));
  expect(store.getState().rightWidth).toBe(20);
  store.getState().handleDividerPointerMove(pointer("right", 2000));
  expect(store.getState().rightWidth).toBe(16);
  store.getState().handleDividerPointerUp(pointer("right", 2000));
  expect(paneResizeDom.release).toHaveBeenCalledTimes(2);
});
it("restores cancelled drags and releases pointer capture on Escape", () => {
  mockDom();
  const store = createAppShellStore();
  store.getState().handleDividerPointerDown(pointer("left", 290));
  store.getState().handleDividerPointerMove(pointer("left", 420));
  store.getState().handleDividerPointerCancel(pointer("left", 420));
  expect(store.getState().leftWidth).toBe(19);
  expect(store.getState().paneDrag).toBeNull();
  store.getState().handleDividerPointerDown(pointer("right", 850));
  store.getState().handleDividerPointerMove(pointer("right", 800));
  store.getState().handleDividerKeyDown(key("right", "Escape"));
  expect(store.getState().rightWidth).toBe(25);
  expect(store.getState().paneDrag).toBeNull();
});
it("ends unexpectedly lost capture without resetting the chosen width", () => {
  mockDom();
  const store = createAppShellStore();
  store.getState().handleDividerPointerDown(pointer("left", 290));
  store.getState().handleDividerPointerMove(pointer("left", 400));
  store.getState().handleDividerLostPointerCapture(pointer("left", 400));
  expect(store.getState().leftWidth).toBe(30);
  expect(store.getState().paneDrag).toBeNull();
});
