import { readFileSync, writeFileSync } from "node:fs";
const password = (await Bun.stdin.text()).trim();
if (password.length < 16 || password.length > 256)
  throw new Error("Provide a 16–256 character password on stdin");
const hash = await Bun.password.hash(password, { algorithm: "argon2id" });
const path = new URL("../.env", import.meta.url);
const content = readFileSync(path, "utf8").replace(/^ADMIN_PASSWORD_HASH_BASE64=.*\n?/m, "");
writeFileSync(
  path,
  content + `ADMIN_PASSWORD_HASH_BASE64=${Buffer.from(hash).toString("base64")}\n`,
  { mode: 0o600 },
);
const localPath = new URL("../.env.local", import.meta.url);
const localContent = readFileSync(localPath, "utf8").replace(/^LOCAL_ADMIN_PASSWORD=.*\n?/m, "");
writeFileSync(localPath, localContent + `LOCAL_ADMIN_PASSWORD=${password}\n`, { mode: 0o600 });
console.log("Administrator password updated. Restart the API to invalidate existing sessions.");
