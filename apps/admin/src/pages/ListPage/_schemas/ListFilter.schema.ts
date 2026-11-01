import { z } from "zod/v4";
/** Committed list filters, isolated from typing until submit. */
export const ListFilterSchema = z.object({
  /** Name or alias query. */ search: z.string().max(200),
  /** Optional category. */ categoryId: z.string(),
});
export type ListFilter = z.infer<typeof ListFilterSchema>;
