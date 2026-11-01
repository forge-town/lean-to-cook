/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 桂圆红枣粥 · dishes/breakfast/桂圆红枣粥.md -/
def recipe_5ab770d28136 : Recipe := {
  id := "5ab770d28136"
  title := "桂圆红枣粥"
  category := "breakfast"
  sourcePath := "dishes/breakfast/桂圆红枣粥.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "糯米（或大米）",
    "红枣",
    "桂圆"
  ]
  steps := [
    { index := 1, instruction := "将桂圆肉扒出，用清水洗两次，放入碗中浸泡 10 分钟" },
    { index := 2, instruction := "红枣用清水洗两次，放入碗中浸泡 10 分钟" },
    { index := 3, instruction := "糯米放入电饭锅中，清水淘米两次后，加入 2000ml 水" },
    { index := 4, instruction := "将桂圆和红枣加入电饭锅" },
    { index := 5, instruction := "打开电饭锅煮饭模式，1 小时后粥成" }
  ]
}

theorem recipe_5ab770d28136_ingredients_nonempty :
    recipe_5ab770d28136.ingredients.isEmpty = false := by decide

theorem recipe_5ab770d28136_steps_nonempty :
    recipe_5ab770d28136.steps.isEmpty = false := by decide

theorem recipe_5ab770d28136_step_count :
    recipe_5ab770d28136.steps.length = 5 := by decide

theorem recipe_5ab770d28136_steps_ordered :
    orderedFrom 1 recipe_5ab770d28136.steps = true := by decide

theorem recipe_5ab770d28136_executes_to_terminal :
    executesToTerminal recipe_5ab770d28136 = true := by decide

theorem recipe_5ab770d28136_kernel_certificate :
    kernelCertified recipe_5ab770d28136 = true := by decide

end LeanToCook.SourceCatalog
