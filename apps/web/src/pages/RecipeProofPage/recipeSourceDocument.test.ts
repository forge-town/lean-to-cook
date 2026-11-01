import { describe, expect, it } from "vitest";

import { parseRecipeSourceDocument } from "./recipeSourceDocument";

describe("parseRecipeSourceDocument", () => {
  it("turns a HowToCook document into readable sections", () => {
    const document = parseRecipeSourceDocument(`# 示例菜的做法

这是一段介绍。

![成品](./result.jpg)

## 必备原料和工具

- 土豆
- **食用油**

## 操作

### 准备原料

1. 洗净土豆。
2. 切成小块。
3. ![过程图](./step.jpg)
`);

    expect(document.introduction).toEqual(["这是一段介绍。"]);
    expect(document.sections).toEqual([
      {
        heading: "必备原料和工具",
        lines: [
          { kind: "bullet", text: "土豆" },
          { kind: "bullet", text: "食用油" },
        ],
      },
      {
        heading: "操作",
        lines: [
          { kind: "subheading", text: "准备原料" },
          { kind: "step", text: "洗净土豆。" },
          { kind: "step", text: "切成小块。" },
          { kind: "image", text: "过程图" },
        ],
      },
    ]);
  });
});
