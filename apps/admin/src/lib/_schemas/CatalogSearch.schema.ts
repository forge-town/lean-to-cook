import { z } from "zod/v4";

import { pageSizes } from "../pageSizes";
/** Validated in-page URL state; business resource and record identity belong to path routes. */
export const CatalogSearchSchema = z.object({
  /** One-based page; coercion accepts browser search strings before integer validation. */
  page: z.coerce.number().int().positive().catch(1).default(1),
  /** Supported rows per page; invalid values use the shared default. */
  pageSize: z.coerce
    .number()
    .refine((value) => pageSizes.some((size) => size === value))
    .catch(25)
    .default(25),
  /** Search text; an empty string leaves the result set unfiltered. */
  q: z.string().catch("").default(""),
  /** Category filter identity; an empty string means every category. */
  categoryId: z.string().catch("").default(""),
  /** A completed operation notice, never a page selector. */
  notice: z.enum(["", "saved", "deleted", "published", "unpublished"]).catch("").default(""),
});
export type CatalogSearch = z.infer<typeof CatalogSearchSchema>;
