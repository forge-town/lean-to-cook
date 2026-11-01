import type { Meta, StoryObj } from "@storybook/react-vite";
import { KitchenScene } from "./KitchenScene";
import { potatoSceneModel } from "../sceneFixtures";
const meta = {
  component: KitchenScene,
  title: "Pages/SourceRecipeWorkbenchPage/Components/KitchenScene",
  args: {
    category: "vegetable",
    currentStepIndex: 0,
    model: potatoSceneModel,
    recipeTitle: "拔丝土豆",
  },
  argTypes: {
    currentStepIndex: {
      control: { type: "range", min: 0, max: potatoSceneModel.steps.length, step: 1 },
    },
  },
} satisfies Meta<typeof KitchenScene>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { currentStepIndex: 2 } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: (props) => (
    <div className="grid gap-5 p-5 xl:grid-cols-3">
      {[0, 2, 6].map((step) => (
        <KitchenScene key={step} {...props} currentStepIndex={step} />
      ))}
    </div>
  ),
};
export const Caramel: Story = { args: { currentStepIndex: 4 } };
export const NarrowFrame: Story = {
  decorators: [
    (Story) => (
      <div className="mx-auto max-w-sm">
        <Story />
      </div>
    ),
  ],
  args: { currentStepIndex: 2 },
};
export const Holding: Story = { args: { currentStepIndex: 3 } };
