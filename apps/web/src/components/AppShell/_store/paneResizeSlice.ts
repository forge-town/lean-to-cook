import type { KeyboardEvent, MouseEvent, PointerEvent } from "react";
import type { StateCreator } from "zustand";
import { paneResizeDom } from "./paneResizeDom";

export const paneResizeLimits = {
  left: { initial: 19, min: 12, max: 35 },
  right: { initial: 25, min: 16, max: 35 },
} as const;
type Pane = keyof typeof paneResizeLimits;
interface PaneDrag {
  side: Pane;
  pointerId: number;
  original: number;
}
export interface PaneResizeSlice {
  leftWidth: number;
  rightWidth: number;
  paneDrag: PaneDrag | null;
  handleDividerPointerDown: (event: PointerEvent<HTMLDivElement>) => void;
  handleDividerPointerMove: (event: PointerEvent<HTMLDivElement>) => void;
  handleDividerPointerUp: (event: PointerEvent<HTMLDivElement>) => void;
  handleDividerPointerCancel: (event: PointerEvent<HTMLDivElement>) => void;
  handleDividerLostPointerCapture: (event: PointerEvent<HTMLDivElement>) => void;
  handleDividerKeyDown: (event: KeyboardEvent<HTMLDivElement>) => void;
  handleDividerDoubleClick: (event: MouseEvent<HTMLDivElement>) => void;
}
const getSide = (value?: string): Pane | null =>
  value === "left" || value === "right" ? value : null;
const widthUpdate = (side: Pane, value: number) => {
  const bounded = Math.max(paneResizeLimits[side].min, Math.min(paneResizeLimits[side].max, value));

  return side === "left" ? { leftWidth: bounded } : { rightWidth: bounded };
};

export const createPaneResizeSlice: StateCreator<PaneResizeSlice> = (set, get) => ({
  leftWidth: paneResizeLimits.left.initial,
  rightWidth: paneResizeLimits.right.initial,
  paneDrag: null,
  handleDividerPointerDown: (event) => {
    const side = getSide(event.currentTarget.dataset.side);
    if (!side || event.button !== 0 || get().paneDrag) return;
    event.preventDefault();
    paneResizeDom.capture(event.currentTarget, event.pointerId);
    const state = get();
    set({
      paneDrag: {
        side,
        pointerId: event.pointerId,
        original: side === "left" ? state.leftWidth : state.rightWidth,
      },
    });
  },
  handleDividerPointerMove: (event) => {
    const drag = get().paneDrag;
    if (!drag || drag.pointerId !== event.pointerId) return;
    const bounds = paneResizeDom.measure(event.currentTarget);
    if (!bounds || bounds.width <= 0) return;
    const width = drag.side === "left" ? event.clientX - bounds.left : bounds.right - event.clientX;
    set(widthUpdate(drag.side, (width / bounds.width) * 100));
  },
  handleDividerPointerUp: (event) => {
    if (get().paneDrag?.pointerId !== event.pointerId) return;
    set({ paneDrag: null });
    paneResizeDom.release(event.currentTarget, event.pointerId);
  },
  handleDividerPointerCancel: (event) => {
    const drag = get().paneDrag;
    if (!drag || drag.pointerId !== event.pointerId) return;
    set({ ...widthUpdate(drag.side, drag.original), paneDrag: null });
    paneResizeDom.release(event.currentTarget, event.pointerId);
  },
  handleDividerLostPointerCapture: (event) => {
    if (get().paneDrag?.pointerId === event.pointerId) set({ paneDrag: null });
  },
  handleDividerDoubleClick: (event) => {
    const side = getSide(event.currentTarget.dataset.side);
    if (side) set(widthUpdate(side, paneResizeLimits[side].initial));
  },
  handleDividerKeyDown: (event) => {
    const side = getSide(event.currentTarget.dataset.side);
    if (!side) return;
    const state = get();
    if (event.key === "Escape" && state.paneDrag) {
      event.preventDefault();
      set({ ...widthUpdate(state.paneDrag.side, state.paneDrag.original), paneDrag: null });
      paneResizeDom.release(event.currentTarget, state.paneDrag.pointerId);

      return;
    }
    const value = side === "left" ? state.leftWidth : state.rightWidth;
    const direction = side === "left" ? 1 : -1;
    const amount = event.shiftKey ? 5 : 1;
    const next =
      event.key === "ArrowRight"
        ? value + direction * amount
        : event.key === "ArrowLeft"
          ? value - direction * amount
          : event.key === "Home"
            ? paneResizeLimits[side].min
            : event.key === "End"
              ? paneResizeLimits[side].max
              : event.key === "Enter"
                ? paneResizeLimits[side].initial
                : null;
    if (next === null) return;
    event.preventDefault();
    set(widthUpdate(side, next));
  },
});
