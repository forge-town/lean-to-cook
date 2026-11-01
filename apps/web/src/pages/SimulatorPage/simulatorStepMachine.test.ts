import { steamedSeaBass } from "@repo/schemas";
import { describe, expect, it } from "vitest";

import {
  createSimulatorSnapshot,
  executeSimulatorStep,
  rewindSimulatorSnapshot,
} from "./simulatorStepMachine";

describe("theorem-driven simulator step machine", () => {
  it("blocks an action whose preconditions are false without mutating the snapshot", () => {
    const initial = createSimulatorSnapshot(steamedSeaBass);
    const transition = executeSimulatorStep(steamedSeaBass, initial, 2);

    expect(transition.kind).toBe("blocked");

    if (transition.kind !== "blocked") throw new Error("Expected a blocked transition");

    expect(transition.snapshot).toBe(initial);
    expect(transition.missingPredicates).toContain("aromatics.cut");
    expect(initial).toEqual({ predicates: ["fish.present", "heat.off"], stepIndex: 0 });
  });

  it("applies effects only when the next action is ready", () => {
    const initial = createSimulatorSnapshot(steamedSeaBass);
    const transition = executeSimulatorStep(steamedSeaBass, initial, 1);

    expect(transition.kind).toBe("completed");
    expect(transition.snapshot.stepIndex).toBe(1);
    expect(transition.snapshot.predicates).toContain("aromatics.cut");
    expect(initial.predicates).not.toContain("aromatics.cut");
  });

  it("rewinds to the previously visited proof state", () => {
    const initial = createSimulatorSnapshot(steamedSeaBass);
    const first = executeSimulatorStep(steamedSeaBass, initial, 1);

    expect(first.kind).toBe("completed");
    expect(rewindSimulatorSnapshot([initial, first.snapshot])).toBe(initial);
  });
});
