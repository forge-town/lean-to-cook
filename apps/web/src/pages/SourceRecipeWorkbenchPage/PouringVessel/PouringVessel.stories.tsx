import type { Meta, StoryObj } from "@storybook/react-vite";
import { PouringVessel } from "./PouringVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: PouringVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/PouringVessel",
  args: { scene: actionSceneAt("steamed-sea-bass", 7) },
} satisfies Meta<typeof PouringVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("steamed-sea-bass", 7), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <PouringVessel scene={actionSceneAt("steamed-sea-bass", 7)} />
      <PouringVessel scene={{ ...actionSceneAt("steamed-sea-bass", 9), activeIngredients: [] }} />
    </div>
  ),
};
export const NarrowFrame: Story = {
  decorators: [
    (Story) => (
      <div className="mx-auto max-w-xs">
        <Story />
      </div>
    ),
  ],
};
