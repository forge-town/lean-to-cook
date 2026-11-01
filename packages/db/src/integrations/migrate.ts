import { migrate } from "drizzle-orm/postgres-js/migrator";
import { fileURLToPath } from "node:url";
import { db, databaseClient } from "../connection";
await migrate(db, {
  migrationsFolder: fileURLToPath(new URL("../../migrations", import.meta.url)),
});
await databaseClient.end();
console.log("Catalog database migrated.");
