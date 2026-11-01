/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒青菜 · dishes/vegetable_dish/炒青菜.md -/
def recipe_8b9856cd2047 : Recipe := {
  id := "8b9856cd2047"
  title := "炒青菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/炒青菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "青菜"
  ]
  steps := [
    { index := 1, instruction := "青菜掰成小瓣，用清水洗净，备用。" },
    { index := 2, instruction := "将蒜瓣剁碎，备用" },
    { index := 3, instruction := "中火或大火热锅后，锅内放入 10-15ml 食用油。再等待 30 秒让油温升高。" },
    { index := 4, instruction := "将准备好的青菜倒入锅中，翻炒至青菜变软（约 1 分钟）。" },
    { index := 5, instruction := "放入剁碎的蒜瓣" },
    { index := 6, instruction := "倒入计算好的清水，水位应当完全浸润或即将没过青菜，加入食盐 （2g  份数），继续翻炒约 1 分钟。" },
    { index := 7, instruction := "最后加入白糖小火加热 2 分钟，加热时盖上锅盖。" },
    { index := 8, instruction := "盛盘。" }
  ]
}

theorem recipe_8b9856cd2047_ingredients_nonempty :
    recipe_8b9856cd2047.ingredients.isEmpty = false := by decide

theorem recipe_8b9856cd2047_steps_nonempty :
    recipe_8b9856cd2047.steps.isEmpty = false := by decide

theorem recipe_8b9856cd2047_step_count :
    recipe_8b9856cd2047.steps.length = 8 := by decide

theorem recipe_8b9856cd2047_steps_ordered :
    orderedFrom 1 recipe_8b9856cd2047.steps = true := by decide

theorem recipe_8b9856cd2047_executes_to_terminal :
    executesToTerminal recipe_8b9856cd2047 = true := by decide

theorem recipe_8b9856cd2047_kernel_certificate :
    kernelCertified recipe_8b9856cd2047 = true := by decide

end LeanToCook.SourceCatalog
