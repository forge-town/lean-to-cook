import type { AuthProvider } from "@refinedev/core";
import { z } from "zod/v4";
import { ResultAsync } from "neverthrow";
const authRequest = (path: string, data?: object) =>
  ResultAsync.fromPromise(
    (async () => {
      const response = await fetch(
        `/api/auth/${path}`,
        data
          ? {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify(data),
            }
          : undefined,
      );
      const value = z
        .object({ authenticated: z.boolean().optional(), message: z.string().optional() })
        .parse(await response.json());

      return { ok: response.ok, ...value };
    })(),
    () => new Error("无法连接后台，请稍后重试"),
  );
export const authProvider: AuthProvider = {
  login: async (input: { password: string }) =>
    (await authRequest("login", input)).match(
      (value) => ({
        success: value.ok && !!value.authenticated,
        error: value.ok ? undefined : new Error(value.message ?? "登录失败"),
      }),
      (error) => ({ success: false, error }),
    ),
  logout: async () =>
    (await authRequest("logout", {})).match(
      (value) => ({ success: value.ok }),
      (error) => ({ success: false, error }),
    ),
  check: async () =>
    (await authRequest("session")).match(
      (value) => ({ authenticated: value.ok && !!value.authenticated }),
      (error) => ({ authenticated: false, error }),
    ),
  onError: async (error: { data?: { code?: string } }) => ({
    logout: error.data?.code === "UNAUTHORIZED",
  }),
};
