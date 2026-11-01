import { createHmac, randomBytes, timingSafeEqual } from "node:crypto";
export const SESSION_DURATION_MS = 8 * 60 * 60 * 1000;
const signature = (payload: string, secret: string) =>
  createHmac("sha256", secret).update(payload).digest("hex");
export const issueSession = (secret: string, now = Date.now()): string => {
  const payload = `${now + SESSION_DURATION_MS}.${randomBytes(24).toString("hex")}`;

  return `${payload}.${signature(payload, secret)}`;
};
export const verifySession = (token: string, secret: string, now = Date.now()): boolean => {
  if (!/^\d{1,16}\.[a-f0-9]{48}\.[a-f0-9]{64}$/.test(token)) return false;
  const [expiry, nonce, mac] = token.split(".");
  const expiresAt = Number(expiry);
  if (!Number.isSafeInteger(expiresAt) || expiresAt <= now || expiresAt > now + SESSION_DURATION_MS)
    return false;
  const expected = signature(`${expiry}.${nonce}`, secret);

  return timingSafeEqual(Buffer.from(mac!, "hex"), Buffer.from(expected, "hex"));
};
