/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 烤箱版巴斯克芝士蛋糕 · dishes/dessert/烤箱版巴斯克芝士蛋糕/烤箱版巴斯克芝士蛋糕.md -/
def recipe_5112cfeefccc : Recipe := {
  id := "5112cfeefccc"
  title := "烤箱版巴斯克芝士蛋糕"
  category := "dessert"
  sourcePath := "dishes/dessert/烤箱版巴斯克芝士蛋糕/烤箱版巴斯克芝士蛋糕.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "奶油奶酪：212g （这是一块的质量，比较方便，原教程是 250g）",
    "白砂糖：60g",
    "鸡蛋：2 个",
    "鸡蛋黄：1 个",
    "淡奶油：120g",
    "低筋面粉：10g",
    "巧克力：38g（只尝试过将普通巧克力融化，在淡奶油那一步加入搅拌均匀即可）"
  ]
  steps := [
    { index := 1, instruction := "奶油奶酪软化，微波炉 10s + 10s。" },
    { index := 2, instruction := "奶油奶酪加入白砂糖，打蛋器打至顺滑。" },
    { index := 3, instruction := "加入 2 个全蛋 + 1 个蛋黄，搅拌均匀。" },
    { index := 4, instruction := "加入淡奶油，搅拌均匀。" },
    { index := 5, instruction := "加入低筋面粉，搅拌均匀。" },
    { index := 6, instruction := "烤箱 220°(425°F)，20 - 25 分钟（本人一般 20 或者 22 分钟）。" },
    { index := 7, instruction := "放凉之后放入冰箱，最好过夜。" }
  ]
}

theorem recipe_5112cfeefccc_ingredients_nonempty :
    recipe_5112cfeefccc.ingredients.isEmpty = false := by decide

theorem recipe_5112cfeefccc_steps_nonempty :
    recipe_5112cfeefccc.steps.isEmpty = false := by decide

theorem recipe_5112cfeefccc_step_count :
    recipe_5112cfeefccc.steps.length = 7 := by decide

theorem recipe_5112cfeefccc_steps_ordered :
    orderedFrom 1 recipe_5112cfeefccc.steps = true := by decide

theorem recipe_5112cfeefccc_executes_to_terminal :
    executesToTerminal recipe_5112cfeefccc = true := by decide

theorem recipe_5112cfeefccc_kernel_certificate :
    kernelCertified recipe_5112cfeefccc = true := by decide

end LeanToCook.SourceCatalog
