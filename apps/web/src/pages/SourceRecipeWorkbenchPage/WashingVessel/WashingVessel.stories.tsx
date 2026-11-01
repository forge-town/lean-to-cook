import type { Meta, StoryObj } from "@storybook/react-vite";
import { WashingVessel } from "./WashingVessel";
import { washingSceneFor } from "./washingFixtures";
const meta = {
  component: WashingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/WashingVessel",
  args: { scene: washingSceneFor() },
} satisfies Meta<typeof WashingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { scene: washingSceneFor(), className: "bg-paper" } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-6 lg:grid-cols-2">
      <WashingVessel scene={washingSceneFor()} />
      <WashingVessel scene={washingSceneFor("tomato-scrambled-eggs")} />
    </div>
  ),
};
export const Tomato: Story = { args: { scene: washingSceneFor("tomato-scrambled-eggs") } };
export const NarrowFrame: Story = {
  decorators: [
    (Story) => (
      <div className="mx-auto max-w-xs">
        <Story />
      </div>
    ),
  ],
};
