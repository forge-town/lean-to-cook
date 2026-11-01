/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 西红柿土豆炖牛肉 · dishes/meat_dish/西红柿土豆炖牛肉/西红柿土豆炖牛肉.md -/
def recipe_90f04c224709 : Recipe := {
  id := "90f04c224709"
  title := "西红柿土豆炖牛肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/西红柿土豆炖牛肉/西红柿土豆炖牛肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛肉",
    "小料",
    "葱",
    "姜",
    "料酒",
    "花椒",
    "八角",
    "香叶",
    "白糖 or 冰糖",
    "酱油（可选）",
    "老抽",
    "黑胡椒粉（或白胡椒粉）",
    "土豆",
    "西红柿",
    "洋葱"
  ]
  steps := [
    { index := 1, instruction := "备菜:" },
    { index := 2, instruction := "制作" },
    { index := 3, instruction := "炖煮" }
  ]
}

theorem recipe_90f04c224709_ingredients_nonempty :
    recipe_90f04c224709.ingredients.isEmpty = false := by decide

theorem recipe_90f04c224709_steps_nonempty :
    recipe_90f04c224709.steps.isEmpty = false := by decide

theorem recipe_90f04c224709_step_count :
    recipe_90f04c224709.steps.length = 3 := by decide

theorem recipe_90f04c224709_steps_ordered :
    orderedFrom 1 recipe_90f04c224709.steps = true := by decide

theorem recipe_90f04c224709_executes_to_terminal :
    executesToTerminal recipe_90f04c224709 = true := by decide

theorem recipe_90f04c224709_kernel_certificate :
    kernelCertified recipe_90f04c224709 = true := by decide

end LeanToCook.SourceCatalog
