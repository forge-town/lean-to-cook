/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒茄子 · dishes/vegetable_dish/炒茄子.md -/
def recipe_51a4793a1e08 : Recipe := {
  id := "51a4793a1e08"
  title := "炒茄子"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/炒茄子.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "茄子",
    "八角（可选）",
    "虾皮（可选）",
    "香葱（可选）",
    "肉末（可选）",
    "酱油",
    "糖（可选）",
    "醋（可选）",
    "菜籽油或花生油"
  ]
  steps := [
    { index := 1, instruction := "将茄子洗净，一刀分为两段（竖切）。每段的茄子切菱形块，将切好的茄子放入碗中待命。" },
    { index := 2, instruction := "将香葱洗净，并切成葱花放到案板上待命。" },
    { index := 3, instruction := "切好八角，放到案板上待命。" },
    { index := 4, instruction := "如果打算放肉末，先用 10 ml（如果是纯瘦肉，用 15 ml）油中火炒至变色（约 1 分钟），然后盛出备用。" },
    { index := 5, instruction := "开火热锅，直至锅内没有水。" },
    { index := 6, instruction := "往锅内倒食用油，没过锅底的两倍（油可以多加，但不可少加）。" },
    { index := 7, instruction := "热油约 6 成熟，放入八角、虾皮、香葱这三种可选性材料。" },
    { index := 8, instruction := "如果没有八角等可选材料，热油至 9 成熟。" },
    { index := 9, instruction := "待锅内的油到 9 成熟，将碗中的茄子倒入锅内用锅铲进行翻炒。" },
    { index := 10, instruction := "翻炒约 40 秒，将锅铲悬空，与锅平行，把酱油倒入锅铲内。一人约 2.5 锅铲（酱油可以少加，但不可多加，会咸）。" },
    { index := 11, instruction := "茄子炒到半软时（约 1 分钟后），放回预炒的肉末，快速搅拌均匀。" },
    { index := 12, instruction := "如果打算加入糖和醋，加入糖和醋。" },
    { index := 13, instruction := "继续进行翻炒。" },
    { index := 14, instruction := "等到锅内所有茄子变色且变软时捞出。" }
  ]
}

theorem recipe_51a4793a1e08_ingredients_nonempty :
    recipe_51a4793a1e08.ingredients.isEmpty = false := by decide

theorem recipe_51a4793a1e08_steps_nonempty :
    recipe_51a4793a1e08.steps.isEmpty = false := by decide

theorem recipe_51a4793a1e08_step_count :
    recipe_51a4793a1e08.steps.length = 14 := by decide

theorem recipe_51a4793a1e08_steps_ordered :
    orderedFrom 1 recipe_51a4793a1e08.steps = true := by decide

theorem recipe_51a4793a1e08_executes_to_terminal :
    executesToTerminal recipe_51a4793a1e08 = true := by decide

theorem recipe_51a4793a1e08_kernel_certificate :
    kernelCertified recipe_51a4793a1e08 = true := by decide

end LeanToCook.SourceCatalog
