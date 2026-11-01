import type { Meta, StoryObj } from "@storybook/react-vite";
import { HomePage } from "./HomePage";
const meta = { component: HomePage, title: "01 Pages/Home" } satisfies Meta<typeof HomePage>;
export default meta;
type Story = StoryObj<typeof meta>;
export const Default: Story = { args: {} };
