import type { KitchenPredicate, Recipe } from "@repo/schemas";

export interface SimulatorSnapshot {
  predicates: KitchenPredicate[];
  stepIndex: number;
}

export interface SimulatorBlockedTransition {
  kind: "blocked";
  message: string;
  missingPredicates: KitchenPredicate[];
  snapshot: SimulatorSnapshot;
  targetStepIndex: number;
}

export interface SimulatorCompletedTransition {
  kind: "completed";
  snapshot: SimulatorSnapshot;
  targetStepIndex: number;
}

export type SimulatorTransition = SimulatorBlockedTransition | SimulatorCompletedTransition;

export const createSimulatorSnapshot = (recipe: Recipe): SimulatorSnapshot => ({
  predicates: [...recipe.initialState],
  stepIndex: 0,
});

export const executeSimulatorStep = (
  recipe: Recipe,
  snapshot: SimulatorSnapshot,
  targetStepIndex: number
): SimulatorTransition => {
  const step = recipe.steps[targetStepIndex - 1];

  if (!step) {
    return {
      kind: "blocked",
      message: "目标动作不存在，证明轨迹保持在当前状态。",
      missingPredicates: [],
      snapshot,
      targetStepIndex,
    };
  }

  const predicateSet = new Set(snapshot.predicates);
  const missingPredicates = step.requires.filter((predicate) => !predicateSet.has(predicate));

  if (missingPredicates.length > 0) {
    return {
      kind: "blocked",
      message: `前置条件不成立：${missingPredicates.join("、")}。失败动作没有改变厨房状态。`,
      missingPredicates,
      snapshot,
      targetStepIndex,
    };
  }

  if (targetStepIndex !== snapshot.stepIndex + 1) {
    return {
      kind: "blocked",
      message: `证明轨迹必须连续执行；当前只能执行第 ${snapshot.stepIndex + 1} 步。`,
      missingPredicates: [],
      snapshot,
      targetStepIndex,
    };
  }

  for (const effect of step.effects) {
    if (effect.value) predicateSet.add(effect.predicate);
    else predicateSet.delete(effect.predicate);
  }

  return {
    kind: "completed",
    snapshot: {
      predicates: [...predicateSet],
      stepIndex: targetStepIndex,
    },
    targetStepIndex,
  };
};

export const rewindSimulatorSnapshot = (
  history: SimulatorSnapshot[]
): SimulatorSnapshot | undefined => history.at(-2);
