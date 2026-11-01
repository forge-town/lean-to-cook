/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 话梅煮毛豆 · dishes/vegetable_dish/话梅煮毛豆/话梅煮毛豆.md -/
def recipe_d50d59c1ca77 : Recipe := {
  id := "d50d59c1ca77"
  title := "话梅煮毛豆"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/话梅煮毛豆/话梅煮毛豆.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "毛豆",
    "话梅",
    "食用盐"
  ]
  steps := [
    { index := 1, instruction := "清水加入食用盐，毛豆浸泡 15 分钟" },
    { index := 2, instruction := "加入开水，倒入毛豆、话梅，水煮 20-30 分钟" },
    { index := 3, instruction := "起锅开吃" }
  ]
}

theorem recipe_d50d59c1ca77_ingredients_nonempty :
    recipe_d50d59c1ca77.ingredients.isEmpty = false := by decide

theorem recipe_d50d59c1ca77_steps_nonempty :
    recipe_d50d59c1ca77.steps.isEmpty = false := by decide

theorem recipe_d50d59c1ca77_step_count :
    recipe_d50d59c1ca77.steps.length = 3 := by decide

theorem recipe_d50d59c1ca77_steps_ordered :
    orderedFrom 1 recipe_d50d59c1ca77.steps = true := by decide

theorem recipe_d50d59c1ca77_executes_to_terminal :
    executesToTerminal recipe_d50d59c1ca77 = true := by decide

theorem recipe_d50d59c1ca77_kernel_certificate :
    kernelCertified recipe_d50d59c1ca77 = true := by decide

end LeanToCook.SourceCatalog
