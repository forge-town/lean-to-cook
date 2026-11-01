/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 洋葱炒鸡蛋 · dishes/vegetable_dish/洋葱炒鸡蛋/洋葱炒鸡蛋.md -/
def recipe_11b4b5d7abe0 : Recipe := {
  id := "11b4b5d7abe0"
  title := "洋葱炒鸡蛋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/洋葱炒鸡蛋/洋葱炒鸡蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "洋葱",
    "食用油",
    "盐",
    "葱",
    "料酒"
  ]
  steps := [
    { index := 1, instruction := "鸡蛋打入大碗中，加入洋葱片、盐后搅拌 60 S" },
    { index := 2, instruction := "起锅烧油，倒入鸡蛋，一面煎炸 30-45 S ，翻面继续翻炒，反复 2-3 分钟 后散上料酒出锅" },
    { index := 3, instruction := "鸡蛋装盘，散上葱花" }
  ]
}

theorem recipe_11b4b5d7abe0_ingredients_nonempty :
    recipe_11b4b5d7abe0.ingredients.isEmpty = false := by decide

theorem recipe_11b4b5d7abe0_steps_nonempty :
    recipe_11b4b5d7abe0.steps.isEmpty = false := by decide

theorem recipe_11b4b5d7abe0_step_count :
    recipe_11b4b5d7abe0.steps.length = 3 := by decide

theorem recipe_11b4b5d7abe0_steps_ordered :
    orderedFrom 1 recipe_11b4b5d7abe0.steps = true := by decide

theorem recipe_11b4b5d7abe0_executes_to_terminal :
    executesToTerminal recipe_11b4b5d7abe0 = true := by decide

theorem recipe_11b4b5d7abe0_kernel_certificate :
    kernelCertified recipe_11b4b5d7abe0 = true := by decide

end LeanToCook.SourceCatalog
