import type { Meta, StoryObj } from "@storybook/react-vite";
import { ChillingVessel } from "./ChillingVessel";
import { actionSceneAt } from "../actionSceneFixtures";
const meta = {
  component: ChillingVessel,
  title: "Pages/SourceRecipeWorkbenchPage/Components/ChillingVessel",
  args: { scene: actionSceneAt("coffee-coconut-jelly", 3) },
} satisfies Meta<typeof ChillingVessel>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { scene: actionSceneAt("coffee-coconut-jelly", 3), className: "bg-paper" },
};
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-4 lg:grid-cols-2">
      <ChillingVessel scene={actionSceneAt("coffee-coconut-jelly", 3)} />
      <ChillingVessel
        scene={{ ...actionSceneAt("coffee-coconut-jelly", 3), activeIngredients: [] }}
      />
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
