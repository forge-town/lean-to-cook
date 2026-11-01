import { defineConfig } from "vitest/config";
import { loadEnv } from "vite";
import { fileURLToPath } from "node:url";
const env = loadEnv("test", fileURLToPath(new URL("../..", import.meta.url)), "DATABASE_URL");
export default defineConfig({ test: { env, fileParallelism: false } });
