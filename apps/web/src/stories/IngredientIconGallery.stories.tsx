import type { Meta, StoryObj } from "@storybook/react-vite";

import { IngredientIconGallery } from "@/storybook/IngredientIconGallery";
import { storyModules } from "@/storybook/storyModuleCatalog";

const meta = {
  component: IngredientIconGallery,
  parameters: {
    docs: {
      description: {
        component:
          "本地 Fluent Emoji Flat 食材资产总览，并对比同一食材在 raw、prepped、cooking、cooked 四个阶段的表现。",
      },
    },
    moduleInfo: storyModules.ingredientVisual,
  },
  title: "03 Visual Engine/Ingredient Icon Catalog",
} satisfies Meta<typeof IngredientIconGallery>;

export default meta;

type Story = StoryObj<typeof meta>;

export const FullCatalog: Story = {};
