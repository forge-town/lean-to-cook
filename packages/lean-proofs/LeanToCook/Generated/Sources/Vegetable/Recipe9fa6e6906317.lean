/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 凉拌油麦菜 · dishes/vegetable_dish/凉拌油麦菜.md -/
def recipe_9fa6e6906317 : Recipe := {
  id := "9fa6e6906317"
  title := "凉拌油麦菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/凉拌油麦菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "油麦菜",
    "芝麻酱",
    "酱油",
    "醋",
    "蚝油",
    "白糖",
    "香油",
    "蒜",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "蒜拍碎切末" },
    { index := 2, instruction := "醋，酱油，芝麻酱，香油，糖，蚝油，蒜末放到碗里搅拌均匀" },
    { index := 3, instruction := "油麦菜切段，每段不超过 4cm" },
    { index := 4, instruction := "油麦菜放到一个大点的盆里，倒入上述碗中酱料，充分搅拌均匀." }
  ]
}

theorem recipe_9fa6e6906317_ingredients_nonempty :
    recipe_9fa6e6906317.ingredients.isEmpty = false := by decide

theorem recipe_9fa6e6906317_steps_nonempty :
    recipe_9fa6e6906317.steps.isEmpty = false := by decide

theorem recipe_9fa6e6906317_step_count :
    recipe_9fa6e6906317.steps.length = 4 := by decide

theorem recipe_9fa6e6906317_steps_ordered :
    orderedFrom 1 recipe_9fa6e6906317.steps = true := by decide

theorem recipe_9fa6e6906317_executes_to_terminal :
    executesToTerminal recipe_9fa6e6906317 = true := by decide

theorem recipe_9fa6e6906317_kernel_certificate :
    kernelCertified recipe_9fa6e6906317 = true := by decide

end LeanToCook.SourceCatalog
