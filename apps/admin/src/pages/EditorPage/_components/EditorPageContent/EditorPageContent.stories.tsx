import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { EditorPageContent } from "./EditorPageContent";
import { fixtureRecipe, editorOptions } from "../../../../storybook/fixtures";
import { EditorPageStoreProvider } from "../../_store";
import { EditorStoryForm } from "../../../../storybook/EditorStoryForm";
const meta = {
  title: "Pages/EditorPage/Components/EditorPageContent",
  component: EditorPageContent,
  args: { resource: "recipes", record: fixtureRecipe, mutationPending: false },
  decorators: [
    (Story) => (
      <EditorPageStoreProvider options={editorOptions}>
        <EditorStoryForm>
          <Story />
        </EditorStoryForm>
      </EditorPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof EditorPageContent>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { resource: "recipes", record: fixtureRecipe, mutationPending: false },
};
export const Default: Story = { args: {} };
const alternateArgs = { ...meta.args, mutationPending: true } satisfies ComponentProps<
  typeof EditorPageContent
>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <EditorPageContent {...meta.args} />
      <EditorPageContent {...alternateArgs} />
    </div>
  ),
};
export const Loading: Story = { args: { ...meta.args, mutationPending: true } };
