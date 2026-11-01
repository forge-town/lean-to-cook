import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { ChoiceField } from "./ChoiceField";
import { editorOptions } from "../../storybook/fixtures";
import { EditorPageStoreProvider } from "../../pages/EditorPage/_store";
import { EditorStoryForm } from "../../storybook/EditorStoryForm";
const meta = {
  title: "Components/ChoiceField",
  component: ChoiceField,
  args: {
    label: "度量类型",
    name: "dimension",
    disabled: false,
    options: [
      { value: "other", label: "其他" },
      { value: "mass", label: "质量" },
    ],
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
} satisfies Meta<typeof ChoiceField>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: {
    label: "度量类型",
    name: "dimension",
    disabled: false,
    options: [
      { value: "other", label: "其他" },
      { value: "mass", label: "质量" },
    ],
  },
};
export const Default: Story = { args: {} };
const alternateArgs = { ...meta.args, disabled: true } satisfies ComponentProps<typeof ChoiceField>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <ChoiceField {...meta.args} />
      <ChoiceField {...alternateArgs} />
    </div>
  ),
};
export const Disabled: Story = { args: { ...meta.args, disabled: true } };
