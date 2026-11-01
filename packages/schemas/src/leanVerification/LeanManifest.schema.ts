import { z } from "zod/v4";

/** Declared proof scope and independently checkable theorem targets. */
export const LeanManifestSchema = z.strictObject({
  /** Version of this repository-owned contract. */
  schemaVersion: z.literal(1),
  /** Lean kernel version used by this library. */
  leanVersion: z.string().regex(/^4\.\d+\.\d+$/),
  /** Explicit trust policy; checked against Lean's reported theorem axioms. */
  allowedAxioms: z.array(z.string().min(1)),
  /** Coverage subjects; compilation and review remain separate facts. */
  subjects: z
    .array(
      z.strictObject({
        /** Stable recipe, model or data-contract identity. */
        id: z.string().min(1),
        /** Strength of the formal model, independent of presentation detail. */
        scope: z.enum([
          "source-structure",
          "recipe-execution",
          "generic-four-stage",
          "catalog-data",
        ]),
        /** Namespace containing the preserved declarations. */
        namespace: z.string().regex(/^LeanToCook(?:\.[A-Za-z][A-Za-z0-9_]*)+$/),
        /** Lean modules needed for this subject, without file suffixes. */
        modules: z.array(z.string().regex(/^LeanToCook(?:\.[A-Za-z][A-Za-z0-9_]*)+$/)).min(1),
        /** Hash of the complete shared and subject source inputs. */
        sourceDigest: z.string().regex(/^[a-f0-9]{64}$/),
        /** Human review does not follow from successful compilation. */
        review: z.literal("unchecked"),
        /** Original source provenance for generated recipe certificates. */
        provenance: z
          .strictObject({
            /** Pinned upstream revision. */ commit: z.string().min(1),
            /** Path in the vendored snapshot. */ path: z.string().min(1),
          })
          .optional(),
        /** Each theorem must inhabit this target when rechecked by Lean. */
        claims: z
          .array(
            z.strictObject({
              /** Unqualified declaration name in the subject namespace. */ proof: z
                .string()
                .regex(/^[A-Za-z][A-Za-z0-9_]*$/),
              /** Explicit local Lean binders, empty for closed claims. */ parameters: z.string(),
              /** Target proposition checked against the theorem's actual type. */ expression: z
                .string()
                .min(1),
            }),
          )
          .min(1),
      }),
    )
    .min(1),
});
export type LeanManifest = z.infer<typeof LeanManifestSchema>;
