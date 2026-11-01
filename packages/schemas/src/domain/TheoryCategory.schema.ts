import { z } from "zod";

export const theoryCategorySchema = z.enum([
  "foundation",
  "method",
  "appliance",
  "safety",
  "advanced",
]);

export type TheoryCategory = z.infer<typeof theoryCategorySchema>;
