import { z } from "zod/v4";
const clientEnvironmentSchema = z.object({
  VITE_PUBLIC_SITE_URL: z.url({ protocol: /^https?$/ }).default("http://localhost:7201"),
});
export const clientEnvironment = clientEnvironmentSchema.parse(import.meta.env);
