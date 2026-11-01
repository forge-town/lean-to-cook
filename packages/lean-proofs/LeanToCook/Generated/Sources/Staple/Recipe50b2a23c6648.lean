/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒馍 · dishes/staple/炒馍.md -/
def recipe_50b2a23c6648 : Recipe := {
  id := "50b2a23c6648"
  title := "炒馍"
  category := "staple"
  sourcePath := "dishes/staple/炒馍.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "馒头（隔天略硬更好）",
    "盐",
    "油",
    "孜然粉",
    "五香粉",
    "小葱",
    "鸡蛋（可选）"
  ]
  steps := [
    { index := 1, instruction := "将馒头切成小块或小片。" },
    { index := 2, instruction := "选有鸡蛋的话将鸡蛋打进碗里，打散（可加盐和五香粉各 1g 或不加，等炒的过程中加）。" },
    { index := 3, instruction := "鸡蛋浇在馒头上，拌匀，鸡蛋不宜过多。" },
    { index := 4, instruction := "大火热锅，倒入食用油（不锈钢锅怕伤锅的话可以先倒油，烧至油热也可也可）" },
    { index := 5, instruction := "将馍丁放进去翻炒，翻炒均匀。" },
    { index := 6, instruction := "将火调小，炒至馍丁呈金黄色。" },
    { index := 7, instruction := "放入盐，胡椒粉，五香粉。" },
    { index := 8, instruction := "最后将葱花放入一起翻炒几下。" },
    { index := 9, instruction := "关火出锅。" }
  ]
}

theorem recipe_50b2a23c6648_ingredients_nonempty :
    recipe_50b2a23c6648.ingredients.isEmpty = false := by decide

theorem recipe_50b2a23c6648_steps_nonempty :
    recipe_50b2a23c6648.steps.isEmpty = false := by decide

theorem recipe_50b2a23c6648_step_count :
    recipe_50b2a23c6648.steps.length = 9 := by decide

theorem recipe_50b2a23c6648_steps_ordered :
    orderedFrom 1 recipe_50b2a23c6648.steps = true := by decide

theorem recipe_50b2a23c6648_executes_to_terminal :
    executesToTerminal recipe_50b2a23c6648 = true := by decide

theorem recipe_50b2a23c6648_kernel_certificate :
    kernelCertified recipe_50b2a23c6648 = true := by decide

end LeanToCook.SourceCatalog
