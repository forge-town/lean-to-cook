import type { Meta, StoryObj } from "@storybook/react-vite";
import { IngredientImageField } from "./IngredientImageField";
import { EditorPageStoreProvider } from "../../pages/EditorPage/_store";
import { EditorPageContent } from "../../pages/EditorPage/_components/EditorPageContent";
import { editorOptions, detailFor } from "../../storybook/fixtures";
const meta = {
  title: "Components/IngredientImageField",
  component: IngredientImageField,
  // The field shares the real editor's form sandbox and scoped store.
  render: () => (
    <EditorPageStoreProvider
      options={{ ...editorOptions, resource: "ingredients", record: detailFor("ingredients") }}
    >
      <EditorPageContent resource="ingredients" inDrawer />
    </EditorPageStoreProvider>
  ),
} satisfies Meta<typeof IngredientImageField>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
export const BaseUsage: Story = {
  render: () => (
    <div className="field-grid">
      <EditorPageStoreProvider
        options={{ ...editorOptions, resource: "ingredients", record: detailFor("ingredients") }}
      >
        <EditorPageContent resource="ingredients" inDrawer />
      </EditorPageStoreProvider>
      <EditorPageStoreProvider options={{ ...editorOptions, resource: "ingredients" }}>
        <EditorPageContent resource="ingredients" />
      </EditorPageStoreProvider>
    </div>
  ),
};
