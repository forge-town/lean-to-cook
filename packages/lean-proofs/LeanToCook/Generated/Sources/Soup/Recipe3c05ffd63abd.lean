/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 勾芡香菇汤 · dishes/soup/勾芡香菇汤/勾芡香菇汤.md -/
def recipe_3c05ffd63abd : Recipe := {
  id := "3c05ffd63abd"
  title := "勾芡香菇汤"
  category := "soup"
  sourcePath := "dishes/soup/勾芡香菇汤/勾芡香菇汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "香菇",
    "香葱",
    "食用油",
    "食用盐",
    "鸡精",
    "生粉"
  ]
  steps := [
    { index := 1, instruction := "香菇切片（每片厚度 0.5-1 cm,厚点相对薄点更有嚼劲），放入大碗中，倒入 2g 食用盐 浸泡 15 分钟" },
    { index := 2, instruction := "生粉倒入小碗中，加入 50ml 水，搅拌生粉直至融化没有颗粒（即水淀粉）" },
    { index := 3, instruction := "倒掉碗中的盐水，适当去掉香菇本身的水分（方便下一步煎炸）【可选】" },
    { index := 4, instruction := "小火，倒入油，待油开始冒小泡（小火 30s ，看每个锅的功率），倒入香菇，每面煎 10s 【可选】" },
    { index := 5, instruction := "倒入开水 300ml ，调中火再煮 3-5 分钟" },
    { index := 6, instruction := "倒入水淀粉，适当搅拌锅中汤汁后，加入 3g 盐、3 g ，最后撒上葱花出锅" }
  ]
}

theorem recipe_3c05ffd63abd_ingredients_nonempty :
    recipe_3c05ffd63abd.ingredients.isEmpty = false := by decide

theorem recipe_3c05ffd63abd_steps_nonempty :
    recipe_3c05ffd63abd.steps.isEmpty = false := by decide

theorem recipe_3c05ffd63abd_step_count :
    recipe_3c05ffd63abd.steps.length = 6 := by decide

theorem recipe_3c05ffd63abd_steps_ordered :
    orderedFrom 1 recipe_3c05ffd63abd.steps = true := by decide

theorem recipe_3c05ffd63abd_executes_to_terminal :
    executesToTerminal recipe_3c05ffd63abd = true := by decide

theorem recipe_3c05ffd63abd_kernel_certificate :
    kernelCertified recipe_3c05ffd63abd = true := by decide

end LeanToCook.SourceCatalog
