import { z } from "zod";

import { proofReductionSchema } from "./ProofReduction.schema";

const catalogIdSchema = z.string().regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/);

export const appliedTheorySchema = z
  .object({
    caseIds: z.array(catalogIdSchema).min(1),
    conclusion: z.string().min(1),
    id: catalogIdSchema,
    lean: z
      .object({
        module: z.literal("LeanToCook.Verification.AppliedTheory"),
        theorem: z.string().regex(/^[a-z][A-Za-z0-9_]*$/),
      })
      .strict(),
    reductions: z.array(proofReductionSchema).min(1),
    scale: z.enum(["vertical", "synthesis"]),
    statement: z.string().min(1),
    summary: z.string().min(1),
    theoryIds: z.array(catalogIdSchema).min(1),
    title: z.string().min(1),
  })
  .strict();

export type AppliedTheory = z.infer<typeof appliedTheorySchema>;
