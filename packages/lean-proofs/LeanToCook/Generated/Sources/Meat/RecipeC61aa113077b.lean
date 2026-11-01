/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 芥末罗氏虾 · dishes/meat_dish/芥末罗氏虾/芥末罗氏虾.md -/
def recipe_c61aa113077b : Recipe := {
  id := "c61aa113077b"
  title := "芥末罗氏虾"
  category := "meat"
  sourcePath := "dishes/meat_dish/芥末罗氏虾/芥末罗氏虾.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "罗氏虾",
    "蒜",
    "青芥末",
    "生抽",
    "生粉",
    "胡椒粉",
    "白糖",
    "蚝油",
    "盐",
    "小米辣（不吃辣可不放或替换成红菜椒）",
    "黄油",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "处理虾：" },
    { index := 2, instruction := "蒜蓉及碗汁处理：" },
    { index := 3, instruction := "炒制过程：" }
  ]
}

theorem recipe_c61aa113077b_ingredients_nonempty :
    recipe_c61aa113077b.ingredients.isEmpty = false := by decide

theorem recipe_c61aa113077b_steps_nonempty :
    recipe_c61aa113077b.steps.isEmpty = false := by decide

theorem recipe_c61aa113077b_step_count :
    recipe_c61aa113077b.steps.length = 3 := by decide

theorem recipe_c61aa113077b_steps_ordered :
    orderedFrom 1 recipe_c61aa113077b.steps = true := by decide

theorem recipe_c61aa113077b_executes_to_terminal :
    executesToTerminal recipe_c61aa113077b = true := by decide

theorem recipe_c61aa113077b_kernel_certificate :
    kernelCertified recipe_c61aa113077b = true := by decide

end LeanToCook.SourceCatalog
