import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { EditorPageStoreProvider } from "./EditorPageStoreProvider";
import { editorOptions } from "../../../../storybook/fixtures";
const meta = {
  title: "Pages/EditorPage/Components/EditorPageStoreProvider",
  component: EditorPageStoreProvider,
  args: { options: editorOptions, children: "菜谱编辑状态" },
} satisfies Meta<typeof EditorPageStoreProvider>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { options: editorOptions, children: "菜谱编辑状态" } };
export const Default: Story = { args: {} };
const alternateArgs = { options: editorOptions, children: "菜谱编辑状态" } satisfies ComponentProps<
  typeof EditorPageStoreProvider
>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <EditorPageStoreProvider {...meta.args} />
      <EditorPageStoreProvider {...alternateArgs} />
    </div>
  ),
};
