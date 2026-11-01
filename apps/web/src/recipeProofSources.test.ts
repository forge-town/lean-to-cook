import { execFileSync } from "node:child_process";
import { resolve } from "node:path";
import { describe, expect, it } from "vitest";
import { getRecipeProofSource } from "./pages/RecipeProofPage/recipeProofSources";

describe("displayed recipe proof sources", () => {
  it.each(["tomato-scrambled-eggs", "milk-tea"])(
    "keeps the complete displayed %s proof independently compilable",
    (id) => {
      const source = getRecipeProofSource(id);
      expect(source).toContain("structure");
      expect(source).toContain("_spec");
      expect(source).toContain("theorem");
      execFileSync("lake", ["env", "lean", "-DwarningAsError=true", "--stdin"], {
        cwd: resolve(import.meta.dirname, "../../../packages/lean-proofs"),
        input: source,
        encoding: "utf8",
        timeout: 30000,
      });
    },
    60000
  );
});
