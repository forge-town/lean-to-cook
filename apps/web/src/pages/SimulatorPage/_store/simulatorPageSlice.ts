import type { Recipe } from "@repo/schemas";
import type { ChangeEvent, MouseEvent } from "react";
import type { StateCreator } from "zustand";

import { router } from "@/router";

import {
  createSimulatorSnapshot,
  executeSimulatorStep,
  rewindSimulatorSnapshot,
  type SimulatorBlockedTransition,
  type SimulatorSnapshot,
} from "../simulatorStepMachine";

export interface SimulatorPageSlice {
  blockedTransition: SimulatorBlockedTransition | null;
  currentSnapshot: SimulatorSnapshot;
  history: SimulatorSnapshot[];
  handleActionButtonClick: (event: MouseEvent<HTMLButtonElement>) => void;
  handleNextButtonClick: () => void;
  handlePreviousButtonClick: () => void;
  handleRecipeSelectChange: (event: ChangeEvent<HTMLSelectElement>) => void;
  handleRecipeValueChange: (value: string | null) => void;
  handleResetButtonClick: () => void;
}

export interface SimulatorPageStoreOptions {
  recipe: Recipe;
}

export const createSimulatorPageSlice = (
  options: SimulatorPageStoreOptions
): StateCreator<SimulatorPageSlice> => {
  const initialSnapshot = createSimulatorSnapshot(options.recipe);

  const selectOrExecute = (
    state: SimulatorPageSlice,
    targetStepIndex: number
  ): Partial<SimulatorPageSlice> => {
    const visitedSnapshot = state.history.find(
      (snapshot) => snapshot.stepIndex === targetStepIndex
    );
    if (visitedSnapshot) return { blockedTransition: null, currentSnapshot: visitedSnapshot };

    const frontier = state.history.at(-1) ?? initialSnapshot;
    const transition = executeSimulatorStep(options.recipe, frontier, targetStepIndex);
    if (transition.kind === "blocked") return { blockedTransition: transition };

    return {
      blockedTransition: null,
      currentSnapshot: transition.snapshot,
      history: [...state.history, transition.snapshot],
    };
  };

  return (set) => ({
    blockedTransition: null,
    currentSnapshot: initialSnapshot,
    handleActionButtonClick: (event) => {
      const targetStepIndex = Number(event.currentTarget.dataset.step);

      if (Number.isInteger(targetStepIndex))
        set((state) => selectOrExecute(state, targetStepIndex));
    },
    handleNextButtonClick: () => {
      set((state) => selectOrExecute(state, state.currentSnapshot.stepIndex + 1));
    },
    handlePreviousButtonClick: () => {
      set((state) => {
        const previousSnapshot = rewindSimulatorSnapshot(
          state.history.slice(0, state.currentSnapshot.stepIndex + 1)
        );

        return previousSnapshot
          ? {
              blockedTransition: null,
              currentSnapshot: previousSnapshot,
            }
          : state;
      });
    },
    handleRecipeValueChange: (value) => {
      if (value) void router.navigate({ search: { recipe: value }, to: "/simulator" });
    },
    handleRecipeSelectChange: (event) => {
      void router.navigate({
        search: { recipe: event.currentTarget.value },
        to: "/simulator",
      });
    },
    handleResetButtonClick: () => {
      set({
        blockedTransition: null,
        currentSnapshot: initialSnapshot,
        history: [initialSnapshot],
      });
    },
    history: [initialSnapshot],
  });
};
