import type { ComponentProps } from "react";
import type { Meta, StoryObj } from "@storybook/react-vite";
import { RecordTable } from "./RecordTable";
import { fixtureRows } from "../../storybook/fixtures";
const meta = {
  title: "Components/RecordTable",
  component: RecordTable,
  args: { resource: "recipes", rows: fixtureRows },
} satisfies Meta<typeof RecordTable>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { resource: "recipes", rows: fixtureRows } };
export const Default: Story = { args: {} };
const alternateArgs = { resource: "ingredients", rows: [] } satisfies ComponentProps<
  typeof RecordTable
>;
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-8">
      <RecordTable {...meta.args} />
      <RecordTable {...alternateArgs} />
    </div>
  ),
};
export const Empty: Story = { args: { resource: "ingredients", rows: [] } };
export const FilteredEmpty: Story = { args: { resource: "recipes", rows: [], filtered: true } };
export const Loading: Story = { args: { loading: true, rows: [], skeletonRows: 10 } };
export const Failed: Story = { args: { error: "暂时无法读取，请重试", rows: [] } };
