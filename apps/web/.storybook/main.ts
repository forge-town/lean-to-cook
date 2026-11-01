import type { StorybookConfig } from "@storybook/react-vite";

const config = {
  addons: ["@storybook/addon-docs", "@storybook/addon-a11y"],
  core: {
    disableTelemetry: true,
  },
  docs: {
    autodocs: "tag",
  },
  framework: {
    name: "@storybook/react-vite",
    options: {},
  },
  stories: ["../src/**/*.stories.@(js|jsx|mjs|ts|tsx)"],
} satisfies StorybookConfig;

export default config;
