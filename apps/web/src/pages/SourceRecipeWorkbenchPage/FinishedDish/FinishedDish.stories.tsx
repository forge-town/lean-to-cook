import type { Meta, StoryObj } from "@storybook/react-vite";
import { FinishedDish } from "./FinishedDish";
import { potatoSceneAt } from "../sceneFixtures";
const scene = potatoSceneAt(6);
const meta = {
  component: FinishedDish,
  title: "Pages/SourceRecipeWorkbenchPage/Components/FinishedDish",
  args: { scene },
} satisfies Meta<typeof FinishedDish>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { scene } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid md:grid-cols-2">
      <FinishedDish scene={scene} />
      <FinishedDish
        scene={{ ...scene, recipeTitle: "奶茶", dishForm: "cup", allIngredients: [] }}
      />
    </div>
  ),
};
export const Bowl: Story = {
  args: { scene: { ...scene, dishForm: "bowl", recipeTitle: "土豆汤" } },
};
