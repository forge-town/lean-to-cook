import type { StateCreator } from "zustand";
export interface HeaderToolbarSlice {
  headerToolbarTarget: HTMLDivElement | null;
  headerToolbarActive: boolean;
  headerTitleTarget: HTMLDivElement | null;
  handleHeaderTitleTargetRef: (target: HTMLDivElement | null) => void;
  handleHeaderToolbarTargetRef: (target: HTMLDivElement | null) => void;
  handleHeaderToolbarContentRef: (content: HTMLDivElement | null) => void;
}
export const createHeaderToolbarSlice: StateCreator<HeaderToolbarSlice> = (set) => ({
  headerToolbarTarget: null,
  headerToolbarActive: false,
  headerTitleTarget: null,
  handleHeaderTitleTargetRef: (target) =>
    set((state) => (state.headerTitleTarget === target ? state : { headerTitleTarget: target })),
  handleHeaderToolbarTargetRef: (target) =>
    set((state) =>
      state.headerToolbarTarget === target ? state : { headerToolbarTarget: target }
    ),
  handleHeaderToolbarContentRef: (content) => set({ headerToolbarActive: content !== null }),
});
