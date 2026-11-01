/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 老式锅包肉 · dishes/meat_dish/老式锅包肉/老式锅包肉.md -/
def recipe_c40321c42378 : Recipe := {
  id := "c40321c42378"
  title := "老式锅包肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/老式锅包肉/老式锅包肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪通脊肉",
    "大葱",
    "姜",
    "蒜",
    "胡萝卜（可无）",
    "香菜",
    "白醋（建议使用 9 度的醋，这样才会有较为突出的老式锅包肉特有的醋香）",
    "白糖",
    "料酒",
    "盐",
    "味精",
    "土豆淀粉",
    "中筋面粉",
    "小苏打",
    "白熟芝麻（可无）",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "处理猪肉：" },
    { index := 2, instruction := "腌制肉片：" },
    { index := 3, instruction := "挂浆：" },
    { index := 4, instruction := "调制糖醋汁：" },
    { index := 5, instruction := "准备配菜：" },
    { index := 6, instruction := "炸制肉片：" },
    { index := 7, instruction := "炒制：" },
    { index := 8, instruction := "出锅装盘：" }
  ]
}

theorem recipe_c40321c42378_ingredients_nonempty :
    recipe_c40321c42378.ingredients.isEmpty = false := by decide

theorem recipe_c40321c42378_steps_nonempty :
    recipe_c40321c42378.steps.isEmpty = false := by decide

theorem recipe_c40321c42378_step_count :
    recipe_c40321c42378.steps.length = 8 := by decide

theorem recipe_c40321c42378_steps_ordered :
    orderedFrom 1 recipe_c40321c42378.steps = true := by decide

theorem recipe_c40321c42378_executes_to_terminal :
    executesToTerminal recipe_c40321c42378 = true := by decide

theorem recipe_c40321c42378_kernel_certificate :
    kernelCertified recipe_c40321c42378 = true := by decide

end LeanToCook.SourceCatalog
