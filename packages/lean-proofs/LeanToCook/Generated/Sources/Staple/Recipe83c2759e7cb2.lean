/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 凉粉 · dishes/staple/凉粉/凉粉.md -/
def recipe_83c2759e7cb2 : Recipe := {
  id := "83c2759e7cb2"
  title := "凉粉"
  category := "staple"
  sourcePath := "dishes/staple/凉粉/凉粉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "豌豆淀粉",
    "大蒜",
    "小米辣",
    "辣椒粉",
    "酱油",
    "醋",
    "白糖",
    "鸡精",
    "盐",
    "花生碎",
    "香菜"
  ]
  steps := [
    { index := 1, instruction := "准备食材。" },
    { index := 2, instruction := "把豌豆淀粉和水各 100 克混合搅拌。" },
    { index := 3, instruction := "往锅中倒入 600g 水，大火煮开后转为小火。" },
    { index := 4, instruction := "倒入淀粉水，边倒边不断的搅拌，搅拌到浓稠且色泽均匀。" },
    { index := 5, instruction := "找一个容器，在容器中刷一层薄薄的食用油。" },
    { index := 6, instruction := "将煮好的淀粉倒入容器中冷藏 2-4 小时。" },
    { index := 7, instruction := "冷藏后取出，脱模，切条。" },
    { index := 8, instruction := "大蒜和小米辣剁成沫，放上 10g 辣椒粉，5g 花生碎，热油搅拌均匀。" },
    { index := 9, instruction := "再加入 10ml 酱油，10ml 醋，5g 白糖，3g 鸡精，3g 盐搅拌均匀。" },
    { index := 10, instruction := "将调味料倒在凉粉上，然后撒上香菜即可。" }
  ]
}

theorem recipe_83c2759e7cb2_ingredients_nonempty :
    recipe_83c2759e7cb2.ingredients.isEmpty = false := by decide

theorem recipe_83c2759e7cb2_steps_nonempty :
    recipe_83c2759e7cb2.steps.isEmpty = false := by decide

theorem recipe_83c2759e7cb2_step_count :
    recipe_83c2759e7cb2.steps.length = 10 := by decide

theorem recipe_83c2759e7cb2_steps_ordered :
    orderedFrom 1 recipe_83c2759e7cb2.steps = true := by decide

theorem recipe_83c2759e7cb2_executes_to_terminal :
    executesToTerminal recipe_83c2759e7cb2 = true := by decide

theorem recipe_83c2759e7cb2_kernel_certificate :
    kernelCertified recipe_83c2759e7cb2 = true := by decide

end LeanToCook.SourceCatalog
