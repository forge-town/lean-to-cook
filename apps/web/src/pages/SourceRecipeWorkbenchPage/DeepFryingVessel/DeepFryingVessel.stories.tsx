import type { Meta, StoryObj } from "@storybook/react-vite";
import { DeepFryingVessel } from "./DeepFryingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: DeepFryingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/DeepFryingVessel",
  args: { scene: actionSceneAt("three-fresh", 5) },
} satisfies Meta<typeof DeepFryingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("three-fresh", 5), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <DeepFryingVessel scene={actionSceneAt("three-fresh", 5)} />
      <DeepFryingVessel scene={{ ...actionSceneAt("three-fresh", 7), activeIngredients: [] }} />
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
