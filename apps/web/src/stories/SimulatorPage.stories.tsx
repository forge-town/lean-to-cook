import { steamedSeaBass } from "@repo/schemas";
import type { Meta, StoryObj } from "@storybook/react-vite";

import { SimulatorPage } from "@/pages/SimulatorPage";
import { storyModules } from "@/storybook/storyModuleCatalog";

const meta = {
  args: { recipe: steamedSeaBass },
  component: SimulatorPage,
  parameters: {
    docs: {
      description: {
        component:
          "COD-377：由深度菜谱中的 requires、effects 与已验证定理驱动的可执行、可阻断、可回退模拟器。",
      },
    },
    moduleInfo: storyModules.simulator,
  },
  title: "02 Workbenches/Theorem-driven Simulator",
} satisfies Meta<typeof SimulatorPage>;

export default meta;

type Story = StoryObj<typeof meta>;

export const SteamedSeaBassSession: Story = {};
