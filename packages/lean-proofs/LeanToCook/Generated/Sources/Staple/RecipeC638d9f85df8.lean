/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酱拌荞麦面 · dishes/staple/酱拌荞麦面/酱拌荞麦面.md -/
def recipe_c638d9f85df8 : Recipe := {
  id := "c638d9f85df8"
  title := "酱拌荞麦面"
  category := "staple"
  sourcePath := "dishes/staple/酱拌荞麦面/酱拌荞麦面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "荞麦面",
    "黄瓜",
    "红萝卜",
    "老干妈"
  ]
  steps := [
    { index := 1, instruction := "荞麦面下冷水煮熟，8-10 分钟 后捞出沥干备用" },
    { index := 2, instruction := "黄瓜、萝卜 切成小条" },
    { index := 3, instruction := "将荞麦面、黄瓜、萝卜放入盘子，放上老干妈，搅拌" }
  ]
}

theorem recipe_c638d9f85df8_ingredients_nonempty :
    recipe_c638d9f85df8.ingredients.isEmpty = false := by decide

theorem recipe_c638d9f85df8_steps_nonempty :
    recipe_c638d9f85df8.steps.isEmpty = false := by decide

theorem recipe_c638d9f85df8_step_count :
    recipe_c638d9f85df8.steps.length = 3 := by decide

theorem recipe_c638d9f85df8_steps_ordered :
    orderedFrom 1 recipe_c638d9f85df8.steps = true := by decide

theorem recipe_c638d9f85df8_executes_to_terminal :
    executesToTerminal recipe_c638d9f85df8 = true := by decide

theorem recipe_c638d9f85df8_kernel_certificate :
    kernelCertified recipe_c638d9f85df8 = true := by decide

end LeanToCook.SourceCatalog
