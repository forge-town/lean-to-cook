/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 奇异果菠菜特调 · dishes/drink/奇异果菠菜特调/奇异果菠菜特调.md -/
def recipe_d18a2e859415 : Recipe := {
  id := "d18a2e859415"
  title := "奇异果菠菜特调"
  category := "drink"
  sourcePath := "dishes/drink/奇异果菠菜特调/奇异果菠菜特调.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "原料:",
    "奇异果",
    "苹果",
    "菠菜叶（ 2-5 片）",
    "水",
    "白砂糖",
    "工具",
    "榨汁机"
  ]
  steps := [
    { index := 1, instruction := "将猕猴桃切成两半，每半再分四份小块" },
    { index := 2, instruction := "将苹果切丁" },
    { index := 3, instruction := "将菠菜叶去梗，只留叶子部分" },
    { index := 4, instruction := "将菠菜切碎" },
    { index := 5, instruction := "一起倒入榨汁机搅拌杯" },
    { index := 6, instruction := "注水" },
    { index := 7, instruction := "加入白砂糖" },
    { index := 8, instruction := "启动搅拌机，搅拌约 4 个 15 秒（每 15 秒停下看状态）" }
  ]
}

theorem recipe_d18a2e859415_ingredients_nonempty :
    recipe_d18a2e859415.ingredients.isEmpty = false := by decide

theorem recipe_d18a2e859415_steps_nonempty :
    recipe_d18a2e859415.steps.isEmpty = false := by decide

theorem recipe_d18a2e859415_step_count :
    recipe_d18a2e859415.steps.length = 8 := by decide

theorem recipe_d18a2e859415_steps_ordered :
    orderedFrom 1 recipe_d18a2e859415.steps = true := by decide

theorem recipe_d18a2e859415_executes_to_terminal :
    executesToTerminal recipe_d18a2e859415 = true := by decide

theorem recipe_d18a2e859415_kernel_certificate :
    kernelCertified recipe_d18a2e859415 = true := by decide

end LeanToCook.SourceCatalog
