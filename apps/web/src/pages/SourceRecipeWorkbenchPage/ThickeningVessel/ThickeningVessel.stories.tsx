import type { Meta, StoryObj } from "@storybook/react-vite";
import { ThickeningVessel } from "./ThickeningVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: ThickeningVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/ThickeningVessel",
  args: { scene: actionSceneAt("three-fresh", 10) },
} satisfies Meta<typeof ThickeningVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("three-fresh", 10), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <ThickeningVessel scene={actionSceneAt("three-fresh", 10)} />
      <ThickeningVessel scene={{ ...actionSceneAt("three-fresh", 10), activeIngredients: [] }} />
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
