import { serverEnvironment, sessionKey } from "../integrations/env/environment";
import { issueSession, verifySession, SESSION_DURATION_MS } from "./session";
const cookieName = "lean_cook_admin";
export const authenticatedRequest = (request: Request): boolean => {
  const value = request.headers
    .get("cookie")
    ?.split(";")
    .map((part) => part.trim())
    .find((part) => part.startsWith(`${cookieName}=`))
    ?.slice(cookieName.length + 1);

  return value ? verifySession(value, sessionKey) : false;
};
export const sessionCookie = (clear = false): string =>
  `${cookieName}=${clear ? "" : issueSession(sessionKey)}; Path=/api; HttpOnly; SameSite=Strict; Max-Age=${clear ? 0 : SESSION_DURATION_MS / 1000}${serverEnvironment.ADMIN_ORIGIN.startsWith("https:") ? "; Secure" : ""}`;
export const sameOriginRequest = (request: Request): boolean =>
  request.headers.get("origin") === new URL(serverEnvironment.ADMIN_ORIGIN).origin;
