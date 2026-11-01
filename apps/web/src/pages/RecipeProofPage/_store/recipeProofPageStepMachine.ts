const FIRST_PROOF_STEP = 0;
const clamp = (step: number, lastStep: number) =>
  Math.min(Math.max(step, FIRST_PROOF_STEP), lastStep);

export const recipeProofPageStepMachine = {
  next: (currentStep: number, lastStep: number) => clamp(currentStep + 1, lastStep),
  previous: (currentStep: number, lastStep: number) => clamp(currentStep - 1, lastStep),
  select: (step: number, lastStep: number) => {
    if (!Number.isInteger(step) || step < FIRST_PROOF_STEP || step > lastStep) {
      return undefined;
    }

    return step;
  },
};
