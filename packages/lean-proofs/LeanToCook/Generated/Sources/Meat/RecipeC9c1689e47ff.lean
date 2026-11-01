/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 奶酪培根通心粉 · dishes/meat_dish/奶酪培根通心粉/奶酪培根通心粉.md -/
def recipe_c9c1689e47ff : Recipe := {
  id := "c9c1689e47ff"
  title := "奶酪培根通心粉"
  category := "meat"
  sourcePath := "dishes/meat_dish/奶酪培根通心粉/奶酪培根通心粉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "通心粉",
    "奶酪",
    "肉类",
    "洋葱",
    "黄油",
    "面粉",
    "牛奶",
    "大蒜"
  ]
  steps := [
    { index := 1, instruction := "奶酪要磨成碎末" },
    { index := 2, instruction := "洋葱切成条状" },
    { index := 3, instruction := "通心粉用微咸的水煮 6 分钟" },
    { index := 4, instruction := "中火" },
    { index := 5, instruction := "锅中放入黄油，等待融化" },
    { index := 6, instruction := "加入洋葱" },
    { index := 7, instruction := "洋葱软化后加入大蒜" },
    { index := 8, instruction := "大蒜香味出来后，加入肉类，等待 5 秒" },
    { index := 9, instruction := "小火" },
    { index := 10, instruction := "分四次加入牛奶，每次搅拌 5 秒后再加下一次" },
    { index := 11, instruction := "加入面粉并充分搅拌" },
    { index := 12, instruction := "加入奶酪并搅拌均匀" },
    { index := 13, instruction := "将通心粉和奶酪搅拌" },
    { index := 14, instruction := "如果不打算烘烤，可以直接吃了" },
    { index := 15, instruction := "烘烤：" },
    { index := 16, instruction := "预热烤箱至 180°C" },
    { index := 17, instruction := "将额外的 50g 芝士铺在通心粉之上" },
    { index := 18, instruction := "等待烤箱预热至 180°C 后，将通心粉放入" },
    { index := 19, instruction := "烤至表面金黄,约 24 分钟" }
  ]
}

theorem recipe_c9c1689e47ff_ingredients_nonempty :
    recipe_c9c1689e47ff.ingredients.isEmpty = false := by decide

theorem recipe_c9c1689e47ff_steps_nonempty :
    recipe_c9c1689e47ff.steps.isEmpty = false := by decide

theorem recipe_c9c1689e47ff_step_count :
    recipe_c9c1689e47ff.steps.length = 19 := by decide

theorem recipe_c9c1689e47ff_steps_ordered :
    orderedFrom 1 recipe_c9c1689e47ff.steps = true := by decide

theorem recipe_c9c1689e47ff_executes_to_terminal :
    executesToTerminal recipe_c9c1689e47ff = true := by decide

theorem recipe_c9c1689e47ff_kernel_certificate :
    kernelCertified recipe_c9c1689e47ff = true := by decide

end LeanToCook.SourceCatalog
