import { handleRequest } from "./handler";
import { serverEnvironment } from "./integrations/env/environment";
const server = Bun.serve({
  hostname: "127.0.0.1",
  port: serverEnvironment.API_PORT,
  maxRequestBodySize: 4 * 1024 * 1024,
  fetch: (request, server) => handleRequest(request, server.requestIP(request)?.address ?? "local"),
});
console.log(`Catalog API listening at http://127.0.0.1:${server.port}`);
