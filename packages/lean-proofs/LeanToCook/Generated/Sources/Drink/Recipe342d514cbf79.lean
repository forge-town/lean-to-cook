/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酸梅汤（半成品加工） · dishes/drink/酸梅汤（半成品加工）.md -/
def recipe_342d514cbf79 : Recipe := {
  id := "342d514cbf79"
  title := "酸梅汤（半成品加工）"
  category := "drink"
  sourcePath := "dishes/drink/酸梅汤（半成品加工）.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "酸梅晶固体饮料",
    "方糖（可选）",
    "北京二锅头酒（可选）"
  ]
  steps := [
    { index := 1, instruction := "取饮用水 1177 克。" },
    { index := 2, instruction := "放入酸梅晶固体饮料 60 克，使用汤匙顺时针搅拌 50 圈。" },
    { index := 3, instruction := "再放入剩下 60 克酸梅晶固体饮料，再次使用汤匙顺时针搅拌 50 圈。" },
    { index := 4, instruction := "放入 9 克的方糖，使用汤匙顺时针搅拌 100 圈。" },
    { index := 5, instruction := "放入北京二锅头酒 48 克，用汤匙顺时针搅拌 30 圈。" }
  ]
}

theorem recipe_342d514cbf79_ingredients_nonempty :
    recipe_342d514cbf79.ingredients.isEmpty = false := by decide

theorem recipe_342d514cbf79_steps_nonempty :
    recipe_342d514cbf79.steps.isEmpty = false := by decide

theorem recipe_342d514cbf79_step_count :
    recipe_342d514cbf79.steps.length = 5 := by decide

theorem recipe_342d514cbf79_steps_ordered :
    orderedFrom 1 recipe_342d514cbf79.steps = true := by decide

theorem recipe_342d514cbf79_executes_to_terminal :
    executesToTerminal recipe_342d514cbf79 = true := by decide

theorem recipe_342d514cbf79_kernel_certificate :
    kernelCertified recipe_342d514cbf79 = true := by decide

end LeanToCook.SourceCatalog
