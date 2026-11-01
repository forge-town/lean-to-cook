/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 微波炉蛋糕 · dishes/breakfast/微波炉蛋糕.md -/
def recipe_17cc9ae41d9f : Recipe := {
  id := "17cc9ae41d9f"
  title := "微波炉蛋糕"
  category := "breakfast"
  sourcePath := "dishes/breakfast/微波炉蛋糕.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "微波炉",
    "能放进微波炉的容器",
    "黄油",
    "面粉",
    "泡打粉（不加吃着像饼）",
    "鸡蛋"
  ]
  steps := [
    { index := 1, instruction := "加入以下食材，注意不要超过容器的 3/4" },
    { index := 2, instruction := "夸赞一下自己🥰" },
    { index := 3, instruction := "微波炉（高火）加热 1分钟 （至蓬松蛋糕形态）" },
    { index := 4, instruction := "取出杯子（烫手啊啊啊啊↑）并拍朋友圈就可以吃了" }
  ]
}

theorem recipe_17cc9ae41d9f_ingredients_nonempty :
    recipe_17cc9ae41d9f.ingredients.isEmpty = false := by decide

theorem recipe_17cc9ae41d9f_steps_nonempty :
    recipe_17cc9ae41d9f.steps.isEmpty = false := by decide

theorem recipe_17cc9ae41d9f_step_count :
    recipe_17cc9ae41d9f.steps.length = 4 := by decide

theorem recipe_17cc9ae41d9f_steps_ordered :
    orderedFrom 1 recipe_17cc9ae41d9f.steps = true := by decide

theorem recipe_17cc9ae41d9f_executes_to_terminal :
    executesToTerminal recipe_17cc9ae41d9f = true := by decide

theorem recipe_17cc9ae41d9f_kernel_certificate :
    kernelCertified recipe_17cc9ae41d9f = true := by decide

end LeanToCook.SourceCatalog
