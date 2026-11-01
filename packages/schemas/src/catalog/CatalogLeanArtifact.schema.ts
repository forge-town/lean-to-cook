import { z } from "zod/v4";
import { CatalogLeanIdentitySchema } from "./CatalogLeanIdentity.schema";
/** Exact current Lean source with optional evidence of a successful kernel check. */
export const CatalogLeanArtifactSchema = CatalogLeanIdentitySchema.extend({
  /** Current record revision represented in the source. */ updatedAt: z.iso.datetime(),
  /** SHA-256 binds source bytes and model bytes. */ digest: z.string().regex(/^[a-f0-9]{64}$/),
  /** Complete compilable current-record module. */ source: z.string().min(1),
  /** Required shared data-model module. */ modelSource: z.string().min(1),
  /** Relative Lean module location. */ modelPath: z.literal(
    "LeanToCook/DataContracts/Recipes.lean",
  ),
  /** Fully qualified theorem for this record. */ declaration: z.string().min(1),
  /** Checked means a matching successful certificate exists. */ verification: z.enum([
    "pending",
    "checked",
  ]),
  /** Certificate creation time, null until checked. */ checkedAt: z.iso.datetime().nullable(),
  /** Actual compiler version, null until checked. */ leanVersion: z.string().nullable(),
  /** Imported immutable source proof, separate from current admin data. */ origin: z
    .object({
      /** Pinned source commit. */ commit: z.string().min(1),
      /** Recipe path inside the imported snapshot. */ path: z.string().min(1),
      /** Standalone original structural proof source. */ source: z.string().min(1),
      /** Original theorem name. */ declaration: z.string().min(1),
    })
    .nullable(),
});
export type CatalogLeanArtifact = z.infer<typeof CatalogLeanArtifactSchema>;
