import type { Meta, StoryObj } from "@storybook/react-vite";
import { PanFryingVessel } from "./PanFryingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: PanFryingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/PanFryingVessel",
  args: { scene: actionSceneAt("cola-chicken-wings", 3) },
} satisfies Meta<typeof PanFryingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("cola-chicken-wings", 3), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <PanFryingVessel scene={actionSceneAt("cola-chicken-wings", 3)} />
      <PanFryingVessel scene={actionSceneAt("butter-pan-fried-shrimp", 4)} />
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
