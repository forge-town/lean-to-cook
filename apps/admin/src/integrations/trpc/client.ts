import { createTRPCClient, httpBatchLink } from "@trpc/client";
import type { AppRouter } from "@repo/api/router";
export const trpcClient = createTRPCClient<AppRouter>({
  links: [httpBatchLink({ url: "/api/trpc", maxURLLength: 2000 })],
});
