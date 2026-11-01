/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 葱油拌面 · dishes/staple/葱油拌面.md -/
def recipe_6aa1fa07f6c9 : Recipe := {
  id := "6aa1fa07f6c9"
  title := "葱油拌面"
  category := "staple"
  sourcePath := "dishes/staple/葱油拌面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "干面条",
    "小葱",
    "生抽",
    "老抽",
    "白糖"
  ]
  steps := [
    { index := 1, instruction := "将 小葱 洗净，切成长段（约 5-7 cm）。葱白和葱绿可以分开。" },
    { index := 2, instruction := "锅中加入 100 ml 食用油，中火烧热。先放入葱白段，煸炒至微黄。" },
    { index := 3, instruction := "加入葱绿段，转小火，继续煸炒。" },
    { index := 4, instruction := "保持小火，耐心煸炒约 15-20 分钟，直至葱段变得焦黄酥脆。" },
    { index := 5, instruction := "将焦黄的葱段捞出（葱油保留在锅中）。" },
    { index := 6, instruction := "在锅中的葱油中，加入 60 ml 生抽，20 ml 老抽，15 g 白糖。小火加热并搅拌，约 1 分钟，至糖溶解，酱汁混合均匀。立即关火。将制作好的葱油酱汁倒入容器中，放凉后密封保存。" },
    { index := 7, instruction := "取 80 g 干面条。" },
    { index := 8, instruction := "锅中加入 1000 ml 饮用水，大火烧开。" },
    { index := 9, instruction := "放入 面条，根据面条包装说明，煮至熟透（通常 3-8 分钟，以包装说明为准）。" },
    { index := 10, instruction := "将 煮好的 面条 捞出，沥干水分，放入碗中。" },
    { index := 11, instruction := "在装有 面条 的碗中，加入 15 ml 之前做好的 葱油酱汁。" },
    { index := 12, instruction := "可以加入之前炸好的葱段（可选）。" },
    { index := 13, instruction := "用 筷子 快速搅拌均匀，即可食用。" }
  ]
}

theorem recipe_6aa1fa07f6c9_ingredients_nonempty :
    recipe_6aa1fa07f6c9.ingredients.isEmpty = false := by decide

theorem recipe_6aa1fa07f6c9_steps_nonempty :
    recipe_6aa1fa07f6c9.steps.isEmpty = false := by decide

theorem recipe_6aa1fa07f6c9_step_count :
    recipe_6aa1fa07f6c9.steps.length = 13 := by decide

theorem recipe_6aa1fa07f6c9_steps_ordered :
    orderedFrom 1 recipe_6aa1fa07f6c9.steps = true := by decide

theorem recipe_6aa1fa07f6c9_executes_to_terminal :
    executesToTerminal recipe_6aa1fa07f6c9 = true := by decide

theorem recipe_6aa1fa07f6c9_kernel_certificate :
    kernelCertified recipe_6aa1fa07f6c9 = true := by decide

end LeanToCook.SourceCatalog
