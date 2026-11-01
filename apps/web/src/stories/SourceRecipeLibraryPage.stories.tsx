import type { Meta, StoryObj } from "@storybook/react-vite";

import { SourceRecipeLibraryPage } from "@/pages/SourceRecipeLibraryPage";
import { storyModules } from "@/storybook/storyModuleCatalog";

const meta = {
  component: SourceRecipeLibraryPage,
  parameters: {
    docs: {
      description: {
        component:
          "HowToCook 固定版本的 373 道原始菜谱目录。用于理解源 Markdown 与结构证书之间的数据入口。",
      },
    },
    moduleInfo: storyModules.sourceLibrary,
  },
  title: "01 Pages/Source Recipe Library",
} satisfies Meta<typeof SourceRecipeLibraryPage>;

export default meta;

type Story = StoryObj<typeof meta>;

export const CompleteSourceCorpus: Story = {};
