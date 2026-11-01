/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 葱煎豆腐 · dishes/vegetable_dish/葱煎豆腐.md -/
def recipe_54b72d4f7cf8 : Recipe := {
  id := "54b72d4f7cf8"
  title := "葱煎豆腐"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/葱煎豆腐.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "白豆腐",
    "葱",
    "青辣椒",
    "盐",
    "鸡精",
    "平底锅"
  ]
  steps := [
    { index := 1, instruction := "豆腐洗净。切约 5 mm 厚度，置于碟中。" },
    { index := 2, instruction := "葱洗净，除去根部，切成葱花，备用。" },
    { index := 3, instruction := "辣椒洗净，切开，去籽，切成 1cm  1cm 状，备用、" },
    { index := 4, instruction := "热锅，加入份数  9ml 油。" },
    { index := 5, instruction := "油入锅后，使其均匀布于锅底，均匀放入豆腐，小火煎至金黄翻面。" },
    { index := 6, instruction := "待两面金黄，盛入碟中备用。" },
    { index := 7, instruction := "补油至覆盖锅底，倒入辣椒大火翻炒，并铲碾 3 分钟。" },
    { index := 8, instruction := "倒入豆腐，翻炒，加入盐与鸡精，中火翻炒 1 分钟后倒入 10 ML 水，大火收汁。" },
    { index := 9, instruction := "出锅前撒上之前计算好的葱花，起锅盛盘。" }
  ]
}

theorem recipe_54b72d4f7cf8_ingredients_nonempty :
    recipe_54b72d4f7cf8.ingredients.isEmpty = false := by decide

theorem recipe_54b72d4f7cf8_steps_nonempty :
    recipe_54b72d4f7cf8.steps.isEmpty = false := by decide

theorem recipe_54b72d4f7cf8_step_count :
    recipe_54b72d4f7cf8.steps.length = 9 := by decide

theorem recipe_54b72d4f7cf8_steps_ordered :
    orderedFrom 1 recipe_54b72d4f7cf8.steps = true := by decide

theorem recipe_54b72d4f7cf8_executes_to_terminal :
    executesToTerminal recipe_54b72d4f7cf8 = true := by decide

theorem recipe_54b72d4f7cf8_kernel_certificate :
    kernelCertified recipe_54b72d4f7cf8 = true := by decide

end LeanToCook.SourceCatalog
