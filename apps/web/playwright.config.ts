import { defineConfig, devices } from "@playwright/test";

const port = 7211;
const baseURL = `http://127.0.0.1:${port}`;

export default defineConfig({
  expect: { timeout: 10_000 },
  forbidOnly: Boolean(process.env.CI),
  fullyParallel: false,
  projects: [
    {
      name: "chromium",
      use: { ...devices["Desktop Chrome"] },
    },
  ],
  reporter: [["list"], ["html", { open: "never" }]],
  retries: process.env.CI ? 2 : 0,
  testDir: "./e2e",
  use: {
    baseURL,
    screenshot: "only-on-failure",
    trace: "retain-on-failure",
  },
  webServer: {
    command: `PORT=${port} HOST=127.0.0.1 node .output/server/index.mjs`,
    reuseExistingServer: false,
    timeout: 120_000,
    url: baseURL,
  },
  workers: 1,
});
