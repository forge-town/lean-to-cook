/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 韭菜盒子 · dishes/staple/韭菜盒子.md -/
def recipe_b8edc500b99e : Recipe := {
  id := "b8edc500b99e"
  title := "韭菜盒子"
  category := "staple"
  sourcePath := "dishes/staple/韭菜盒子.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "韭菜",
    "虾仁",
    "鸡蛋",
    "香油",
    "盐",
    "面粉"
  ]
  steps := [
    { index := 1, instruction := "将面粉放入大碗中，加入水，搅拌成光滑的面团，静置 30 分钟。" },
    { index := 2, instruction := "韭菜洗净切碎，加入打散的鸡蛋、5g 盐，搅拌均匀。" },
    { index := 3, instruction := "将面团分成小剂子，擀成薄圆饼，包入韭菜、虾仁、鸡蛋液。" },
    { index := 4, instruction := "热锅，加入食用油，放入包好的韭菜盒子，煎至两面金黄，约 3-4 分钟。" },
    { index := 5, instruction := "盛盘，稍凉后即可享用。" }
  ]
}

theorem recipe_b8edc500b99e_ingredients_nonempty :
    recipe_b8edc500b99e.ingredients.isEmpty = false := by decide

theorem recipe_b8edc500b99e_steps_nonempty :
    recipe_b8edc500b99e.steps.isEmpty = false := by decide

theorem recipe_b8edc500b99e_step_count :
    recipe_b8edc500b99e.steps.length = 5 := by decide

theorem recipe_b8edc500b99e_steps_ordered :
    orderedFrom 1 recipe_b8edc500b99e.steps = true := by decide

theorem recipe_b8edc500b99e_executes_to_terminal :
    executesToTerminal recipe_b8edc500b99e = true := by decide

theorem recipe_b8edc500b99e_kernel_certificate :
    kernelCertified recipe_b8edc500b99e = true := by decide

end LeanToCook.SourceCatalog
