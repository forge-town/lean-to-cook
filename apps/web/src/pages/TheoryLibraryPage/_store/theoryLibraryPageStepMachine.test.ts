import { describe, expect, it } from "vitest";
import { theoryLibraryPageStepMachine } from "./theoryLibraryPageStepMachine";

describe("theory library step machine", () => {
  it("moves within the current derivation bounds", () => {
    expect(theoryLibraryPageStepMachine.next(0, 2)).toBe(1);
    expect(theoryLibraryPageStepMachine.next(2, 2)).toBe(2);
    expect(theoryLibraryPageStepMachine.previous(1)).toBe(0);
    expect(theoryLibraryPageStepMachine.previous(0)).toBe(0);
  });

  it("rejects invalid direct stage selections", () => {
    expect(theoryLibraryPageStepMachine.select(2, 2)).toBe(2);
    expect(theoryLibraryPageStepMachine.select(-1, 2)).toBeUndefined();
    expect(theoryLibraryPageStepMachine.select(3, 2)).toBeUndefined();
    expect(theoryLibraryPageStepMachine.select(Number.NaN, 2)).toBeUndefined();
  });
});
