import type { Meta, StoryObj } from "@storybook/react-vite";
import { MixingVessel } from "./MixingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: MixingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/MixingVessel",
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 4) },
} satisfies Meta<typeof MixingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 4), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <MixingVessel scene={actionSceneAt("tomato-scrambled-eggs", 4)} />
      <MixingVessel scene={actionSceneAt("butter-pan-fried-shrimp", 2)} />
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
