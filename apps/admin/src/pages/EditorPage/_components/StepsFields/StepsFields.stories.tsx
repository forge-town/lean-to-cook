import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { StepsFields } from "./StepsFields";
import { editorOptions } from "../../../../storybook/fixtures";
import { EditorPageStoreProvider } from "../../_store";
import { EditorStoryForm } from "../../../../storybook/EditorStoryForm";
const meta = {
  title: "Pages/EditorPage/Components/StepsFields",
  component: StepsFields,
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
} satisfies Meta<typeof StepsFields>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
const alternateArgs = {} satisfies ComponentProps<typeof StepsFields>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <StepsFields {...meta.args} />
      <StepsFields {...alternateArgs} />
    </div>
  ),
};
