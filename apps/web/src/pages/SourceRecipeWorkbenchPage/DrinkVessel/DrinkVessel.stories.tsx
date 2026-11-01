import type { Meta, StoryObj } from "@storybook/react-vite";
import { DrinkVessel } from "./DrinkVessel";
import { lemonSceneAt } from "./drinkVesselFixtures";
const meta = {
  component: DrinkVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/DrinkVessel",
  args: { scene: lemonSceneAt(1) },
} satisfies Meta<typeof DrinkVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { scene: lemonSceneAt(1) } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-5 md:grid-cols-3">
      {[1, 2, 3].map((step) => (
        <DrinkVessel key={step} scene={lemonSceneAt(step)} />
      ))}
    </div>
  ),
};
export const Muddling: Story = { args: { scene: lemonSceneAt(2) } };
export const Ready: Story = { args: { scene: lemonSceneAt(4) } };
export const NarrowFrame: Story = {
  args: { scene: lemonSceneAt(3) },
  decorators: [
    (Story) => (
      <div className="mx-auto max-w-xs">
        <Story />
      </div>
    ),
  ],
};
