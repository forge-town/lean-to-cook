import type { MouseEvent } from "react";
import type { StateCreator } from "zustand";

import { theoryLibraryPageStepMachine } from "./theoryLibraryPageStepMachine";

export interface TheoryLibraryPageSlice {
  currentStage: number;
  handleNextButtonClick: () => void;
  handlePreviousButtonClick: () => void;
  handleStageButtonClick: (event: MouseEvent<HTMLButtonElement>) => void;
  handleTheoryButtonClick: (event: MouseEvent<HTMLButtonElement>) => void;
  selectedTheoryId: string;
}

export interface TheoryLibraryPageStoreOptions {
  initialTheoryId: string;
  lastStageByTheoryId: Readonly<Record<string, number>>;
}

export const createTheoryLibraryPageSlice =
  (options: TheoryLibraryPageStoreOptions): StateCreator<TheoryLibraryPageSlice> =>
  (set) => ({
    currentStage: 0,
    handleNextButtonClick: () => {
      set((state) => ({
        currentStage: theoryLibraryPageStepMachine.next(
          state.currentStage,
          options.lastStageByTheoryId[state.selectedTheoryId] ?? 0
        ),
      }));
    },
    handlePreviousButtonClick: () => {
      set((state) => ({
        currentStage: theoryLibraryPageStepMachine.previous(state.currentStage),
      }));
    },
    handleStageButtonClick: (event) => {
      const theoryId = event.currentTarget.dataset.theoryId;
      const candidate = Number(event.currentTarget.dataset.stage);

      if (!theoryId) return;
      const selectedStage = theoryLibraryPageStepMachine.select(
        candidate,
        options.lastStageByTheoryId[theoryId] ?? 0
      );

      if (selectedStage !== undefined) {
        set({ currentStage: selectedStage });
      }
    },
    handleTheoryButtonClick: (event) => {
      const theoryId = event.currentTarget.dataset.theoryId;

      if (theoryId && theoryId in options.lastStageByTheoryId) {
        set({ currentStage: 0, selectedTheoryId: theoryId });
      }
    },
    selectedTheoryId: options.initialTheoryId,
  });
