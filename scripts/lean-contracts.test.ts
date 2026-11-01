import { describe, expect, it } from "bun:test";
import * as metadata from "./generate-lean-metadata";
import { readFileSync, readdirSync } from "node:fs";
import { join, resolve } from "node:path";

describe("Lean contract drift guard", () => {
  it("registers every handwritten recipe theorem, including shared and extra guards", () => {
    const manifest = metadata.buildLeanMetadata()["verification/manifest.json"];
    const registered = new Set(
      manifest.subjects.flatMap((subject) =>
        subject.claims.map((claim) => `${subject.namespace}.${claim.proof}`),
      ),
    );
    const root = resolve(import.meta.dir, "../packages/lean-proofs/LeanToCook");
    const paths = [
      "CatalogCases/Proofs.lean",
      ...readdirSync(join(root, "Recipes")).map((name) => `Recipes/${name}/Proofs.lean`),
    ];
    for (const path of paths) {
      const source = readFileSync(join(root, path), "utf8");
      const namespace = source.match(/^namespace (\S+)/m)![1]!;
      for (const match of source.matchAll(/^theorem (\w+)/gm))
        expect(registered.has(`${namespace}.${match[1]}`)).toBe(true);
    }
  });
  it("accepts the complete current registry and action map", () => {
    expect(typeof metadata.validateLeanMetadata).toBe("function");
    const files = metadata.buildLeanMetadata();
    expect(
      metadata
        .validateLeanMetadata(files["verification/manifest.json"], files["bridge/action-map.json"])
        .isOk(),
    ).toBe(true);
  });

  it("rejects a missing subject rather than reporting partial coverage as complete", () => {
    expect(typeof metadata.validateLeanMetadata).toBe("function");
    const files = metadata.buildLeanMetadata();
    const manifest = structuredClone(files["verification/manifest.json"]);
    manifest.subjects.pop();
    expect(metadata.validateLeanMetadata(manifest, files["bridge/action-map.json"]).isErr()).toBe(
      true,
    );
  });

  it("rejects an action constructor that differs from the frontend contract", () => {
    expect(typeof metadata.validateLeanMetadata).toBe("function");
    const files = metadata.buildLeanMetadata();
    const map = structuredClone(files["bridge/action-map.json"]);
    map.recipes[0]!.steps[0]!.constructor = "plate";
    expect(metadata.validateLeanMetadata(files["verification/manifest.json"], map).isErr()).toBe(
      true,
    );
  });

  it("rejects a proof declaration replaced with a nonexistent theorem", () => {
    expect(typeof metadata.validateLeanMetadata).toBe("function");
    const files = metadata.buildLeanMetadata();
    const manifest = structuredClone(files["verification/manifest.json"]);
    manifest.subjects[0]!.claims[0]!.proof = "missing_proof";
    expect(metadata.validateLeanMetadata(manifest, files["bridge/action-map.json"]).isErr()).toBe(
      true,
    );
  });
});
