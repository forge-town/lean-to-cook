/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 米粥 · dishes/soup/米粥.md -/
def recipe_196eab378a75 : Recipe := {
  id := "196eab378a75"
  title := "米粥"
  category := "soup"
  sourcePath := "dishes/soup/米粥.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "米",
    "水",
    "植物油（可选）"
  ]
  steps := [
    { index := 1, instruction := "（可选）将 Mo ml 的油与洗净的米混合，尽量确保完全混合，即每粒米上至少都沾上少量油" },
    { index := 2, instruction := "（可选）将 米-油混合物品冷藏保存，冷藏时间 Tc。" },
    { index := 3, instruction := "将米和水加入锅中。" },
    { index := 4, instruction := "开大火，加热到 T1。" },
    { index := 5, instruction := "在 T1 之前将火关小。如果忘记此步骤，水可能会漫出而熄灭火焰。非常危险！" },
    { index := 6, instruction := "加热到 Tr。在 Tr 时关闭火源。" }
  ]
}

theorem recipe_196eab378a75_ingredients_nonempty :
    recipe_196eab378a75.ingredients.isEmpty = false := by decide

theorem recipe_196eab378a75_steps_nonempty :
    recipe_196eab378a75.steps.isEmpty = false := by decide

theorem recipe_196eab378a75_step_count :
    recipe_196eab378a75.steps.length = 6 := by decide

theorem recipe_196eab378a75_steps_ordered :
    orderedFrom 1 recipe_196eab378a75.steps = true := by decide

theorem recipe_196eab378a75_executes_to_terminal :
    executesToTerminal recipe_196eab378a75 = true := by decide

theorem recipe_196eab378a75_kernel_certificate :
    kernelCertified recipe_196eab378a75 = true := by decide

end LeanToCook.SourceCatalog
