export const theoryLibraryPageStepMachine = {
  next: (currentStage: number, lastStage: number) => Math.min(currentStage + 1, lastStage),
  previous: (currentStage: number) => Math.max(currentStage - 1, 0),
  select: (candidate: number, lastStage: number) =>
    Number.isInteger(candidate) && candidate >= 0 && candidate <= lastStage ? candidate : undefined,
};
