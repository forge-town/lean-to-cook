import { readFileSync, writeFileSync, chmodSync } from "node:fs";
import { randomBytes } from "node:crypto";
const path = new URL("../.env", import.meta.url);
const current = readFileSync(path, "utf8");
if (current.includes("ADMIN_PASSWORD_HASH_BASE64="))
  throw new Error("Administrator password is already configured; use admin:password to change it");
const password = randomBytes(18).toString("base64url");
const hash = await Bun.password.hash(password, { algorithm: "argon2id" });
writeFileSync(
  path,
  current.replace(/^ADMIN_PASSWORD_HASH=.*\n/m, "") +
    `ADMIN_PASSWORD_HASH_BASE64=${Buffer.from(hash).toString("base64")}\n`,
);
writeFileSync(new URL("../.env.local", import.meta.url), `LOCAL_ADMIN_PASSWORD=${password}\n`, {
  mode: 0o600,
});
chmodSync(path, 0o600);
console.log("Administrator configured. Local password is in the ignored .env.local file.");
