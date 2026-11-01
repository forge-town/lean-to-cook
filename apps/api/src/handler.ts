import { serveIngredientImage } from "./ingredientImages";
import { fetchRequestHandler } from "@trpc/server/adapters/fetch";
import { ResultAsync } from "neverthrow";
import { z } from "zod/v4";
import { appRouter } from "./router";
import { serverEnvironment } from "./integrations/env/environment";
import { authenticatedRequest, sameOriginRequest, sessionCookie } from "./auth/cookies";
const attempts = new Map<string, { count: number; until: number }>();
const json = (data: object, status = 200, headers: HeadersInit = {}) =>
  Response.json(data, {
    status,
    headers: { "Cache-Control": "no-store", "X-Content-Type-Options": "nosniff", ...headers },
  });
export const handleRequest = async (request: Request, clientIp = "local"): Promise<Response> => {
  const url = new URL(request.url);
  if (request.method === "POST" && !sameOriginRequest(request))
    return json({ message: "请求来源不匹配，请从后台页面操作" }, 403);
  if (request.method === "GET" && url.pathname.startsWith("/api/ingredient-images/"))
    return serveIngredientImage(url.pathname);
  if (url.pathname === "/api/auth/session" && request.method === "GET")
    return json({ authenticated: authenticatedRequest(request) });
  if (url.pathname === "/api/auth/logout" && request.method === "POST")
    return json({ authenticated: false }, 200, { "Set-Cookie": sessionCookie(true) });
  if (url.pathname === "/api/auth/login" && request.method === "POST") {
    const now = Date.now();
    for (const [key, value] of attempts) if (value.until <= now) attempts.delete(key);
    const attempt = attempts.get(clientIp) ?? { count: 0, until: now + 15 * 60 * 1000 };
    if (attempt.count >= 5) return json({ message: "尝试次数过多，请 15 分钟后再试" }, 429);
    const body = await ResultAsync.fromPromise(request.json(), () => new Error("登录内容格式有误"));
    if (body.isErr()) return json({ message: body.error.message }, 400);
    const parsed = z.strictObject({ password: z.string().min(1).max(256) }).safeParse(body.value);
    if (!parsed.success) return json({ message: "请填写管理员密码" }, 400);
    attempts.set(clientIp, { ...attempt, count: attempt.count + 1 });
    const result = await ResultAsync.fromPromise(
      Bun.password.verify(
        parsed.data.password,
        Buffer.from(serverEnvironment.ADMIN_PASSWORD_HASH_BASE64, "base64").toString("utf8"),
      ),
      () => new Error("登录暂时不可用"),
    );
    if (result.isErr()) return json({ message: result.error.message }, 503);
    if (!result.value) return json({ message: "密码不正确" }, 401);
    attempts.delete(clientIp);

    return json({ authenticated: true }, 200, { "Set-Cookie": sessionCookie() });
  }
  if (url.pathname.startsWith("/api/trpc/")) {
    const response = await fetchRequestHandler({
      endpoint: "/api/trpc",
      req: request,
      router: appRouter,
      createContext: () => ({ authenticated: authenticatedRequest(request) }),
    });
    response.headers.set("Cache-Control", "no-store");
    response.headers.set("X-Content-Type-Options", "nosniff");

    return response;
  }

  return json({ message: "页面不存在" }, 404);
};
