import { describe, expect, it } from "vitest";
import { kitchenTheoryCatalog, theoryDocumentSchema } from "./index";

describe("kitchen theory catalog", () => {
  it("covers every HowToCook tips document at the pinned commit", () => {
    expect(kitchenTheoryCatalog).toHaveLength(18);
    expect(new Set(kitchenTheoryCatalog.map(({ id }) => id)).size).toBe(18);
    expect(new Set(kitchenTheoryCatalog.map(({ index }) => index).values()).size).toBe(18);
    expect(kitchenTheoryCatalog.map(({ index }) => index).sort((a, b) => a - b)).toEqual(
      Array.from({ length: 18 }, (_, index) => index + 1)
    );
  });

  it("pins every source and exposes one unique Lean certificate per document", () => {
    const theoremKeys = kitchenTheoryCatalog.map(({ lean }) => `${lean.namespace}.${lean.theorem}`);

    expect(new Set(theoremKeys).size).toBe(18);
    for (const document of kitchenTheoryCatalog) {
      expect(() => theoryDocumentSchema.parse(document)).not.toThrow();
      expect(document.source.commit).toBe("3172c7d88345e20a2d02636cc7caed69204c4845");
      expect(document.source.url).toContain(document.source.commit);
      expect(document.reductions.length).toBeGreaterThan(0);
    }
  });
});
