import type { MouseEvent } from "react";
import type { StateCreator } from "zustand";

import { recipeProofPageStepMachine } from "./recipeProofPageStepMachine";

export interface RecipeProofPageSlice {
  currentStep: number;
  handleNextButtonClick: () => void;
  handlePreviousButtonClick: () => void;
  handleResetButtonClick: () => void;
  handleStepButtonClick: (event: MouseEvent<HTMLButtonElement>) => void;
  handleTheoremButtonClick: (event: MouseEvent<HTMLButtonElement>) => void;
  selectedTheoremName: string;
}

export interface RecipeProofPageStoreOptions {
  initialTheoremName: string;
  lastStep: number;
}

export const createRecipeProofPageSlice =
  (options: RecipeProofPageStoreOptions): StateCreator<RecipeProofPageSlice> =>
  (set) => ({
    currentStep: 0,
    handleNextButtonClick: () => {
      set((state) => ({
        currentStep: recipeProofPageStepMachine.next(state.currentStep, options.lastStep),
      }));
    },
    handlePreviousButtonClick: () => {
      set((state) => ({
        currentStep: recipeProofPageStepMachine.previous(state.currentStep, options.lastStep),
      }));
    },
    handleResetButtonClick: () => {
      set({ currentStep: 0 });
    },
    handleStepButtonClick: (event) => {
      const selectedStep = recipeProofPageStepMachine.select(
        Number(event.currentTarget.dataset.step),
        options.lastStep
      );

      if (selectedStep !== undefined) {
        set({ currentStep: selectedStep });
      }
    },
    handleTheoremButtonClick: (event) => {
      const theoremName = event.currentTarget.dataset.theorem;

      if (theoremName) {
        set({ selectedTheoremName: theoremName });
      }
    },
    selectedTheoremName: options.initialTheoremName,
  });
