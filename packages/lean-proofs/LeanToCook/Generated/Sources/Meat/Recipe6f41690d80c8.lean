/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 豆豉鲮鱼油麦菜 · dishes/meat_dish/豆豉鲮鱼油麦菜/豆豉鲮鱼油麦菜.md -/
def recipe_6f41690d80c8 : Recipe := {
  id := "6f41690d80c8"
  title := "豆豉鲮鱼油麦菜"
  category := "meat"
  sourcePath := "dishes/meat_dish/豆豉鲮鱼油麦菜/豆豉鲮鱼油麦菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "油麦菜",
    "甘竹牌鲮鱼罐头",
    "蒜",
    "生抽",
    "白糖",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "食材处理：" },
    { index := 2, instruction := "炒制过程：" }
  ]
}

theorem recipe_6f41690d80c8_ingredients_nonempty :
    recipe_6f41690d80c8.ingredients.isEmpty = false := by decide

theorem recipe_6f41690d80c8_steps_nonempty :
    recipe_6f41690d80c8.steps.isEmpty = false := by decide

theorem recipe_6f41690d80c8_step_count :
    recipe_6f41690d80c8.steps.length = 2 := by decide

theorem recipe_6f41690d80c8_steps_ordered :
    orderedFrom 1 recipe_6f41690d80c8.steps = true := by decide

theorem recipe_6f41690d80c8_executes_to_terminal :
    executesToTerminal recipe_6f41690d80c8 = true := by decide

theorem recipe_6f41690d80c8_kernel_certificate :
    kernelCertified recipe_6f41690d80c8 = true := by decide

end LeanToCook.SourceCatalog
