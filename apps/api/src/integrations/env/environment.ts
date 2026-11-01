import { z } from "zod/v4";
const serverEnvironmentSchema = z.object({
  API_PORT: z.coerce.number().int().min(1).max(65_535).default(7203),
  ADMIN_ORIGIN: z.url({ protocol: /^https?$/ }),
  ADMIN_SESSION_SECRET: z.string().min(64),
  ADMIN_PASSWORD_HASH_BASE64: z.string().min(20),
  NODE_ENV: z.enum(["development", "test", "production"]).default("development"),
});
export const serverEnvironment = serverEnvironmentSchema.parse(process.env);
if (
  serverEnvironment.NODE_ENV === "production" &&
  !serverEnvironment.ADMIN_ORIGIN.startsWith("https://")
)
  throw new Error("Production administrator origin requires HTTPS");
export const sessionKey =
  serverEnvironment.ADMIN_SESSION_SECRET + serverEnvironment.ADMIN_PASSWORD_HASH_BASE64;
