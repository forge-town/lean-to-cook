import type { Meta, StoryObj } from "@storybook/react-vite";
import { HotOilInfusion } from "./HotOilInfusion";
import { oilSceneAt } from "./hotOilFixtures";
const meta = {
  component: HotOilInfusion,
  title: "Pages/SourceRecipeWorkbenchPage/Components/HotOilInfusion",
  args: { scene: oilSceneAt(1) },
} satisfies Meta<typeof HotOilInfusion>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { scene: oilSceneAt(1), className: "bg-paper" } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-3">
      {[1, 2, 3].map((step) => (
        <HotOilInfusion key={step} scene={oilSceneAt(step)} />
      ))}
    </div>
  ),
};
export const Cooling: Story = { args: { scene: oilSceneAt(2) } };
export const Pouring: Story = { args: { scene: oilSceneAt(3) } };
export const Finished: Story = {
  args: { scene: oilSceneAt(4) },
  decorators: [
    (Story) => (
      <div className="mx-auto max-w-xs">
        <Story />
      </div>
    ),
  ],
};
