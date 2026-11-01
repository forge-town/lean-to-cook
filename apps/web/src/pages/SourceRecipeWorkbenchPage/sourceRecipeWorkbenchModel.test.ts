import { describe, expect, it } from "vitest";

import {
  buildSourceRecipeWorkbenchModel,
  getSourceRecipeStepLabel,
} from "./sourceRecipeWorkbenchModel";

describe("buildSourceRecipeWorkbenchModel", () => {
  it("uses the same ingredient and numbered-step contract as the Lean generator", () => {
    const model = buildSourceRecipeWorkbenchModel(`# 示例

## 必备原料和工具

说明文字不会进入原料表。
- 土豆
- 油

## 操作

### 处理
1. 洗净土豆。
2. ![过程图](./step.jpg)
3. 切块后炒熟。
`);

    expect(model.ingredients).toEqual(["土豆", "油"]);
    expect(model.steps).toEqual([
      {
        id: "source-step-01",
        instruction: "洗净土豆。",
        phase: "处理",
        sequence: 1,
      },
      {
        id: "source-step-02",
        instruction: "切块后炒熟。",
        phase: "处理",
        sequence: 2,
      },
    ]);
  });
});

it("uses the first meaningful instruction clause without inventing or duplicating phase titles", () => {
  expect(getSourceRecipeStepLabel("土豆去皮，切均匀的小块。放入淀粉搅拌")).toBe("土豆去皮");
  expect(getSourceRecipeStepLabel("取出土豆，放入大碗备用")).toBe("取出土豆");
  expect(getSourceRecipeStepLabel("  ，洗净菠菜。焯熟")).toBe("洗净菠菜");
  expect(getSourceRecipeStepLabel("保留整条没有标点的步骤")).toBe("保留整条没有标点的步骤");
  expect(getSourceRecipeStepLabel("")).toBe("操作");
});
