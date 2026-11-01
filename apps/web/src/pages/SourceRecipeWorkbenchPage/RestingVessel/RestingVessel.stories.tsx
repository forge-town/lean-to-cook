import type { Meta, StoryObj } from "@storybook/react-vite";
import { RestingVessel } from "./RestingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: RestingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/RestingVessel",
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 7) },
} satisfies Meta<typeof RestingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 7), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <RestingVessel scene={actionSceneAt("tomato-scrambled-eggs", 7)} />
      <RestingVessel scene={actionSceneAt("three-fresh", 6)} />
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
