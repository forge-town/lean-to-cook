import type { Meta, StoryObj } from "@storybook/react-vite";
import { DetailPageContent } from "./DetailPageContent";
import { EditorPageStoreProvider } from "../../../EditorPage/_store";
import { editorOptions, fixtureRecipe, detailFor } from "../../../../storybook/fixtures";
const meta = {
  title: "Pages/DetailPage/Components/DetailPageContent",
  component: DetailPageContent,
  args: { record: fixtureRecipe },
  decorators: [
    (Story, context) => (
      <EditorPageStoreProvider options={{ ...editorOptions, record: context.args.record }}>
        <Story />
      </EditorPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof DetailPageContent>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: { ...meta.args } };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="grid gap-12">
      <EditorPageStoreProvider options={editorOptions}>
        <DetailPageContent record={fixtureRecipe} />
      </EditorPageStoreProvider>
      <EditorPageStoreProvider
        options={{ ...editorOptions, record: detailFor("units"), resource: "units" }}
      >
        <DetailPageContent record={detailFor("units")} />
      </EditorPageStoreProvider>
    </div>
  ),
};
export const Ingredient: Story = { args: { record: detailFor("ingredients") } };
export const Published: Story = {
  args: { record: { ...fixtureRecipe, publication: "published" } },
};
