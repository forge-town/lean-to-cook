/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 燕麦鸡蛋饼 · dishes/breakfast/燕麦鸡蛋饼.md -/
def recipe_515e68668fde : Recipe := {
  id := "515e68668fde"
  title := "燕麦鸡蛋饼"
  category := "breakfast"
  sourcePath := "dishes/breakfast/燕麦鸡蛋饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "燕麦",
    "牛奶 50-100g，能够将燕麦搅拌粘稠即可",
    "可根据口味选择增加 50g 蔬菜，如菠菜。"
  ]
  steps := [
    { index := 1, instruction := "将牛奶与干燕麦混合搅拌均匀至黏稠状。" },
    { index := 2, instruction := "将鸡蛋搅拌均匀至颜色单一程度。" },
    { index := 3, instruction := "将鸡蛋液倒入燕麦牛奶中继续搅拌至黏稠、均匀。" },
    { index := 4, instruction := "平底锅中加入一层黄油并覆盖均匀。" },
    { index := 5, instruction := "下入搅拌好的食材，并摊开至饼状。" },
    { index := 6, instruction := "小火加热两到三分钟。如想要加入蔬菜，可以在加热过程中加入碎菜叶。" },
    { index := 7, instruction := "翻面继续加热两分钟。" },
    { index := 8, instruction := "出锅，搭配剩下的牛奶作为早餐。" }
  ]
}

theorem recipe_515e68668fde_ingredients_nonempty :
    recipe_515e68668fde.ingredients.isEmpty = false := by decide

theorem recipe_515e68668fde_steps_nonempty :
    recipe_515e68668fde.steps.isEmpty = false := by decide

theorem recipe_515e68668fde_step_count :
    recipe_515e68668fde.steps.length = 8 := by decide

theorem recipe_515e68668fde_steps_ordered :
    orderedFrom 1 recipe_515e68668fde.steps = true := by decide

theorem recipe_515e68668fde_executes_to_terminal :
    executesToTerminal recipe_515e68668fde = true := by decide

theorem recipe_515e68668fde_kernel_certificate :
    kernelCertified recipe_515e68668fde = true := by decide

end LeanToCook.SourceCatalog
