/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 番茄红酱 · dishes/meat_dish/番茄红酱.md -/
def recipe_e708c271324a : Recipe := {
  id := "e708c271324a"
  title := "番茄红酱"
  category := "meat"
  sourcePath := "dishes/meat_dish/番茄红酱.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "碎牛肉",
    "蒜瓣",
    "胡萝卜",
    "芹菜",
    "洋葱",
    "橄榄油",
    "糖",
    "食盐",
    "胡椒粉",
    "番茄酱",
    "牛奶",
    "干罗勒或百里香（可选）"
  ]
  steps := [
    { index := 1, instruction := "将胡萝卜、芹菜、洋葱切碎，蒜瓣切片。" },
    { index := 2, instruction := "加入 10ml 橄榄油，热油下锅蔬菜，大火翻炒开始略微变色后盛出。" },
    { index := 3, instruction := "锅内加油 10ml，加蒜翻炒 10 秒，加入碎牛肉、糖、盐、胡椒粉和香料将牛肉炒脆（有颗粒感）。" },
    { index := 4, instruction := "加入炒好的蔬菜们和番茄酱继续翻炒，搅拌均匀。" },
    { index := 5, instruction := "分多次缓缓倒入牛奶，中小火煮 30 分钟，完成。" }
  ]
}

theorem recipe_e708c271324a_ingredients_nonempty :
    recipe_e708c271324a.ingredients.isEmpty = false := by decide

theorem recipe_e708c271324a_steps_nonempty :
    recipe_e708c271324a.steps.isEmpty = false := by decide

theorem recipe_e708c271324a_step_count :
    recipe_e708c271324a.steps.length = 5 := by decide

theorem recipe_e708c271324a_steps_ordered :
    orderedFrom 1 recipe_e708c271324a.steps = true := by decide

theorem recipe_e708c271324a_executes_to_terminal :
    executesToTerminal recipe_e708c271324a = true := by decide

theorem recipe_e708c271324a_kernel_certificate :
    kernelCertified recipe_e708c271324a = true := by decide

end LeanToCook.SourceCatalog
