import { z } from "zod/v4";
import { CatalogIdentitySchema } from "./CatalogIdentity.schema";
/** An owned catalog record that supports Lean data generation and checking. */
export const CatalogLeanIdentitySchema = CatalogIdentitySchema.extend({
  /** Only recipes and ingredients have data models. */ resource: z.enum([
    "recipes",
    "ingredients",
  ]),
});
export type CatalogLeanIdentity = z.infer<typeof CatalogLeanIdentitySchema>;
