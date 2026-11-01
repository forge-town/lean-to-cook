import { defineConfig, loadEnv } from "vite";
import { fileURLToPath } from "node:url";
import { tanstackRouter } from "@tanstack/router-plugin/vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";
export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, fileURLToPath(new URL("../..", import.meta.url)), "API_PORT");
  const proxy = { "/api": `http://127.0.0.1:${env.API_PORT || 7203}` };

  return {
    plugins: [
      ...(process.argv[1]?.includes("storybook")
        ? []
        : [
            tanstackRouter({
              target: "react",
              autoCodeSplitting: true,
              quoteStyle: "double",
              semicolons: true,
            }),
          ]),
      react(),
      tailwindcss(),
    ],
    server: { strictPort: true, proxy },
    preview: { strictPort: true, proxy },
    build: {
      rollupOptions: {
        output: {
          manualChunks: {
            react: ["react", "react-dom"],
            refine: ["@refinedev/core"],
            forms: ["react-hook-form", "@hookform/resolvers/zod", "zod/v4"],
          },
        },
      },
    },
  };
});
