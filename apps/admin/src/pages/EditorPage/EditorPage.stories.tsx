import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { EditorPage } from "./EditorPage";
import { fixtureId } from "../../storybook/fixtures";
const meta = {
  title: "Pages/EditorPage/Components/EditorPage",
  component: EditorPage,
  args: { resource: "recipes", id: fixtureId },
} satisfies Meta<typeof EditorPage>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { resource: "recipes", id: fixtureId } };
export const Default: Story = { args: {} };
const alternateArgs = { resource: "ingredients", id: "new" } satisfies ComponentProps<
  typeof EditorPage
>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <EditorPage {...meta.args} />
      <EditorPage {...alternateArgs} />
    </div>
  ),
};
export const Alternate: Story = { args: { resource: "ingredients", id: "new" } };
