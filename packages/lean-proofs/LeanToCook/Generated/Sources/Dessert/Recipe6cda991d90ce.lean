/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 红柚蛋糕 · dishes/dessert/红柚蛋糕/红柚蛋糕.md -/
def recipe_6cda991d90ce : Recipe := {
  id := "6cda991d90ce"
  title := "红柚蛋糕"
  category := "dessert"
  sourcePath := "dishes/dessert/红柚蛋糕/红柚蛋糕.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "空气炸锅",
    "鸡蛋",
    "红柚果肉",
    "面粉",
    "锡纸盘",
    "油",
    "糖",
    "水"
  ]
  steps := [
    { index := 1, instruction := "锡纸盘里打入鸡蛋 2 个， 加入红柚果肉 20g" },
    { index := 2, instruction := "锡纸盘中倒入 15ml 油并摇晃锡纸盘时期均匀覆盖盘底" },
    { index := 3, instruction := "锡纸盘中放入 10g 糖， 以及 40g 面粉和 40ml 水" },
    { index := 4, instruction := "用筷子顺时针方向搅拌至淡黄色糊状" },
    { index := 5, instruction := "锡纸盘中放入 5g 糖， 以及 40g 面粉和 40ml 水" },
    { index := 6, instruction := "继续用筷子搅拌至淡黄色糊状" },
    { index := 7, instruction := "锡纸盘放入空气炸锅的烤篮上，用 180 摄氏度烤 15 分钟" },
    { index := 8, instruction := "打开空气炸锅，小心取出锡纸盘，用筷子或勺子将蛋糕翻面" },
    { index := 9, instruction := "继续 180 摄氏度烤 8 分钟" },
    { index := 10, instruction := "取出即可食用" }
  ]
}

theorem recipe_6cda991d90ce_ingredients_nonempty :
    recipe_6cda991d90ce.ingredients.isEmpty = false := by decide

theorem recipe_6cda991d90ce_steps_nonempty :
    recipe_6cda991d90ce.steps.isEmpty = false := by decide

theorem recipe_6cda991d90ce_step_count :
    recipe_6cda991d90ce.steps.length = 10 := by decide

theorem recipe_6cda991d90ce_steps_ordered :
    orderedFrom 1 recipe_6cda991d90ce.steps = true := by decide

theorem recipe_6cda991d90ce_executes_to_terminal :
    executesToTerminal recipe_6cda991d90ce = true := by decide

theorem recipe_6cda991d90ce_kernel_certificate :
    kernelCertified recipe_6cda991d90ce = true := by decide

end LeanToCook.SourceCatalog
