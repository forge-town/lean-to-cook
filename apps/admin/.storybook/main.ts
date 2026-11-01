import type { StorybookConfig } from "@storybook/react-vite";
export default { stories: ["../src/**/*.stories.tsx"], addons: ["@storybook/addon-a11y"], framework: { name: "@storybook/react-vite", options: {} }, core: { disableTelemetry: true } } satisfies StorybookConfig;
