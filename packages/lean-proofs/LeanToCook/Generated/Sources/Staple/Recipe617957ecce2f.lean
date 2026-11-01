/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 老干妈拌面 · dishes/staple/老干妈拌面.md -/
def recipe_617957ecce2f : Recipe := {
  id := "617957ecce2f"
  title := "老干妈拌面"
  category := "staple"
  sourcePath := "dishes/staple/老干妈拌面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "面",
    "老干妈",
    "酱油"
  ]
  steps := [
    { index := 1, instruction := "将水倒入锅中并煮沸" },
    { index := 2, instruction := "将面均匀放入锅中" },
    { index := 3, instruction := "在煮的过程注意搅拌，避免面粘成一坨" },
    { index := 4, instruction := "当用筷子挑起一根面且该面能自然地从筷子上滑落时再等 30 秒关火" },
    { index := 5, instruction := "将面夹入碗中" },
    { index := 6, instruction := "按照上面的计量放入老干妈和酱油" },
    { index := 7, instruction := "用筷子将碗里的面、老干妈、酱油拌均匀" },
    { index := 8, instruction := "吃" }
  ]
}

theorem recipe_617957ecce2f_ingredients_nonempty :
    recipe_617957ecce2f.ingredients.isEmpty = false := by decide

theorem recipe_617957ecce2f_steps_nonempty :
    recipe_617957ecce2f.steps.isEmpty = false := by decide

theorem recipe_617957ecce2f_step_count :
    recipe_617957ecce2f.steps.length = 8 := by decide

theorem recipe_617957ecce2f_steps_ordered :
    orderedFrom 1 recipe_617957ecce2f.steps = true := by decide

theorem recipe_617957ecce2f_executes_to_terminal :
    executesToTerminal recipe_617957ecce2f = true := by decide

theorem recipe_617957ecce2f_kernel_certificate :
    kernelCertified recipe_617957ecce2f = true := by decide

end LeanToCook.SourceCatalog
