import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { TextField } from "./TextField";
import { editorOptions } from "../../storybook/fixtures";
import { EditorPageStoreProvider } from "../../pages/EditorPage/_store";
import { EditorStoryForm } from "../../storybook/EditorStoryForm";
const meta = {
  title: "Components/TextField",
  component: TextField,
  args: {
    label: "菜谱名称",
    name: "title",
    multiline: false,
    disabled: false,
    placeholder: "如：番茄炒蛋",
  },
  decorators: [
    (Story) => (
      <EditorPageStoreProvider options={editorOptions}>
        <EditorStoryForm>
          <Story />
        </EditorStoryForm>
      </EditorPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof TextField>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: {
    label: "菜谱名称",
    name: "title",
    multiline: false,
    disabled: false,
    placeholder: "如：番茄炒蛋",
  },
};
export const Default: Story = { args: {} };
const alternateArgs = { ...meta.args, disabled: true } satisfies ComponentProps<typeof TextField>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <TextField {...meta.args} />
      <TextField {...alternateArgs} />
    </div>
  ),
};
export const Disabled: Story = { args: { ...meta.args, disabled: true } };
