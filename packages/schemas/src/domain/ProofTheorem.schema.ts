import { z } from "zod";
import { proofDerivationSchema } from "./ProofDerivation.schema";

export const proofTheoremSchema = z
  .object({
    description: z.string().min(1),
    derivation: proofDerivationSchema,
    name: z.string().regex(/^[A-Za-z][A-Za-z0-9_]*$/),
    statement: z.string().min(1),
    status: z.literal("verified"),
  })
  .strict();

export type ProofTheorem = z.infer<typeof proofTheoremSchema>;
