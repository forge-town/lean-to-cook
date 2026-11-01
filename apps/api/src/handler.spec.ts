import { describe, expect, it, vi } from "vitest";
import { handleRequest } from "./handler";
vi.mock("./integrations/env/environment", () => ({
  serverEnvironment: { ADMIN_ORIGIN: "http://localhost:7202", ADMIN_PASSWORD_HASH_BASE64: "test" },
  sessionKey: "test-secret-".repeat(8),
}));
vi.mock("./router", () => ({ appRouter: {} }));
describe("HTTP protection", () => {
  it("rejects foreign or absent origins for writes", async () => {
    for (const origin of ["https://foreign.example", null]) {
      const headers = origin ? { origin } : undefined;
      const response = await handleRequest(
        new Request("http://localhost:7203/api/auth/login", { method: "POST", headers }),
      );
      expect(response.status).toBe(403);
    }
  });
  it("keeps anonymous sessions closed and disables response caching", async () => {
    const response = await handleRequest(new Request("http://localhost:7203/api/auth/session"));
    expect(await response.json()).toEqual({ authenticated: false });
    expect(response.headers.get("cache-control")).toBe("no-store");
  });
  it("expires the HttpOnly cookie when logging out", async () => {
    const response = await handleRequest(
      new Request("http://localhost:7203/api/auth/logout", {
        method: "POST",
        headers: { origin: "http://localhost:7202" },
      }),
    );
    expect(response.status).toBe(200);
    expect(response.headers.get("set-cookie")).toContain("HttpOnly; SameSite=Strict; Max-Age=0");
  });
});
