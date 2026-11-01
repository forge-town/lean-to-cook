import { describe, expect, it } from "vitest";
import { issueSession, verifySession } from "./session";
const secret = "test-secret-".repeat(8);
describe("administrator sessions", () => {
  it("accepts a signed unexpired session", () => {
    const token = issueSession(secret, 1000);
    expect(verifySession(token, secret, 1001)).toBe(true);
  });
  it("rejects expired, malformed, forged, or differently signed tokens", () => {
    const token = issueSession(secret, 1000);
    expect(verifySession(token, secret, 1000 + 8 * 60 * 60 * 1000)).toBe(false);
    expect(verifySession(token + "x", secret, 1001)).toBe(false);
    expect(verifySession(token, "changed-secret", 1001)).toBe(false);
    expect(verifySession("broken", secret, 1001)).toBe(false);
  });
});
