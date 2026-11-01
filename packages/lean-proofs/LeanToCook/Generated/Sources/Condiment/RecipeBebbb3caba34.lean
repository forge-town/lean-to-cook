/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 油酥 · dishes/condiment/油酥.md -/
def recipe_bebbb3caba34 : Recipe := {
  id := "bebbb3caba34"
  title := "油酥"
  category := "condiment"
  sourcePath := "dishes/condiment/油酥.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "面粉",
    "油",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "面粉盛小碗里，加入盐" },
    { index := 2, instruction := "加入 200 度的热油" },
    { index := 3, instruction := "用筷子将其搅拌成无固状物体的糊状。" }
  ]
}

theorem recipe_bebbb3caba34_ingredients_nonempty :
    recipe_bebbb3caba34.ingredients.isEmpty = false := by decide

theorem recipe_bebbb3caba34_steps_nonempty :
    recipe_bebbb3caba34.steps.isEmpty = false := by decide

theorem recipe_bebbb3caba34_step_count :
    recipe_bebbb3caba34.steps.length = 3 := by decide

theorem recipe_bebbb3caba34_steps_ordered :
    orderedFrom 1 recipe_bebbb3caba34.steps = true := by decide

theorem recipe_bebbb3caba34_executes_to_terminal :
    executesToTerminal recipe_bebbb3caba34 = true := by decide

theorem recipe_bebbb3caba34_kernel_certificate :
    kernelCertified recipe_bebbb3caba34 = true := by decide

end LeanToCook.SourceCatalog
