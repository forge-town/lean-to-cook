/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 煮锅蒸米饭 · dishes/staple/米饭/煮锅蒸米饭.md -/
def recipe_65d4c06a5b48 : Recipe := {
  id := "65d4c06a5b48"
  title := "煮锅蒸米饭"
  category := "staple"
  sourcePath := "dishes/staple/米饭/煮锅蒸米饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "北方大米",
    "水",
    "厚底煮锅+严丝合缝的锅盖（制作过程中不会有大量蒸汽泄漏）"
  ]
  steps := [
    { index := 1, instruction := "清洗大米" },
    { index := 2, instruction := "将米和水加入煮锅" },
    { index := 3, instruction := "大火煮至水沸腾" },
    { index := 4, instruction := "搅拌底部防止粘黏" },
    { index := 5, instruction := "盖上锅盖，转小火加热 10-15 分钟（根据对软糯程度的喜好），中途切勿打开锅盖" },
    { index := 6, instruction := "关火，静置 5 分钟" },
    { index := 7, instruction := "Enjoy :)" }
  ]
}

theorem recipe_65d4c06a5b48_ingredients_nonempty :
    recipe_65d4c06a5b48.ingredients.isEmpty = false := by decide

theorem recipe_65d4c06a5b48_steps_nonempty :
    recipe_65d4c06a5b48.steps.isEmpty = false := by decide

theorem recipe_65d4c06a5b48_step_count :
    recipe_65d4c06a5b48.steps.length = 7 := by decide

theorem recipe_65d4c06a5b48_steps_ordered :
    orderedFrom 1 recipe_65d4c06a5b48.steps = true := by decide

theorem recipe_65d4c06a5b48_executes_to_terminal :
    executesToTerminal recipe_65d4c06a5b48 = true := by decide

theorem recipe_65d4c06a5b48_kernel_certificate :
    kernelCertified recipe_65d4c06a5b48 = true := by decide

end LeanToCook.SourceCatalog
