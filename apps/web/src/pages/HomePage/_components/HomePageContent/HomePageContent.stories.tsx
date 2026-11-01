import type { Meta, StoryObj } from "@storybook/react-vite";
import { HomePageContent } from "./HomePageContent";

const meta = {
  component: HomePageContent,
  title: "Pages/HomePage/Components/HomePageContent",
} satisfies Meta<typeof HomePageContent>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Base: Story = { args: {} };
export const Default: Story = { args: {} };
export const BaseUsage: Story = { render: () => <HomePageContent /> };
