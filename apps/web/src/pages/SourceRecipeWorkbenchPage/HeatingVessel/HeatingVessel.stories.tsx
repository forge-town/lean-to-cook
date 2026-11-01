import type { Meta, StoryObj } from "@storybook/react-vite";
import { HeatingVessel } from "./HeatingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: HeatingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/HeatingVessel",
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 5) },
} satisfies Meta<typeof HeatingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("tomato-scrambled-eggs", 5), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <HeatingVessel scene={actionSceneAt("tomato-scrambled-eggs", 5)} />
      <HeatingVessel scene={actionSceneAt("butter-pan-fried-shrimp", 3)} />
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
