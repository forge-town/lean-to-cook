import type { Meta, StoryObj } from "@storybook/react-vite";
import { SimmeringVessel } from "./SimmeringVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: SimmeringVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/SimmeringVessel",
  args: { scene: actionSceneAt("cola-chicken-wings", 1) },
} satisfies Meta<typeof SimmeringVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("cola-chicken-wings", 1), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <SimmeringVessel scene={actionSceneAt("cola-chicken-wings", 1)} />
      <SimmeringVessel scene={actionSceneAt("corn-rib-soup", 5)} />
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
