/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 空气炸锅面包片 · dishes/breakfast/空气炸锅面包片.md -/
def recipe_daeebaa77c3a : Recipe := {
  id := "daeebaa77c3a"
  title := "空气炸锅面包片"
  category := "breakfast"
  sourcePath := "dishes/breakfast/空气炸锅面包片.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "面包片",
    "空气炸锅"
  ]
  steps := [
    { index := 1, instruction := "取出两片面包片（建议使用粗粮面包片）" },
    { index := 2, instruction := "将面包片垂直放入空气炸锅" },
    { index := 3, instruction := "200°C 烘烤 5 分钟" },
    { index := 4, instruction := "取出即可使用" }
  ]
}

theorem recipe_daeebaa77c3a_ingredients_nonempty :
    recipe_daeebaa77c3a.ingredients.isEmpty = false := by decide

theorem recipe_daeebaa77c3a_steps_nonempty :
    recipe_daeebaa77c3a.steps.isEmpty = false := by decide

theorem recipe_daeebaa77c3a_step_count :
    recipe_daeebaa77c3a.steps.length = 4 := by decide

theorem recipe_daeebaa77c3a_steps_ordered :
    orderedFrom 1 recipe_daeebaa77c3a.steps = true := by decide

theorem recipe_daeebaa77c3a_executes_to_terminal :
    executesToTerminal recipe_daeebaa77c3a = true := by decide

theorem recipe_daeebaa77c3a_kernel_certificate :
    kernelCertified recipe_daeebaa77c3a = true := by decide

end LeanToCook.SourceCatalog
