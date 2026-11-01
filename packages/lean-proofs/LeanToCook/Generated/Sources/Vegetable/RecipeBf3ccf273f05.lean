/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 油醋爆蛋 · dishes/vegetable_dish/油醋爆蛋.md -/
def recipe_bf3ccf273f05 : Recipe := {
  id := "bf3ccf273f05"
  title := "油醋爆蛋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/油醋爆蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "小米辣",
    "小葱",
    "蒜",
    "油",
    "香醋",
    "生抽",
    "蚝油（可选但推荐）",
    "白糖（可选）"
  ]
  steps := [
    { index := 1, instruction := "鸡蛋不需打散，直接打入碗中备用" },
    { index := 2, instruction := "香葱切 3cm 长小段即可" },
    { index := 3, instruction := "蒜瓣和小米辣放入打蒜器，打成沫" },
    { index := 4, instruction := "将香醋、生抽、蚝油、白糖、水加入小碗，搅拌均匀作为糖醋料汁" },
    { index := 5, instruction := "油热倒入鸡蛋，等鸡蛋凝固之后铲成大块，倒入蒜沫、小米辣沫、倒入糖醋料汁" },
    { index := 6, instruction := "大火收汁、快出锅时加入葱段即可" }
  ]
}

theorem recipe_bf3ccf273f05_ingredients_nonempty :
    recipe_bf3ccf273f05.ingredients.isEmpty = false := by decide

theorem recipe_bf3ccf273f05_steps_nonempty :
    recipe_bf3ccf273f05.steps.isEmpty = false := by decide

theorem recipe_bf3ccf273f05_step_count :
    recipe_bf3ccf273f05.steps.length = 6 := by decide

theorem recipe_bf3ccf273f05_steps_ordered :
    orderedFrom 1 recipe_bf3ccf273f05.steps = true := by decide

theorem recipe_bf3ccf273f05_executes_to_terminal :
    executesToTerminal recipe_bf3ccf273f05 = true := by decide

theorem recipe_bf3ccf273f05_kernel_certificate :
    kernelCertified recipe_bf3ccf273f05 = true := by decide

end LeanToCook.SourceCatalog
