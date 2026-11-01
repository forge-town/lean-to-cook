import { z } from "zod/v4";
const environmentSchema = z.object({ DATABASE_URL: z.string().startsWith("postgres://") });
export const databaseEnvironment = environmentSchema.parse(process.env);
