import { describe, expect, it } from "vitest";

import { recipeProofPageStepMachine } from "./recipeProofPageStepMachine";

describe("recipeProofPageStepMachine", () => {
  it("advances and rewinds one proof state", () => {
    expect(recipeProofPageStepMachine.next(4, 12)).toBe(5);
    expect(recipeProofPageStepMachine.previous(4, 12)).toBe(3);
  });

  it("stays inside the proof boundary", () => {
    expect(recipeProofPageStepMachine.previous(0, 12)).toBe(0);
    expect(recipeProofPageStepMachine.next(12, 12)).toBe(12);
  });

  it("accepts valid direct selection and rejects invalid values", () => {
    expect(recipeProofPageStepMachine.select(3, 12)).toBe(3);
    expect(recipeProofPageStepMachine.select(12, 12)).toBe(12);
    expect(recipeProofPageStepMachine.select(-1, 12)).toBeUndefined();
    expect(recipeProofPageStepMachine.select(13, 12)).toBeUndefined();
    expect(recipeProofPageStepMachine.select(Number.NaN, 12)).toBeUndefined();
  });
});
