import type { Meta, StoryObj } from "@storybook/react-vite";

import { RecipeLibraryPage } from "@/pages/RecipeLibraryPage";
import { storyModules } from "@/storybook/storyModuleCatalog";

const meta = {
  component: RecipeLibraryPage,
  parameters: {
    docs: {
      description: {
        component:
          "产品首页的完整 Story。它把 373 份结构证书、20 份深度证明、理论应用和跨菜谱推论汇总到同一目录。",
      },
    },
    moduleInfo: storyModules.recipeLibrary,
  },
  title: "01 Pages/Recipe Library",
} satisfies Meta<typeof RecipeLibraryPage>;

export default meta;

type Story = StoryObj<typeof meta>;

export const CompleteCatalog: Story = {};
