/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 猪油拌饭 · dishes/staple/猪油拌饭.md -/
def recipe_40e20d1b3575 : Recipe := {
  id := "40e20d1b3575"
  title := "猪油拌饭"
  category := "staple"
  sourcePath := "dishes/staple/猪油拌饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "米饭（推荐用粳米）",
    "猪油",
    "生抽（推荐用李锦记或海天）",
    "老抽",
    "蚝油（可选）",
    "葱花（可选）",
    "猪油渣（可选）"
  ]
  steps := [
    { index := 1, instruction := "碗底铺猪油" },
    { index := 2, instruction := "加入米饭" },
    { index := 3, instruction := "淋上酱油与蚝油" },
    { index := 4, instruction := "撒上葱花和猪油渣" },
    { index := 5, instruction := "搅拌均匀" }
  ]
}

theorem recipe_40e20d1b3575_ingredients_nonempty :
    recipe_40e20d1b3575.ingredients.isEmpty = false := by decide

theorem recipe_40e20d1b3575_steps_nonempty :
    recipe_40e20d1b3575.steps.isEmpty = false := by decide

theorem recipe_40e20d1b3575_step_count :
    recipe_40e20d1b3575.steps.length = 5 := by decide

theorem recipe_40e20d1b3575_steps_ordered :
    orderedFrom 1 recipe_40e20d1b3575.steps = true := by decide

theorem recipe_40e20d1b3575_executes_to_terminal :
    executesToTerminal recipe_40e20d1b3575 = true := by decide

theorem recipe_40e20d1b3575_kernel_certificate :
    kernelCertified recipe_40e20d1b3575 = true := by decide

end LeanToCook.SourceCatalog
