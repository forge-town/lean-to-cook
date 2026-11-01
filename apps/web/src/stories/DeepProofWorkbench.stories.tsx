import type { Meta, StoryObj } from "@storybook/react-vite";
import { tomatoScrambledEggs } from "@repo/schemas";

import tomatoEggMarkdown from "../../../../content/how-to-cook/dishes/vegetable_dish/西红柿炒鸡蛋.md?raw";
import { RecipeProofPage } from "@/pages/RecipeProofPage";
import { getSourceRecipeForRecipe } from "@/sourceRecipePresentation";
import { storyModules } from "@/storybook/storyModuleCatalog";

const meta = {
  args: {
    markdown: tomatoEggMarkdown,
    recipe: tomatoScrambledEggs,
    sourceRecipe: getSourceRecipeForRecipe(tomatoScrambledEggs),
  },
  component: RecipeProofPage,
  parameters: {
    docs: {
      description: {
        component:
          "Lean 深度证明工作台 Story。它展示离散厨房状态机、逐步归约、定理检查器和原始 Lean 源码。",
      },
    },
    moduleInfo: storyModules.deepWorkbench,
  },
  title: "02 Workbenches/Lean Deep Proof Workbench",
} satisfies Meta<typeof RecipeProofPage>;

export default meta;

type Story = StoryObj<typeof meta>;

export const TomatoScrambledEggs: Story = {};
