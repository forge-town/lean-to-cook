/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 菌菇炖乳鸽 · dishes/soup/菌菇炖乳鸽/菌菇炖乳鸽.md -/
def recipe_12b1c244a100 : Recipe := {
  id := "12b1c244a100"
  title := "菌菇炖乳鸽"
  category := "soup"
  sourcePath := "dishes/soup/菌菇炖乳鸽/菌菇炖乳鸽.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "乳鸽",
    "菌菇",
    "玉米",
    "姜",
    "料酒",
    "食用盐",
    "瓦罐或者高压锅"
  ]
  steps := [
    { index := 1, instruction := "冷水洗干净热心摊主处理好的乳鸽" },
    { index := 2, instruction := "冷水锅中放入洗干净的乳鸽，加入 15ml 料酒与姜，水煮开即可捞出乳鸽，要不然会丢失营养" },
    { index := 3, instruction := "把乳鸽放到高压缩或者瓦罐中、倒入的水要没过乳鸽，放入生姜 20 g，玉米 200 g、菌菇 100 g" },
    { index := 4, instruction := "时间到了，盛到碗中，加入 35g 盐 即可" }
  ]
}

theorem recipe_12b1c244a100_ingredients_nonempty :
    recipe_12b1c244a100.ingredients.isEmpty = false := by decide

theorem recipe_12b1c244a100_steps_nonempty :
    recipe_12b1c244a100.steps.isEmpty = false := by decide

theorem recipe_12b1c244a100_step_count :
    recipe_12b1c244a100.steps.length = 4 := by decide

theorem recipe_12b1c244a100_steps_ordered :
    orderedFrom 1 recipe_12b1c244a100.steps = true := by decide

theorem recipe_12b1c244a100_executes_to_terminal :
    executesToTerminal recipe_12b1c244a100 = true := by decide

theorem recipe_12b1c244a100_kernel_certificate :
    kernelCertified recipe_12b1c244a100 = true := by decide

end LeanToCook.SourceCatalog
