import type { Meta, StoryObj } from "@storybook/react-vite";
import { SourceRecipeLibraryPageContent } from "./SourceRecipeLibraryPageContent";
const meta = {
  title: "Pages/SourceRecipeLibraryPage/Components/SourceRecipeLibraryPageContent",
  component: SourceRecipeLibraryPageContent,
} satisfies Meta<typeof SourceRecipeLibraryPageContent>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
export const BaseUsage: Story = { render: () => <SourceRecipeLibraryPageContent /> };
