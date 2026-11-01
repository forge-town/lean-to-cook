import { existsSync, readFileSync, writeFileSync } from "node:fs";
import { randomBytes } from "node:crypto";
const envPath = new URL("../.env", import.meta.url);
if (!existsSync(envPath)) {
  const password = randomBytes(24).toString("hex");
  writeFileSync(
    envPath,
    `DATABASE_URL=postgres://lean_cook:${password}@127.0.0.1:55482/lean_cook\nAPI_PORT=7203\nADMIN_ORIGIN=http://localhost:7202\nADMIN_SESSION_SECRET=${randomBytes(48).toString("hex")}\n`,
    { mode: 0o600 },
  );
}
const content = readFileSync(envPath, "utf8");
const databaseUrl = new URL(content.match(/^DATABASE_URL=(.+)$/m)?.[1]?.trim() ?? "");
if (
  databaseUrl.hostname !== "127.0.0.1" ||
  databaseUrl.port !== "55482" ||
  databaseUrl.pathname !== "/lean_cook"
)
  throw new Error(
    "db:setup only manages the project's local database. Use db:migrate for another database.",
  );
const inspect = Bun.spawnSync(
  ["docker", "inspect", "--format", "{{.State.Running}}", "lean-to-cook-postgres"],
  { stdout: "pipe", stderr: "pipe" },
);
if (inspect.exitCode === 0) {
  const start = Bun.spawnSync(["docker", "start", "lean-to-cook-postgres"], {
    stdout: "pipe",
    stderr: "pipe",
  });
  if (start.exitCode !== 0) throw new Error("Cannot start the local catalog database");
} else {
  const create = Bun.spawnSync(
    [
      "docker",
      "run",
      "--name",
      "lean-to-cook-postgres",
      "--label",
      "com.codeforge.project=lean-to-cook",
      "-e",
      "POSTGRES_USER=lean_cook",
      "-e",
      `POSTGRES_PASSWORD=${databaseUrl.password}`,
      "-e",
      "POSTGRES_DB=lean_cook",
      "-p",
      "127.0.0.1:55482:5432",
      "-v",
      "lean-to-cook-postgres:/var/lib/postgresql/data",
      "-d",
      "postgres:17-alpine",
    ],
    { stdout: "pipe", stderr: "pipe" },
  );
  if (create.exitCode !== 0)
    throw new Error("Cannot create the local catalog database; check Docker and port 55482");
}
const ready = await Bun.spawn(
  [
    "docker",
    "exec",
    "lean-to-cook-postgres",
    "sh",
    "-c",
    "until pg_isready -U lean_cook -d lean_cook >/dev/null; do sleep 1; done",
  ],
  { stdout: "ignore", stderr: "ignore" },
).exited;
if (ready !== 0) throw new Error("Local catalog database did not become ready");
if (!content.includes("ADMIN_PASSWORD_HASH_BASE64=")) await import("./setup-admin-password");
console.log("Local catalog database is ready. Run bun run db:migrate and bun run db:seed next.");
