/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 柠檬水 · dishes/drink/柠檬水/柠檬水.md -/
def recipe_378f9d2c3a56 : Recipe := {
  id := "378f9d2c3a56"
  title := "柠檬水"
  category := "drink"
  sourcePath := "dishes/drink/柠檬水/柠檬水.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "原料",
    "柠檬",
    "果蜜",
    "冰（可选）",
    "工具",
    "雪克杯"
  ]
  steps := [
    { index := 1, instruction := "称 4045 克柠檬，放入雪克杯中" },
    { index := 2, instruction := "雪克杯盖盖子锤大约 10 次" },
    { index := 3, instruction := "加入果蜜 4045 克" },
    { index := 4, instruction := "补水" },
    { index := 5, instruction := "摇晃均匀" },
    { index := 6, instruction := "最后根据喜好加冰" }
  ]
}

theorem recipe_378f9d2c3a56_ingredients_nonempty :
    recipe_378f9d2c3a56.ingredients.isEmpty = false := by decide

theorem recipe_378f9d2c3a56_steps_nonempty :
    recipe_378f9d2c3a56.steps.isEmpty = false := by decide

theorem recipe_378f9d2c3a56_step_count :
    recipe_378f9d2c3a56.steps.length = 6 := by decide

theorem recipe_378f9d2c3a56_steps_ordered :
    orderedFrom 1 recipe_378f9d2c3a56.steps = true := by decide

theorem recipe_378f9d2c3a56_executes_to_terminal :
    executesToTerminal recipe_378f9d2c3a56 = true := by decide

theorem recipe_378f9d2c3a56_kernel_certificate :
    kernelCertified recipe_378f9d2c3a56 = true := by decide

end LeanToCook.SourceCatalog
