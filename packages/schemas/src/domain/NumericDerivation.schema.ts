import { z } from "zod";

export const numericDerivationSchema = z
  .object({
    expression: z.string().min(1),
    label: z.string().min(1),
    reason: z.string().min(1),
    result: z.string().min(1),
    theorem: z.string().regex(/^[A-Za-z][A-Za-z0-9_]*$/),
  })
  .strict();

export type NumericDerivation = z.infer<typeof numericDerivationSchema>;
