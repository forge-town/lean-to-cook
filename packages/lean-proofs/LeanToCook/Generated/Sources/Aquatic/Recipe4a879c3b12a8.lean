/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒜蓉虾 · dishes/aquatic/蒜蓉虾/蒜蓉虾.md -/
def recipe_4a879c3b12a8 : Recipe := {
  id := "4a879c3b12a8"
  title := "蒜蓉虾"
  category := "aquatic"
  sourcePath := "dishes/aquatic/蒜蓉虾/蒜蓉虾.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "海虾",
    "蒜蓉酱",
    "食用油",
    "生抽"
  ]
  steps := [
    { index := 1, instruction := "用刀从虾头中间切开，切到距离虾尾 1 cm" },
    { index := 2, instruction := "将蒜蓉酱铺在虾身中间，放在盘子中" },
    { index := 3, instruction := "锅中倒入热水，将盘子放入锅中，大火蒸 3 分钟" },
    { index := 4, instruction := "烧热油，倒入虾盘中，倒入生抽" }
  ]
}

theorem recipe_4a879c3b12a8_ingredients_nonempty :
    recipe_4a879c3b12a8.ingredients.isEmpty = false := by decide

theorem recipe_4a879c3b12a8_steps_nonempty :
    recipe_4a879c3b12a8.steps.isEmpty = false := by decide

theorem recipe_4a879c3b12a8_step_count :
    recipe_4a879c3b12a8.steps.length = 4 := by decide

theorem recipe_4a879c3b12a8_steps_ordered :
    orderedFrom 1 recipe_4a879c3b12a8.steps = true := by decide

theorem recipe_4a879c3b12a8_executes_to_terminal :
    executesToTerminal recipe_4a879c3b12a8 = true := by decide

theorem recipe_4a879c3b12a8_kernel_certificate :
    kernelCertified recipe_4a879c3b12a8 = true := by decide

end LeanToCook.SourceCatalog
