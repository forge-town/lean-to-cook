/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 杨枝甘露 · dishes/drink/杨枝甘露.md -/
def recipe_e403ba22275a : Recipe := {
  id := "e403ba22275a"
  title := "杨枝甘露"
  category := "drink"
  sourcePath := "dishes/drink/杨枝甘露.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "杯子",
    "水果刀",
    "牛奶",
    "冰块",
    "调理机/果汁机"
  ]
  steps := [
    { index := 1, instruction := "奇亚籽泡牛奶 10 分钟。" },
    { index := 2, instruction := "泡籽之时，把半粒芒果、葡萄柚去皮切丁，放入杯中。" },
    { index := 3, instruction := "半粒芒果切小块放入调理机加冰块、椰奶打成泥。" },
    { index := 4, instruction := "倒入杯中，放上点缀材料（如有）。" },
    { index := 5, instruction := "一边享用一边写代码！！" }
  ]
}

theorem recipe_e403ba22275a_ingredients_nonempty :
    recipe_e403ba22275a.ingredients.isEmpty = false := by decide

theorem recipe_e403ba22275a_steps_nonempty :
    recipe_e403ba22275a.steps.isEmpty = false := by decide

theorem recipe_e403ba22275a_step_count :
    recipe_e403ba22275a.steps.length = 5 := by decide

theorem recipe_e403ba22275a_steps_ordered :
    orderedFrom 1 recipe_e403ba22275a.steps = true := by decide

theorem recipe_e403ba22275a_executes_to_terminal :
    executesToTerminal recipe_e403ba22275a = true := by decide

theorem recipe_e403ba22275a_kernel_certificate :
    kernelCertified recipe_e403ba22275a = true := by decide

end LeanToCook.SourceCatalog
