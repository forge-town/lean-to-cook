import { z } from "zod";

import { sourceRecipeCoverageStatusSchema } from "./SourceRecipeCoverageStatus.schema";

export const sourceRecipeCoverageSchema = z
  .object({
    diagnostics: z.array(z.string()),
    entries: z.array(
      z
        .object({
          id: z
            .string()
            .regex(/^[a-f0-9]{12}$/)
            .nullable(),
          reasons: z.array(z.string()),
          sourcePath: z.string().regex(/^dishes\/.+\.md$/),
          status: sourceRecipeCoverageStatusSchema,
          title: z.string().min(1).optional(),
        })
        .strict()
    ),
    source: z
      .object({
        commit: z.string().regex(/^[a-f0-9]{40}$/),
        repository: z.literal("Anduin2017/HowToCook"),
      })
      .strict(),
    summary: z
      .object({
        catalogEntries: z.number().int().nonnegative(),
        compilationFailure: z.number().int().nonnegative(),
        duplicate: z.number().int().nonnegative(),
        missingProof: z.number().int().nonnegative(),
        missingSchema: z.number().int().nonnegative(),
        sourceDrift: z.number().int().nonnegative(),
        sourceRecipes: z.number().int().nonnegative(),
        verified: z.number().int().nonnegative(),
      })
      .strict(),
  })
  .strict();

export type SourceRecipeCoverage = z.infer<typeof sourceRecipeCoverageSchema>;
