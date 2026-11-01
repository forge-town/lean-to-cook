/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炸串酱料 · dishes/condiment/炸串酱料.md -/
def recipe_12863092d2c6 : Recipe := {
  id := "12863092d2c6"
  title := "炸串酱料"
  category := "condiment"
  sourcePath := "dishes/condiment/炸串酱料.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "干辣椒面（粗细都准备）",
    "孜然粉",
    "胡椒粉",
    "五香粉",
    "花椒粉",
    "十三香",
    "麻辣鲜",
    "白芝麻"
  ]
  steps := [
    { index := 1, instruction := "所有原料在容器内混合，搅拌均匀。" },
    { index := 2, instruction := "锅里烧热油，油的用量以在容器内没过所有原材料为佳。" },
    { index := 3, instruction := "分三次淋入热油，每次 1/3，同时搅拌。" },
    { index := 4, instruction := "最后放入香油 10ml，生抽 10ml，花椒油 10ml，蚝油 10ml。" }
  ]
}

theorem recipe_12863092d2c6_ingredients_nonempty :
    recipe_12863092d2c6.ingredients.isEmpty = false := by decide

theorem recipe_12863092d2c6_steps_nonempty :
    recipe_12863092d2c6.steps.isEmpty = false := by decide

theorem recipe_12863092d2c6_step_count :
    recipe_12863092d2c6.steps.length = 4 := by decide

theorem recipe_12863092d2c6_steps_ordered :
    orderedFrom 1 recipe_12863092d2c6.steps = true := by decide

theorem recipe_12863092d2c6_executes_to_terminal :
    executesToTerminal recipe_12863092d2c6 = true := by decide

theorem recipe_12863092d2c6_kernel_certificate :
    kernelCertified recipe_12863092d2c6 = true := by decide

end LeanToCook.SourceCatalog
