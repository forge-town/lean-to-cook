import { AppShell } from "../src/components/AppShell";
import type { Preview } from "@storybook/react-vite";

import { StoryModuleFrame } from "../src/storybook/StoryModuleFrame";
import { StorybookRouter } from "../src/storybook/StorybookRouter";
import type { StoryModuleInfo } from "../src/storybook/storyModuleCatalog";
import "../src/tailwind.css";
import "./storybook.css";

const preview = {
  decorators: [
    (Story, context) => {
      const moduleInfo = context.parameters.moduleInfo as StoryModuleInfo | undefined;

      return (
        <StorybookRouter>
          <StoryModuleFrame moduleInfo={moduleInfo}>
            {context.title.startsWith("01 Pages/") ? (
              <AppShell>
                <Story />
              </AppShell>
            ) : (
              <Story />
            )}
          </StoryModuleFrame>
        </StorybookRouter>
      );
    },
  ],
  parameters: {
    actions: { argTypesRegex: "^on[A-Z].*" },
    controls: {
      matchers: {
        color: /(background|color)$/iu,
        date: /Date$/u,
      },
    },
    layout: "fullscreen",
    options: {
      storySort: {
        order: ["00 Architecture", "01 Pages", "02 Workbenches", "03 Visual Engine"],
      },
    },
  },
  tags: ["autodocs"],
} satisfies Preview;

export default preview;
