import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { ReferenceField } from "./ReferenceField";
import { editorOptions } from "../../storybook/fixtures";
import { EditorPageStoreProvider } from "../../pages/EditorPage/_store";
import { EditorStoryForm } from "../../storybook/EditorStoryForm";
const meta = {
  title: "Components/ReferenceField",
  component: ReferenceField,
  args: { label: "分类", name: "categoryId", resource: "recipe-categories" },
  decorators: [
    (Story) => (
      <EditorPageStoreProvider options={editorOptions}>
        <EditorStoryForm>
          <Story />
        </EditorStoryForm>
      </EditorPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof ReferenceField>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = {
  args: { label: "分类", name: "categoryId", resource: "recipe-categories" },
};
export const Default: Story = { args: {} };
const alternateArgs = {
  label: "分类",
  name: "categoryId",
  resource: "recipe-categories",
} satisfies ComponentProps<typeof ReferenceField>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <ReferenceField {...meta.args} />
      <ReferenceField {...alternateArgs} />
    </div>
  ),
};
