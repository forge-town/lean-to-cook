/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 清蒸鳜鱼 · dishes/meat_dish/清蒸鳜鱼/清蒸鳜鱼.md -/
def recipe_575da7e2ff66 : Recipe := {
  id := "575da7e2ff66"
  title := "清蒸鳜鱼"
  category := "meat"
  sourcePath := "dishes/meat_dish/清蒸鳜鱼/清蒸鳜鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鳜鱼",
    "大葱",
    "小葱",
    "生抽",
    "红辣椒",
    "姜片",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "食材处理：" },
    { index := 2, instruction := "炒制过程：" }
  ]
}

theorem recipe_575da7e2ff66_ingredients_nonempty :
    recipe_575da7e2ff66.ingredients.isEmpty = false := by decide

theorem recipe_575da7e2ff66_steps_nonempty :
    recipe_575da7e2ff66.steps.isEmpty = false := by decide

theorem recipe_575da7e2ff66_step_count :
    recipe_575da7e2ff66.steps.length = 2 := by decide

theorem recipe_575da7e2ff66_steps_ordered :
    orderedFrom 1 recipe_575da7e2ff66.steps = true := by decide

theorem recipe_575da7e2ff66_executes_to_terminal :
    executesToTerminal recipe_575da7e2ff66 = true := by decide

theorem recipe_575da7e2ff66_kernel_certificate :
    kernelCertified recipe_575da7e2ff66 = true := by decide

end LeanToCook.SourceCatalog
