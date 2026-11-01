import { z } from "zod/v4";
/** Outcome of strict ingredient-name reconciliation; ambiguous or unmatched labels are retained. */
export const IngredientLinkReportSchema = z.object({
  /** Whether writes were requested. */ applied: z.boolean(),
  /** Unclassified rows with one unique exact name match. */ matched: z.int().nonnegative(),
  /** Rows actually linked after concurrency checks. */ linked: z.int().nonnegative(),
  /** Recipes changed in the same transaction. */ recipes: z.int().nonnegative(),
  /** Rows with no complete name or alias match. */ unmatched: z.int().nonnegative(),
  /** Rows matching multiple identities, left unchanged. */ ambiguous: z.int().nonnegative(),
});
export type IngredientLinkReport = z.infer<typeof IngredientLinkReportSchema>;
