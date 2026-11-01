import { z } from "zod";

export const sourceRecipeCoverageStatusSchema = z.enum([
  "verified",
  "missing-schema",
  "missing-proof",
  "compilation-failure",
  "source-drift",
  "duplicate",
]);

export type SourceRecipeCoverageStatus = z.infer<typeof sourceRecipeCoverageStatusSchema>;
