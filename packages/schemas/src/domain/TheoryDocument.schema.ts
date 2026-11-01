import { z } from "zod";
import { proofReductionSchema } from "./ProofReduction.schema";
import { recipeSourceSchema } from "./RecipeSource.schema";
import { theoryCategorySchema } from "./TheoryCategory.schema";
import { theoryCertificateSchema } from "./TheoryCertificate.schema";

export const theoryDocumentSchema = z
  .object({
    applicableRecipeIds: z.array(z.string().regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/)),
    assumptions: z.array(z.string().min(1)).min(1),
    category: theoryCategorySchema,
    conclusion: z.string().min(1),
    id: z.string().regex(/^[a-z0-9]+(?:-[a-z0-9]+)*$/),
    index: z.number().int().min(1).max(18),
    lean: theoryCertificateSchema,
    reductions: z.array(proofReductionSchema).min(1),
    source: recipeSourceSchema,
    sourcePath: z.string().regex(/^tips\/.+\.md$/),
    summary: z.string().min(1),
    tags: z.array(z.string().min(1)).min(1),
    title: z.string().min(1),
  })
  .strict();

export type TheoryDocument = z.infer<typeof theoryDocumentSchema>;
