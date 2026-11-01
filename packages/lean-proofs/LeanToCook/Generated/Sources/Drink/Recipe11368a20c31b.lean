/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 耙耙柑茶 · dishes/drink/耙耙柑茶/耙耙柑茶.md -/
def recipe_11368a20c31b : Recipe := {
  id := "11368a20c31b"
  title := "耙耙柑茶"
  category := "drink"
  sourcePath := "dishes/drink/耙耙柑茶/耙耙柑茶.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "原料:",
    "耙耙柑（替换物请看附加内容）",
    "茉莉绿茶",
    "冰块",
    "蔗糖糖浆（可选）",
    "工具",
    "搅拌机"
  ]
  steps := [
    { index := 1, instruction := "茉莉绿茶调配（推荐比例=>茶 : 水 : 冰 = 12 : 50 : 30）" },
    { index := 2, instruction := "正式调配" }
  ]
}

theorem recipe_11368a20c31b_ingredients_nonempty :
    recipe_11368a20c31b.ingredients.isEmpty = false := by decide

theorem recipe_11368a20c31b_steps_nonempty :
    recipe_11368a20c31b.steps.isEmpty = false := by decide

theorem recipe_11368a20c31b_step_count :
    recipe_11368a20c31b.steps.length = 2 := by decide

theorem recipe_11368a20c31b_steps_ordered :
    orderedFrom 1 recipe_11368a20c31b.steps = true := by decide

theorem recipe_11368a20c31b_executes_to_terminal :
    executesToTerminal recipe_11368a20c31b = true := by decide

theorem recipe_11368a20c31b_kernel_certificate :
    kernelCertified recipe_11368a20c31b = true := by decide

end LeanToCook.SourceCatalog
