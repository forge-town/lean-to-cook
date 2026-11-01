import { describe, expect, test } from "vitest";
import {
  buildProofTrace,
  recipeSchema,
  resolveRecipeQuantities,
  tomatoScrambledEggs,
  validateRecipeFlow,
} from "./index";

describe("西红柿炒鸡蛋 recipe", () => {
  test("is accepted by the strict recipe schema", () => {
    expect(recipeSchema.parse(tomatoScrambledEggs)).toEqual(
      tomatoScrambledEggs,
    );
  });

  test("rejects undeclared application fields", () => {
    const result = recipeSchema.safeParse({
      ...tomatoScrambledEggs,
      vagueInstruction: "适量翻炒",
    });

    expect(result.success).toBe(false);
  });

  test("resolves per-serving, ranged, and derived quantities", () => {
    const quantities = resolveRecipeQuantities(tomatoScrambledEggs, 2);

    expect(quantities.tomato).toMatchObject({ min: 2, max: 2, unit: "piece" });
    expect(quantities.egg).toMatchObject({ min: 3, max: 3, unit: "piece" });
    expect(quantities.cookingOil).toMatchObject({
      min: 12,
      max: 12,
      unit: "milliliter",
    });
    expect(quantities.salt).toMatchObject({ min: 3, max: 4, unit: "gram" });
    expect(quantities.sugar).toMatchObject({ min: 0, max: 4, unit: "gram" });
    expect(quantities.scallion).toMatchObject({ min: 0, max: 20, unit: "gram" });
  });

  test("publishes one verified theorem for the complete two-serving contract", () => {
    expect(tomatoScrambledEggs.proof.theorems.at(-1)).toMatchObject({
      name: "tomatoEggPlan_correct_for_two",
      status: "verified",
    });
  });

  test("publishes playable derivations for every theorem", () => {
    expect(tomatoScrambledEggs.proof.theorems).toHaveLength(9);

    for (const theorem of tomatoScrambledEggs.proof.theorems) {
      expect(theorem.derivation.premises.length).toBeGreaterThan(0);
      expect(theorem.derivation.reductions.length).toBeGreaterThan(0);
      expect(theorem.derivation.conclusion.length).toBeGreaterThan(0);
    }
  });

  test("declares every required state before it is consumed", () => {
    expect(validateRecipeFlow(tomatoScrambledEggs)).toEqual({
      errors: [],
      valid: true,
    });
  });

  test("computes a continuous formal proof trace", () => {
    const trace = buildProofTrace(tomatoScrambledEggs);

    expect(trace.initial.predicates).toEqual([
      "tomato.present",
      "egg.present",
      "heat.off",
    ]);
    expect(trace.steps[0]).toMatchObject({
      formalAction: "washTomato",
      sequence: 1,
      stateBefore: { index: 0 },
      stateAfter: { index: 1 },
    });
    expect(trace.steps[3]?.numericDerivations).toMatchObject([
      { expression: "eggsFor 2 = ⌈1.5 × 2⌉ = 3", result: "3 个" },
      { expression: "eggSalt 2 = 1 g × 2 = 2 g", result: "2g" },
    ]);
    expect(trace.steps[4]?.numericDerivations[0]).toMatchObject({
      expression: "oilMlFor 2 = 4 ml × eggsFor 2 = 4 × 3 = 12 ml",
      result: "12ml",
    });
    expect(trace.steps[9]?.numericDerivations.map((item) => item.result)).toEqual([
      "[3,4]g",
      "[1,2]g",
      "[0,4]g",
      "[0,20]g",
    ]);
    expect(trace.steps[6]?.stateAfter.predicates).toContain("heat.off");
    expect(trace.steps[6]?.stateAfter.predicates).not.toContain("heat.on");
    expect(trace.steps.at(-1)?.stateAfter.predicates).toContain("dish.plated");
    expect(trace.steps.at(-1)?.stateAfter.predicates).not.toContain("heat.on");
  });
});
