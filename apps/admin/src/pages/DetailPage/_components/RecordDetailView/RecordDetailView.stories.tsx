import type { Meta, StoryObj } from "@storybook/react-vite";
import { Refine } from "@refinedev/core";
import { RecordDetailView } from "./RecordDetailView";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import {
  fixtureProvider,
  fixtureRecipe,
  fixtureAuth,
  editorOptions,
  detailFor,
} from "../../../../storybook/fixtures";
const meta = {
  title: "Pages/DetailPage/Components/RecordDetailView",
  component: RecordDetailView,
  args: { record: fixtureRecipe, checking: false },
  decorators: [
    (Story, context) => (
      <Refine authProvider={fixtureAuth} dataProvider={fixtureProvider}>
        <EditorPageStoreProvider
          options={{
            ...editorOptions,
            resource: context.args.record.resource,
            record: context.args.record,
          }}
        >
          <Story />
        </EditorPageStoreProvider>
      </Refine>
    ),
  ],
} satisfies Meta<typeof RecordDetailView>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Ingredient: Story = { args: { record: detailFor("ingredients") } };
export const Loading: Story = { args: { checking: true } };

export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <>
      <EditorPageStoreProvider options={editorOptions}>
        <RecordDetailView record={fixtureRecipe} />
      </EditorPageStoreProvider>
      <EditorPageStoreProvider
        options={{ ...editorOptions, resource: "ingredients", record: detailFor("ingredients") }}
      >
        <RecordDetailView record={detailFor("ingredients")} />
      </EditorPageStoreProvider>
    </>
  ),
};

export const LongContent: Story = {
  args: {
    record: {
      ...fixtureRecipe,
      values: {
        ...fixtureRecipe.values,
        title: "番茄炒蛋：从准备食材到掌握火候，再到调味与装盘的完整家常做法",
      },
    },
  },
};
