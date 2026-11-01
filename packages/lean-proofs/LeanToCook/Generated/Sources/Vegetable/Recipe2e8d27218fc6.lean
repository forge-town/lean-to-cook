/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 金针菇日本豆腐煲 · dishes/vegetable_dish/金针菇日本豆腐煲.md -/
def recipe_2e8d27218fc6 : Recipe := {
  id := "2e8d27218fc6"
  title := "金针菇日本豆腐煲"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/金针菇日本豆腐煲.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "金针菇",
    "日本豆腐（玉子豆腐）",
    "小米椒",
    "生抽",
    "蚝油",
    "盐",
    "糖",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "豆腐切片，小火煎到两面金黄出锅备用。" },
    { index := 2, instruction := "切蒜成蒜末；将生抽，蚝油，老抽，糖，100ml 水调汁备用。" },
    { index := 3, instruction := "热锅放油，油热放小米椒、蒜末爆香，先放金针菇，炒软，把煎好的豆腐平铺在金针菇上，倒入#2 配好的料汁，焖 5 分钟，大火收汁。" }
  ]
}

theorem recipe_2e8d27218fc6_ingredients_nonempty :
    recipe_2e8d27218fc6.ingredients.isEmpty = false := by decide

theorem recipe_2e8d27218fc6_steps_nonempty :
    recipe_2e8d27218fc6.steps.isEmpty = false := by decide

theorem recipe_2e8d27218fc6_step_count :
    recipe_2e8d27218fc6.steps.length = 3 := by decide

theorem recipe_2e8d27218fc6_steps_ordered :
    orderedFrom 1 recipe_2e8d27218fc6.steps = true := by decide

theorem recipe_2e8d27218fc6_executes_to_terminal :
    executesToTerminal recipe_2e8d27218fc6 = true := by decide

theorem recipe_2e8d27218fc6_kernel_certificate :
    kernelCertified recipe_2e8d27218fc6 = true := by decide

end LeanToCook.SourceCatalog
