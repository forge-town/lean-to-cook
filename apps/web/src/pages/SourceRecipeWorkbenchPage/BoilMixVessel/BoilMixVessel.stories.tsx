import type { Meta, StoryObj } from "@storybook/react-vite";
import { BoilMixVessel } from "./BoilMixVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: BoilMixVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/BoilMixVessel",
  args: { scene: actionSceneAt("zhajiang-noodles", 3) },
} satisfies Meta<typeof BoilMixVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("zhajiang-noodles", 3), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <BoilMixVessel scene={actionSceneAt("zhajiang-noodles", 3)} />
      <BoilMixVessel scene={{ ...actionSceneAt("zhajiang-noodles", 3), activeIngredients: [] }} />
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
