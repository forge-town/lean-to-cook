import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";
import * as schema from "@repo/db-schema";
import { databaseEnvironment } from "./integrations/env/environment";
export const databaseClient = postgres(databaseEnvironment.DATABASE_URL, {
  max: 10,
  onnotice: () => {},
});
export const db = drizzle(databaseClient, { schema });
export type Database = typeof db;
export type DatabaseTransaction = Parameters<Parameters<Database["transaction"]>[0]>[0];
