/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 草莓酱 · dishes/condiment/草莓酱/草莓酱.md -/
def recipe_6674e52ce5ac : Recipe := {
  id := "6674e52ce5ac"
  title := "草莓酱"
  category := "condiment"
  sourcePath := "dishes/condiment/草莓酱/草莓酱.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "草莓",
    "白砂糖",
    "保鲜膜"
  ]
  steps := [
    { index := 1, instruction := "草莓洗净去叶" },
    { index := 2, instruction := "将草莓切碎放入合适的碗中" },
    { index := 3, instruction := "将白糖倒入碗中与草莓搅拌均匀" },
    { index := 4, instruction := "碗用保鲜膜覆盖静置 1 小时" },
    { index := 5, instruction := "将静置的草莓和糖的混合物倒入不粘锅中开大火烧开" },
    { index := 6, instruction := "烧开后转小火不断搅拌直至果酱呈粘稠状关火" },
    { index := 7, instruction := "待草莓酱冷却后装入准备好的密封罐中" }
  ]
}

theorem recipe_6674e52ce5ac_ingredients_nonempty :
    recipe_6674e52ce5ac.ingredients.isEmpty = false := by decide

theorem recipe_6674e52ce5ac_steps_nonempty :
    recipe_6674e52ce5ac.steps.isEmpty = false := by decide

theorem recipe_6674e52ce5ac_step_count :
    recipe_6674e52ce5ac.steps.length = 7 := by decide

theorem recipe_6674e52ce5ac_steps_ordered :
    orderedFrom 1 recipe_6674e52ce5ac.steps = true := by decide

theorem recipe_6674e52ce5ac_executes_to_terminal :
    executesToTerminal recipe_6674e52ce5ac = true := by decide

theorem recipe_6674e52ce5ac_kernel_certificate :
    kernelCertified recipe_6674e52ce5ac = true := by decide

end LeanToCook.SourceCatalog
