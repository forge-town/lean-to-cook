import type { Meta, StoryObj } from "@storybook/react-vite";
import { getSourceRecipeById } from "@repo/schemas";

import whiteShrimpMarkdown from "../../../../content/how-to-cook/dishes/aquatic/白灼虾/白灼虾.md?raw";
import { SourceRecipeWorkbenchPage } from "@/pages/SourceRecipeWorkbenchPage";
import { storyModules } from "@/storybook/storyModuleCatalog";

const whiteShrimp = getSourceRecipeById("61ffbcb05ceb");

if (!whiteShrimp) {
  throw new Error("Storybook fixture is missing source recipe 61ffbcb05ceb");
}

const meta = {
  args: {
    markdown: whiteShrimpMarkdown,
    sourceRecipe: whiteShrimp,
  },
  component: SourceRecipeWorkbenchPage,
  parameters: {
    docs: {
      description: {
        component:
          "Lean 结构证书的完整工作台 Story。点击步骤可以观察厨房状态变化，并在右侧查看六项 QED 与逐菜定理名。",
      },
    },
    moduleInfo: storyModules.structuralWorkbench,
  },
  title: "02 Workbenches/Lean Structural Workbench",
} satisfies Meta<typeof SourceRecipeWorkbenchPage>;

export default meta;

type Story = StoryObj<typeof meta>;

export const WhiteShrimp: Story = {};
