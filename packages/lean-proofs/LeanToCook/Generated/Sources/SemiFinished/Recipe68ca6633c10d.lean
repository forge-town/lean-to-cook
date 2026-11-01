/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 速冻汤圆 · dishes/semi-finished/速冻汤圆/速冻汤圆.md -/
def recipe_68ca6633c10d : Recipe := {
  id := "68ca6633c10d"
  title := "速冻汤圆"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/速冻汤圆/速冻汤圆.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "速冻汤圆",
    "微波炉"
  ]
  steps := [
    { index := 1, instruction := "取出速冻汤圆，放入碗中。" },
    { index := 2, instruction := "倒入开水，直至浸没汤圆。" },
    { index := 3, instruction := "微波炉高火 4 分钟。" },
    { index := 4, instruction := "假如汤圆均已吸水膨胀，则已熟。" },
    { index := 5, instruction := "如果没熟，再加热 1 分钟。" }
  ]
}

theorem recipe_68ca6633c10d_ingredients_nonempty :
    recipe_68ca6633c10d.ingredients.isEmpty = false := by decide

theorem recipe_68ca6633c10d_steps_nonempty :
    recipe_68ca6633c10d.steps.isEmpty = false := by decide

theorem recipe_68ca6633c10d_step_count :
    recipe_68ca6633c10d.steps.length = 5 := by decide

theorem recipe_68ca6633c10d_steps_ordered :
    orderedFrom 1 recipe_68ca6633c10d.steps = true := by decide

theorem recipe_68ca6633c10d_executes_to_terminal :
    executesToTerminal recipe_68ca6633c10d = true := by decide

theorem recipe_68ca6633c10d_kernel_certificate :
    kernelCertified recipe_68ca6633c10d = true := by decide

end LeanToCook.SourceCatalog
