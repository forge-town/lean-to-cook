import type { ProofTrace } from "@repo/schemas";

const subscriptDigits = ["₀", "₁", "₂", "₃", "₄", "₅", "₆", "₇", "₈", "₉"] as const;

export const getStateSymbol = (index: number) =>
  `S${[...String(index)].map((digit) => subscriptDigits[Number(digit)]).join("")}`;

export const getProofJudgement = (trace: ProofTrace, step: number) => {
  const traceStep = trace.steps[step - 1];

  if (!traceStep) {
    return `${getStateSymbol(0)} ≔ initialKitchen`;
  }

  return `${getStateSymbol(traceStep.stateBefore.index)} ⊢ .${traceStep.formalAction} ⇓ ${getStateSymbol(traceStep.stateAfter.index)}`;
};
