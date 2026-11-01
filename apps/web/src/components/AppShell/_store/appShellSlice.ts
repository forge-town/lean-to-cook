import type { MouseEvent } from "react";
import type { StateCreator } from "zustand";
export interface AppShellSlice {
  left: boolean;
  right: boolean;
  focus: boolean;
  mobilePanel: "left" | "right" | "none";
  handleLeftButtonClick: () => void;
  handleRightButtonClick: () => void;
  handleFocusButtonClick: () => void;
  handleBackdropButtonClick: () => void;
  handleShellClickCapture: (event: MouseEvent<HTMLDivElement>) => void;
}
export const createAppShellSlice: StateCreator<AppShellSlice> = (set) => ({
  left: true,
  right: true,
  focus: false,
  mobilePanel: "none",
  handleLeftButtonClick: () =>
    set((state) =>
      matchMedia("(max-width: 1023px)").matches
        ? { mobilePanel: state.mobilePanel === "left" ? "none" : "left" }
        : { left: !state.left }
    ),
  handleRightButtonClick: () =>
    set((state) =>
      matchMedia("(max-width: 1023px)").matches
        ? { mobilePanel: state.mobilePanel === "right" ? "none" : "right" }
        : { right: !state.right }
    ),
  handleFocusButtonClick: () => set((state) => ({ focus: !state.focus, mobilePanel: "none" })),
  handleBackdropButtonClick: () => set({ mobilePanel: "none" }),
  handleShellClickCapture: (event) => {
    if (event.target instanceof Element && event.target.closest("a[href]"))
      set({ mobilePanel: "none" });
  },
});
