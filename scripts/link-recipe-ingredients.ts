import { databaseClient } from "../packages/db/src/connection";
import { CatalogService } from "../packages/services/src/CatalogService/Catalog.service";
const result = await CatalogService.reconcileIngredients({
  apply: process.argv.includes("--apply"),
});
result.match(
  (report) => console.log(JSON.stringify(report, null, 2)),
  (error) => {
    console.error(error.message);
    process.exitCode = 1;
  },
);
await databaseClient.end();
