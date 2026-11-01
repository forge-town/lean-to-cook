/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- Mojito莫吉托 · dishes/drink/Mojito莫吉托.md -/
def recipe_b8b6c7d1722e : Recipe := {
  id := "b8b6c7d1722e"
  title := "Mojito莫吉托"
  category := "drink"
  sourcePath := "dishes/drink/Mojito莫吉托.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "打碎的冰块",
    "冰镇苏打水",
    "压汁器",
    "海波杯",
    "研杵"
  ]
  steps := [
    { index := 1, instruction := "将切成半块的青柠之一切成小块，放入海波杯，随后用研杵将其捣出汁；" },
    { index := 2, instruction := "用 3-4 珠薄荷叶沿着杯口涂抹，随后将其放入杯中；" },
    { index := 3, instruction := "加入 糖浆 20ml；" },
    { index := 4, instruction := "加入 金色朗姆酒 45ml；" },
    { index := 5, instruction := "将剩下的半块青柠压出汁水放入杯中；" },
    { index := 6, instruction := "轻轻搅拌，使砂糖/糖浆处于半融合状态；" },
    { index := 7, instruction := "将打碎的冰块放入杯中，直到占杯中 3/4；" },
    { index := 8, instruction := "加入冰镇苏打水直到刚好淹没碎冰；" },
    { index := 9, instruction := "旋转搅拌半分钟；" },
    { index := 10, instruction := "使用碎冰将海波杯补满；" },
    { index := 11, instruction := "将剩下的一株薄荷叶拍醒，插入碎冰，作装饰。" }
  ]
}

theorem recipe_b8b6c7d1722e_ingredients_nonempty :
    recipe_b8b6c7d1722e.ingredients.isEmpty = false := by decide

theorem recipe_b8b6c7d1722e_steps_nonempty :
    recipe_b8b6c7d1722e.steps.isEmpty = false := by decide

theorem recipe_b8b6c7d1722e_step_count :
    recipe_b8b6c7d1722e.steps.length = 11 := by decide

theorem recipe_b8b6c7d1722e_steps_ordered :
    orderedFrom 1 recipe_b8b6c7d1722e.steps = true := by decide

theorem recipe_b8b6c7d1722e_executes_to_terminal :
    executesToTerminal recipe_b8b6c7d1722e = true := by decide

theorem recipe_b8b6c7d1722e_kernel_certificate :
    kernelCertified recipe_b8b6c7d1722e = true := by decide

end LeanToCook.SourceCatalog
