import type { MouseEvent } from "react";
import type { StateCreator } from "zustand";

export interface SourceRecipeWorkbenchPageSlice {
  currentStepIndex: number;
  handleNextButtonClick: () => void;
  handlePreviousButtonClick: () => void;
  handleResetButtonClick: () => void;
  handleStepButtonClick: (event: MouseEvent<HTMLButtonElement>) => void;
}

export interface SourceRecipeWorkbenchPageStoreOptions {
  lastStep: number;
}

export const createSourceRecipeWorkbenchPageSlice =
  (options: SourceRecipeWorkbenchPageStoreOptions): StateCreator<SourceRecipeWorkbenchPageSlice> =>
  (set) => ({
    currentStepIndex: 0,
    handleNextButtonClick: () => {
      set((state) => ({
        currentStepIndex: Math.min(options.lastStep, state.currentStepIndex + 1),
      }));
    },
    handlePreviousButtonClick: () => {
      set((state) => ({ currentStepIndex: Math.max(0, state.currentStepIndex - 1) }));
    },
    handleResetButtonClick: () => {
      set({ currentStepIndex: 0 });
    },
    handleStepButtonClick: (event) => {
      const selectedStep = Number(event.currentTarget.dataset.step);

      if (Number.isInteger(selectedStep) && selectedStep >= 0 && selectedStep <= options.lastStep) {
        set({ currentStepIndex: selectedStep });
      }
    },
  });
