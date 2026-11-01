/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 意式肉酱面 · dishes/staple/意式肉酱面/意式肉酱面.md -/
def recipe_1a5309d32c90 : Recipe := {
  id := "1a5309d32c90"
  title := "意式肉酱面"
  category := "staple"
  sourcePath := "dishes/staple/意式肉酱面/意式肉酱面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "意大利面",
    "意大利面酱",
    "肉沫",
    "白洋葱（紫洋葱也可以）"
  ]
  steps := [
    { index := 1, instruction := "锅中加水，烧开后放入意面（等待 6 - 12 分钟）" },
    { index := 2, instruction := "在烧水的时候可以进行下面这些步骤，但请注意煮面的时间" },
    { index := 3, instruction := "洋葱切成小丁" },
    { index := 4, instruction := "空锅中倒油，中火下入洋葱碎" },
    { index := 5, instruction := "时刻搅拌，注意不要让洋葱烧糊，直到洋葱变成半透明状" },
    { index := 6, instruction := "下入肉沫，继续搅拌（搅散），直到肉末变成棕色" },
    { index := 7, instruction := "加入意大利面酱，稍微搅拌一下即可" },
    { index := 8, instruction := "把煮好的意大利面沥干水分并倒入肉酱中搅拌均匀即可（或者直接把做好的肉酱倒在意面上也行）" }
  ]
}

theorem recipe_1a5309d32c90_ingredients_nonempty :
    recipe_1a5309d32c90.ingredients.isEmpty = false := by decide

theorem recipe_1a5309d32c90_steps_nonempty :
    recipe_1a5309d32c90.steps.isEmpty = false := by decide

theorem recipe_1a5309d32c90_step_count :
    recipe_1a5309d32c90.steps.length = 8 := by decide

theorem recipe_1a5309d32c90_steps_ordered :
    orderedFrom 1 recipe_1a5309d32c90.steps = true := by decide

theorem recipe_1a5309d32c90_executes_to_terminal :
    executesToTerminal recipe_1a5309d32c90 = true := by decide

theorem recipe_1a5309d32c90_kernel_certificate :
    kernelCertified recipe_1a5309d32c90 = true := by decide

end LeanToCook.SourceCatalog
