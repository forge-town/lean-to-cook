/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 牛油果拉西 · dishes/drink/牛油果拉西.md -/
def recipe_3a181639cf91 : Recipe := {
  id := "3a181639cf91"
  title := "牛油果拉西"
  category := "drink"
  sourcePath := "dishes/drink/牛油果拉西.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "原味酸奶 (Plain yogurt)",
    "熟透的牛油果",
    "蜂蜜",
    "冷牛奶",
    "小豆蔻粉（可选）",
    "薄荷叶或坚果碎（可选，用于装饰）",
    "搅拌机（破壁机/榨汁机）"
  ]
  steps := [
    { index := 1, instruction := "将牛油果对半切开，去核，剥去外皮，将果肉切成小块备用。" },
    { index := 2, instruction := "在搅拌机中加入 120ml 原味酸奶、切好的牛油果块、1 汤匙蜂蜜以及 60ml 冷牛奶。" },
    { index := 3, instruction := "（可选）加入一小撮小豆蔻粉以增加独特风味。" },
    { index := 4, instruction := "启动搅拌机，搅拌大约 1 分钟直至液体变得完全顺滑和浓郁。" },
    { index := 5, instruction := "将打好的饮品倒入杯中。" },
    { index := 6, instruction := "（可选）在表面放上几片薄荷叶或撒上 5g 切碎的坚果作为装饰。" }
  ]
}

theorem recipe_3a181639cf91_ingredients_nonempty :
    recipe_3a181639cf91.ingredients.isEmpty = false := by decide

theorem recipe_3a181639cf91_steps_nonempty :
    recipe_3a181639cf91.steps.isEmpty = false := by decide

theorem recipe_3a181639cf91_step_count :
    recipe_3a181639cf91.steps.length = 6 := by decide

theorem recipe_3a181639cf91_steps_ordered :
    orderedFrom 1 recipe_3a181639cf91.steps = true := by decide

theorem recipe_3a181639cf91_executes_to_terminal :
    executesToTerminal recipe_3a181639cf91 = true := by decide

theorem recipe_3a181639cf91_kernel_certificate :
    kernelCertified recipe_3a181639cf91 = true := by decide

end LeanToCook.SourceCatalog
