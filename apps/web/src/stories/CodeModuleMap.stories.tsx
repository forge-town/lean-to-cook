import type { Meta, StoryObj } from "@storybook/react-vite";

import { CodeModuleMap } from "@/storybook/CodeModuleMap";
import { storyModules } from "@/storybook/storyModuleCatalog";

const meta = {
  component: CodeModuleMap,
  parameters: {
    docs: {
      description: {
        component:
          "项目级代码地图。先在这里理解 Route → React → Store/Schema → Lean 的关系，再进入具体页面 Story。",
      },
    },
    moduleInfo: storyModules.codeMap,
  },
  title: "00 Architecture/Code Module Map",
} satisfies Meta<typeof CodeModuleMap>;

export default meta;

type Story = StoryObj<typeof meta>;

export const ProjectAtlas: Story = {};
