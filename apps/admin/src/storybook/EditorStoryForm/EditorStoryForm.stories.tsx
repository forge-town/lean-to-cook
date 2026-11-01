import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { EditorStoryForm } from "./EditorStoryForm";
import { editorOptions } from "../fixtures";
import { EditorPageStoreProvider } from "../../pages/EditorPage/_store";
const meta = {
  title: "Components/EditorStoryForm",
  component: EditorStoryForm,
  args: { children: "表单字段" },
  decorators: [
    (Story) => (
      <EditorPageStoreProvider options={editorOptions}>
        <EditorStoryForm>
          <Story />
        </EditorStoryForm>
      </EditorPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof EditorStoryForm>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { children: "表单字段" } };
export const Default: Story = { args: {} };
const alternateArgs = { children: "表单字段" } satisfies ComponentProps<typeof EditorStoryForm>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <EditorStoryForm {...meta.args} />
      <EditorStoryForm {...alternateArgs} />
    </div>
  ),
};
