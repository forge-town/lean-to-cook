// @vitest-environment jsdom
import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import { afterEach, expect, it, vi } from "vitest";
import { recipeCatalog } from "@repo/schemas";
import { AppShell } from "@/components/AppShell";
import { StorybookRouter } from "@/storybook/StorybookRouter";
import { SimulatorPage } from "./SimulatorPage";
afterEach(() => {
  cleanup();
  vi.unstubAllGlobals();
});
it("keeps chili powder in a heatproof bowl and pours oil off the heat", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const recipe = recipeCatalog.find((item) => item.id === "chili-oil")!;
  render(
    <StorybookRouter>
      <AppShell>
        <SimulatorPage recipe={recipe} />
      </AppShell>
    </StorybookRouter>
  );
  await screen.findByTestId("kitchen-scene");
  expect(screen.getByText("花椒：20–50粒", { exact: true })).toBeTruthy();
  expect(screen.getByText("五香粉：10g（可选）", { exact: true })).toBeTruthy();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(screen.getByTestId("oil-bowl")).toBeTruthy();
  expect(screen.getAllByTestId("ingredient-powder").length).toBeGreaterThan(0);
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  expect(screen.queryByTestId("oil-stream")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(screen.getByTestId("oil-pan")).toBeTruthy();
  expect(screen.getByTestId("oil-cooling")).toBeTruthy();
  expect(screen.getByTestId("oil-cooling").textContent).toContain("210°C");
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(screen.getByTestId("oil-stream")).toBeTruthy();
  expect(screen.getByTestId("oil-bubbles")).toBeTruthy();
  expect(screen.getByText("heat.off", { exact: true })).toBeTruthy();
  expect(screen.queryByText("heat.on", { exact: true })).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(screen.getByTestId("oil-finished")).toBeTruthy();
  expect(screen.queryByTestId("oil-stream")).toBeNull();
  expect(screen.queryByTestId("oil-pan")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: /第 03 步/ }));
  expect(screen.getByTestId("oil-stream")).toBeTruthy();
  expect(screen.queryByTestId("block-reason")).toBeNull();
});
it("maps milk tea action labels to preparation, brewing and mixing without stove heat", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const recipe = recipeCatalog.find((item) => item.id === "milk-tea")!;
  render(
    <StorybookRouter>
      <AppShell>
        <SimulatorPage recipe={recipe} />
      </AppShell>
    </StorybookRouter>
  );
  const scene = await screen.findByTestId("kitchen-scene");
  expect(screen.getByRole("button", { name: /第 01 步：放入茶包，备好沸水/ })).toBeTruthy();
  expect(screen.getByRole("button", { name: /第 02 步：注水焖泡 20–30 分钟/ })).toBeTruthy();
  expect(screen.getByRole("button", { name: /第 03 步：加奶加糖，搅拌均匀/ })).toBeTruthy();
  expect(screen.getByRole("button", { name: /第 04 步：装杯/ })).toBeTruthy();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(scene.dataset.method).toBe("cupAdd");
  expect(screen.queryByTestId("drink-liquid")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(scene.dataset.method).toBe("brew");
  expect(screen.getByTestId("drink-steam")).toBeTruthy();
  expect(screen.getByTestId("drink-liquid").dataset.liquid).toBe("tea");
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(scene.dataset.method).toBe("mix");
  expect(screen.getByTestId("drink-liquid").dataset.liquid).toBe("milk");
  expect(screen.getByTestId("drink-spoon")).toBeTruthy();
  fireEvent.click(screen.getByRole("button", { name: /第 02 步：注水焖泡/ }));
  expect(scene.dataset.method).toBe("brew");
  expect(screen.getByTestId("drink-liquid").dataset.liquid).toBe("tea");
  expect(screen.queryByTestId("block-reason")).toBeNull();
});
it("keeps rejected actions out of the rendered cooking scene and resets accepted progress", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const recipe = recipeCatalog.find((r) => r.id === "tomato-scrambled-eggs")!;
  render(
    <StorybookRouter>
      <AppShell>
        <SimulatorPage recipe={recipe} />
      </AppShell>
    </StorybookRouter>
  );
  const scene = await screen.findByTestId("kitchen-scene");
  fireEvent.click(screen.getByRole("button", { name: /执行第 03 步/ }));
  expect(screen.getByTestId("block-reason")).toBeTruthy();
  expect(scene.dataset.step).toBe("0");
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(scene.dataset.step).toBe("1");
  fireEvent.click(screen.getByRole("button", { name: "重置" }));
  expect(scene.dataset.step).toBe("0");
});
it("loads lemon slices into a cup, muddles, fills and keeps the finished drink in its cup", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const recipe = recipeCatalog.find((r) => r.id === "lemon-water")!;
  render(
    <StorybookRouter>
      <AppShell>
        <SimulatorPage recipe={recipe} />
      </AppShell>
    </StorybookRouter>
  );
  const scene = await screen.findByTestId("kitchen-scene");
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(scene.dataset.method).toBe("cupAdd");
  expect(screen.getByTestId("drink-vessel")).toBeTruthy();
  expect(screen.getAllByTestId("drink-slice").length).toBeGreaterThan(0);
  expect(screen.queryByTestId("cooking-knife")).toBeNull();
  expect(screen.queryByTestId("drink-liquid")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(screen.getByTestId("drink-muddler")).toBeTruthy();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(screen.getByTestId("drink-liquid")).toBeTruthy();
  expect(screen.getByTestId("drink-spoon")).toBeTruthy();
  expect(screen.queryByTestId("cooking-heat")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: "下一步" }));
  expect(screen.getByTestId("drink-vessel")).toBeTruthy();
  expect(screen.queryByTestId("drink-spoon")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: "上一步" }));
  fireEvent.click(screen.getByRole("button", { name: "上一步" }));
  expect(scene.dataset.method).toBe("muddle");
  expect(Number(screen.getByTestId("drink-vessel").dataset.fill)).toBeLessThan(0.5);
  fireEvent.click(screen.getByRole("button", { name: "重置" }));
  expect(scene.dataset.step).toBe("0");
  expect(screen.queryByTestId("drink-vessel")).toBeNull();
});
it("allows selecting completed steps during animation without treating review as a new execution", async () => {
  vi.stubGlobal("scrollTo", vi.fn());
  const recipe = recipeCatalog.find((r) => r.id === "lemon-water")!;
  render(
    <StorybookRouter>
      <AppShell>
        <SimulatorPage recipe={recipe} />
      </AppShell>
    </StorybookRouter>
  );
  const scene = await screen.findByTestId("kitchen-scene");
  [0, 1, 2].forEach(() => fireEvent.click(screen.getByRole("button", { name: "下一步" })));
  fireEvent.click(screen.getByRole("button", { name: /第 01 步：洗净切片，放入杯中/ }));
  expect(scene.dataset.step).toBe("1");
  expect(scene.dataset.method).toBe("cupAdd");
  expect(screen.queryByTestId("block-reason")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: /第 03 步：加糖浆和水，搅拌均匀/ }));
  expect(scene.dataset.step).toBe("3");
  fireEvent.click(screen.getByRole("button", { name: /第 03 步：加糖浆和水，搅拌均匀/ }));
  expect(scene.dataset.step).toBe("3");
  expect(screen.queryByTestId("block-reason")).toBeNull();
  fireEvent.click(screen.getByRole("button", { name: /第 01 步：洗净切片，放入杯中/ }));
  fireEvent.click(screen.getByRole("button", { name: /第 04 步：装杯/ }));
  expect(scene.dataset.step).toBe("4");
  expect(screen.queryByTestId("block-reason")).toBeNull();
});
