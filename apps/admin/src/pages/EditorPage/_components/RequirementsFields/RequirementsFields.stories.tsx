import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { RequirementsFields } from "./RequirementsFields";
import { editorOptions } from "../../../../storybook/fixtures";
import { EditorPageStoreProvider } from "../../_store";
import { EditorStoryForm } from "../../../../storybook/EditorStoryForm";
const meta = {
  title: "Pages/EditorPage/Components/RequirementsFields",
  component: RequirementsFields,
  args: {},
  decorators: [
    (Story) => (
      <EditorPageStoreProvider options={editorOptions}>
        <EditorStoryForm>
          <Story />
        </EditorStoryForm>
      </EditorPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof RequirementsFields>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
const alternateArgs = {} satisfies ComponentProps<typeof RequirementsFields>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <RequirementsFields {...meta.args} />
      <RequirementsFields {...alternateArgs} />
    </div>
  ),
};
