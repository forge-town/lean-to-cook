/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 电饭煲三文鱼炊饭 · dishes/staple/电饭煲三文鱼炊饭/电饭煲三文鱼炊饭.md -/
def recipe_9e09ccc87f3f : Recipe := {
  id := "9e09ccc87f3f"
  title := "电饭煲三文鱼炊饭"
  category := "staple"
  sourcePath := "dishes/staple/电饭煲三文鱼炊饭/电饭煲三文鱼炊饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "有盐牛油",
    "三文鱼",
    "米",
    "粟米（可选）",
    "金菇（可选）",
    "冬菇（可选）",
    "电饭煲"
  ]
  steps := [
    { index := 1, instruction := "三文鱼去鳞，去骨" },
    { index := 2, instruction := "金菇、冬菇切碎" },
    { index := 3, instruction := "洗米三次" },
    { index := 4, instruction := "把三文鱼、米、牛油放入电饭煲" },
    { index := 5, instruction := "想口感浓厚一点，可以加多一汤匙牛油" },
    { index := 6, instruction := "根据电饭煲的刻度放水" },
    { index := 7, instruction := "把电饭煲調較至煲飯模式，等待大約 30 - 45 分鐘" }
  ]
}

theorem recipe_9e09ccc87f3f_ingredients_nonempty :
    recipe_9e09ccc87f3f.ingredients.isEmpty = false := by decide

theorem recipe_9e09ccc87f3f_steps_nonempty :
    recipe_9e09ccc87f3f.steps.isEmpty = false := by decide

theorem recipe_9e09ccc87f3f_step_count :
    recipe_9e09ccc87f3f.steps.length = 7 := by decide

theorem recipe_9e09ccc87f3f_steps_ordered :
    orderedFrom 1 recipe_9e09ccc87f3f.steps = true := by decide

theorem recipe_9e09ccc87f3f_executes_to_terminal :
    executesToTerminal recipe_9e09ccc87f3f = true := by decide

theorem recipe_9e09ccc87f3f_kernel_certificate :
    kernelCertified recipe_9e09ccc87f3f = true := by decide

end LeanToCook.SourceCatalog
