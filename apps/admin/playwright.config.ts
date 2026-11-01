import { defineConfig, devices } from "@playwright/test";
export default defineConfig({
  testDir: "./e2e",
  fullyParallel: false,
  workers: 1,
  use: {
    baseURL: "http://localhost:7202",
    ...devices["Desktop Chrome"],
    trace: "retain-on-failure",
  },
  reporter: [
    ["list"],
    ["html", { outputFolder: "../../docs/validation/admin/playwright-report", open: "never" }],
  ],
  outputDir: "../../docs/validation/admin/test-results",
});
