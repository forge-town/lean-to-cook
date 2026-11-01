import { z } from "zod";

export const theoryCertificateSchema = z
  .object({
    module: z.literal("LeanToCook.Theories.KitchenTheory"),
    namespace: z.string().regex(/^[A-Z][A-Za-z0-9]*$/),
    statement: z.string().min(1),
    theorem: z.string().regex(/^[a-z][A-Za-z0-9_]*$/),
  })
  .strict();

export type TheoryCertificate = z.infer<typeof theoryCertificateSchema>;
