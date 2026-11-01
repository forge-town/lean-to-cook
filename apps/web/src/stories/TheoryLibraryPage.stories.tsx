import type { Meta, StoryObj } from "@storybook/react-vite";

import { TheoryLibraryPage } from "@/pages/TheoryLibraryPage";
import { storyModules } from "@/storybook/storyModuleCatalog";

const meta = {
  component: TheoryLibraryPage,
  parameters: {
    docs: {
      description: {
        component: "18 条厨房基础理论的交互阅读器，对应 KitchenTheory.lean 与 AppliedTheory.lean。",
      },
    },
    moduleInfo: storyModules.theoryLibrary,
  },
  title: "01 Pages/Theory Library",
} satisfies Meta<typeof TheoryLibraryPage>;

export default meta;

type Story = StoryObj<typeof meta>;

export const InteractiveTheoryReader: Story = {};
