import { z } from "zod";

export const proofReductionSchema = z
  .object({
    expression: z.string().min(1),
    reason: z.string().min(1),
  })
  .strict();

export type ProofReduction = z.infer<typeof proofReductionSchema>;
