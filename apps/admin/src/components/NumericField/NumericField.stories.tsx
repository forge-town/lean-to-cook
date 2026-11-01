import type { Meta, StoryObj } from "@storybook/react-vite";
import { NumericField } from "./NumericField";
import { EditorPageStoreProvider } from "../../pages/EditorPage/_store";
import { EditorStoryForm } from "../../storybook/EditorStoryForm";
import { editorOptions } from "../../storybook/fixtures";
const meta = {
  component: NumericField,
  title: "Components/NumericField",
  args: { name: "servings", label: "份数", mode: "integer" },
  decorators: [
    (Story) => (
      <EditorPageStoreProvider options={editorOptions}>
        <EditorStoryForm>
          <Story />
        </EditorStoryForm>
      </EditorPageStoreProvider>
    ),
  ],
} satisfies Meta<typeof NumericField>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Default: Story = { args: {} };
export const Decimal: Story = {
  args: { name: "requirements.0.amount", label: "明确数量", mode: "decimal" },
};
