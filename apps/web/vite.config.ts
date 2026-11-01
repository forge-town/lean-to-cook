import { defineConfig, loadEnv } from "vite";
import { fileURLToPath } from "node:url";
import { tanstackStart } from "@tanstack/react-start/plugin/vite";
import { nitro } from "nitro/vite";
import viteReact from "@vitejs/plugin-react";
import viteTsConfigPaths from "vite-tsconfig-paths";
import tailwindcss from "@tailwindcss/vite";

const IS_STORYBOOK = process.argv[1]?.includes("storybook");

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, fileURLToPath(new URL("../..", import.meta.url)), "API_PORT");
  const apiOrigin = `http://127.0.0.1:${env.API_PORT || 7203}`;
  return {
    plugins: [
      ...(!IS_STORYBOOK
        ? [nitro({ routeRules: { "/api/**": { proxy: `${apiOrigin}/api/**` } } })]
        : []),
      viteTsConfigPaths({
        projects: ["./tsconfig.json"],
      }),
      tailwindcss(),
      ...(!IS_STORYBOOK ? [tanstackStart()] : []),
      viteReact(),
    ],
    server: { strictPort: true, proxy: { "/api": apiOrigin } },
    preview: { strictPort: true, proxy: { "/api": apiOrigin } },
    build: {
      target: "esnext",
    },
    esbuild: {
      target: "esnext",
    },
    optimizeDeps: {
      esbuildOptions: {
        target: "esnext",
      },
    },
  };
});
