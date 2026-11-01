import type { Meta, StoryObj } from "@storybook/react-vite";
import { markdown, sourceRecipe } from "../../sourceRecipeFixtures";
import { SourceRecipePageContent } from "./SourceRecipePageContent";
const meta = {
  component: SourceRecipePageContent,
  title: "01 Pages/Source Recipe",
  args: { markdown, sourceRecipe },
} satisfies Meta<typeof SourceRecipePageContent>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { markdown, sourceRecipe } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <>
      <SourceRecipePageContent markdown={markdown} sourceRecipe={sourceRecipe} />
      <SourceRecipePageContent
        markdown={"## 原料\n\n- 菜心\n\n## 操作\n\n1. 洗净。"}
        sourceRecipe={sourceRecipe}
      />
    </>
  ),
};
export const LongContent: Story = {
  args: { markdown: `${markdown}\n\n${"较长的烹饪说明。".repeat(80)}` },
};
