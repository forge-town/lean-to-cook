/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒年糕 · dishes/staple/炒年糕.md -/
def recipe_9a222b1883ca : Recipe := {
  id := "9a222b1883ca"
  title := "炒年糕"
  category := "staple"
  sourcePath := "dishes/staple/炒年糕.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "年糕/白粿 （形状不限）",
    "葱",
    "调味料: 酱油，盐",
    "（可选）：鸡蛋，青菜"
  ]
  steps := [
    { index := 1, instruction := "锅中加水烧开，煮熟年糕，碗中加水确保年糕不会粘连，捞起年糕备用。" },
    { index := 2, instruction := "小葱切葱花（将葱白和葱叶分开），青菜切小段备用。" },
    { index := 3, instruction := "（可选） 制作炒蛋，见西红柿炒蛋。" },
    { index := 4, instruction := "热锅，加入 30ml 食用油。" },
    { index := 5, instruction := "将葱白倒入锅中，直至大部分葱白变成焦黄色且发出香味，倒出葱油备用。" },
    { index := 6, instruction := "重新热锅，加入 20ml 食用油。" },
    { index := 7, instruction := "加入所有辅料（鸡蛋，青菜等），翻炒均匀。" },
    { index := 8, instruction := "将年糕的水倒掉，向锅中加入年糕。" },
    { index := 9, instruction := "加入酱油和盐，翻炒均匀。" },
    { index := 10, instruction := "关火，加入葱油，翻炒均匀，乘盘。" }
  ]
}

theorem recipe_9a222b1883ca_ingredients_nonempty :
    recipe_9a222b1883ca.ingredients.isEmpty = false := by decide

theorem recipe_9a222b1883ca_steps_nonempty :
    recipe_9a222b1883ca.steps.isEmpty = false := by decide

theorem recipe_9a222b1883ca_step_count :
    recipe_9a222b1883ca.steps.length = 10 := by decide

theorem recipe_9a222b1883ca_steps_ordered :
    orderedFrom 1 recipe_9a222b1883ca.steps = true := by decide

theorem recipe_9a222b1883ca_executes_to_terminal :
    executesToTerminal recipe_9a222b1883ca = true := by decide

theorem recipe_9a222b1883ca_kernel_certificate :
    kernelCertified recipe_9a222b1883ca = true := by decide

end LeanToCook.SourceCatalog
