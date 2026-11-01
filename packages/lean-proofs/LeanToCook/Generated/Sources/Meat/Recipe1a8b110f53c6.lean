/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 麻辣香锅 · dishes/meat_dish/麻辣香锅.md -/
def recipe_1a8b110f53c6 : Recipe := {
  id := "1a8b110f53c6"
  title := "麻辣香锅"
  category := "meat"
  sourcePath := "dishes/meat_dish/麻辣香锅.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "青菜（油菜、油麦菜、菠菜）",
    "无骨肉（猪肉、牛肉、鸡肉、鱼丸、火腿肠）",
    "干豆腐",
    "北京麻辣方便面",
    "干辣椒"
  ]
  steps := [
    { index := 1, instruction := "烧开一锅水（水量能没过第 2-4 步中的食材即可）。" },
    { index := 2, instruction := "在开水中放入青菜，焯 5 分钟后盛出备用。" },
    { index := 3, instruction := "在开水中放入无骨肉，焯 4 分钟后盛出备用。" },
    { index := 4, instruction := "在开水中放入北京麻辣方便面，煮 2 分钟后盛出备用。" },
    { index := 5, instruction := "倒出开水，擦干锅具，放入 105 克食用油，大火加热 30 秒。" },
    { index := 6, instruction := "放入麻辣香锅调料，翻炒 20 秒。" },
    { index := 7, instruction := "放入干辣椒，翻炒 10 秒。" },
    { index := 8, instruction := "放入焯过的青菜，改中火，翻炒 3 分钟。" },
    { index := 9, instruction := "放入焯过的无骨肉，翻炒 3 分钟。" },
    { index := 10, instruction := "放入煮过的北京麻辣方便面，用筷子翻动 1 分钟。" },
    { index := 11, instruction := "关火，出锅。" }
  ]
}

theorem recipe_1a8b110f53c6_ingredients_nonempty :
    recipe_1a8b110f53c6.ingredients.isEmpty = false := by decide

theorem recipe_1a8b110f53c6_steps_nonempty :
    recipe_1a8b110f53c6.steps.isEmpty = false := by decide

theorem recipe_1a8b110f53c6_step_count :
    recipe_1a8b110f53c6.steps.length = 11 := by decide

theorem recipe_1a8b110f53c6_steps_ordered :
    orderedFrom 1 recipe_1a8b110f53c6.steps = true := by decide

theorem recipe_1a8b110f53c6_executes_to_terminal :
    executesToTerminal recipe_1a8b110f53c6 = true := by decide

theorem recipe_1a8b110f53c6_kernel_certificate :
    kernelCertified recipe_1a8b110f53c6 = true := by decide

end LeanToCook.SourceCatalog
