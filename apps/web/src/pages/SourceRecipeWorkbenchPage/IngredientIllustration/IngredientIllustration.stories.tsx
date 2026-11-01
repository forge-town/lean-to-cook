import type { Meta, StoryObj } from "@storybook/react-vite";

import { IngredientIllustration } from "./IngredientIllustration";
import { storyModules } from "@/storybook/storyModuleCatalog";

const meta = {
  args: {
    compact: false,
    ingredient: {
      kind: "shrimp",
      name: "鲜虾",
      state: "raw",
    },
  },
  component: IngredientIllustration,
  decorators: [
    (Story) => (
      <div className="flex justify-center bg-surface p-8">
        <Story />
      </div>
    ),
  ],
  parameters: {
    docs: {
      description: {
        component:
          "食材视觉原子组件。通过 ingredient.kind 切换食材形态，通过 state 切换原始、切配、受热和熟成状态。",
      },
    },
    moduleInfo: storyModules.ingredientVisual,
  },
  title: "Pages/SourceRecipeWorkbenchPage/Components/IngredientIllustration",
} satisfies Meta<typeof IngredientIllustration>;

export default meta;

type Story = StoryObj<typeof meta>;

export const Base: Story = {
  args: { compact: false, ingredient: { kind: "shrimp", name: "鲜虾", state: "raw" } },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="flex gap-6 p-6">
      <IngredientIllustration ingredient={{ kind: "tomato", name: "西红柿", state: "raw" }} />
      <IngredientIllustration ingredient={{ kind: "tomato", name: "西红柿", state: "prepped" }} />
      <IngredientIllustration
        compact
        ingredient={{ kind: "tomato", name: "西红柿", state: "cooking" }}
      />
    </div>
  ),
};

export const PreppedTomato: Story = {
  args: {
    ingredient: {
      kind: "tomato",
      name: "西红柿",
      state: "prepped",
    },
  },
};

export const CookingBeef: Story = {
  args: {
    ingredient: {
      kind: "meat",
      name: "牛肉",
      state: "cooking",
    },
  },
};

export const CookedFish: Story = {
  args: {
    ingredient: {
      kind: "fish",
      name: "鲈鱼",
      state: "cooked",
    },
  },
};
