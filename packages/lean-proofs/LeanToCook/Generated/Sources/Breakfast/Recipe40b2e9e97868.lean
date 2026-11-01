/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鸡蛋三明治 · dishes/breakfast/鸡蛋三明治.md -/
def recipe_40b2e9e97868 : Recipe := {
  id := "40b2e9e97868"
  title := "鸡蛋三明治"
  category := "breakfast"
  sourcePath := "dishes/breakfast/鸡蛋三明治.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "吐司",
    "培根",
    "黄油",
    "蛋黄酱",
    "盐",
    "黑胡椒"
  ]
  steps := [
    { index := 1, instruction := "吐司切去四边，备用" },
    { index := 2, instruction := "鸡蛋煮熟，捣碎" },
    { index := 3, instruction := "混合鸡蛋、蛋黄酱、盐、黑胡椒" },
    { index := 4, instruction := "锅中加入黄油，煎熟培根" },
    { index := 5, instruction := "组装吐司，在两片吐司间加入制作好的鸡蛋酱及培根" },
    { index := 6, instruction := "四边形吐司切成三角形装盘" }
  ]
}

theorem recipe_40b2e9e97868_ingredients_nonempty :
    recipe_40b2e9e97868.ingredients.isEmpty = false := by decide

theorem recipe_40b2e9e97868_steps_nonempty :
    recipe_40b2e9e97868.steps.isEmpty = false := by decide

theorem recipe_40b2e9e97868_step_count :
    recipe_40b2e9e97868.steps.length = 6 := by decide

theorem recipe_40b2e9e97868_steps_ordered :
    orderedFrom 1 recipe_40b2e9e97868.steps = true := by decide

theorem recipe_40b2e9e97868_executes_to_terminal :
    executesToTerminal recipe_40b2e9e97868 = true := by decide

theorem recipe_40b2e9e97868_kernel_certificate :
    kernelCertified recipe_40b2e9e97868 = true := by decide

end LeanToCook.SourceCatalog
