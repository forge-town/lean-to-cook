/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 电饭煲蒸米饭 · dishes/staple/米饭/电饭煲蒸米饭.md -/
def recipe_cf3dabc066de : Recipe := {
  id := "cf3dabc066de"
  title := "电饭煲蒸米饭"
  category := "staple"
  sourcePath := "dishes/staple/米饭/电饭煲蒸米饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "电饭煲",
    "江南米或北方大米",
    "水"
  ]
  steps := [
    { index := 1, instruction := "清洗米" },
    { index := 2, instruction := "将米和水一起加入电饭煲中。" },
    { index := 3, instruction := "连接电饭煲电源，进入加热模式。等待大约 30 分钟。" },
    { index := 4, instruction := "待电饭煲自动进入保温模式后。" },
    { index := 5, instruction := "将米在电饭煲中闷 10-15 分钟。" },
    { index := 6, instruction := "盛出米。" }
  ]
}

theorem recipe_cf3dabc066de_ingredients_nonempty :
    recipe_cf3dabc066de.ingredients.isEmpty = false := by decide

theorem recipe_cf3dabc066de_steps_nonempty :
    recipe_cf3dabc066de.steps.isEmpty = false := by decide

theorem recipe_cf3dabc066de_step_count :
    recipe_cf3dabc066de.steps.length = 6 := by decide

theorem recipe_cf3dabc066de_steps_ordered :
    orderedFrom 1 recipe_cf3dabc066de.steps = true := by decide

theorem recipe_cf3dabc066de_executes_to_terminal :
    executesToTerminal recipe_cf3dabc066de = true := by decide

theorem recipe_cf3dabc066de_kernel_certificate :
    kernelCertified recipe_cf3dabc066de = true := by decide

end LeanToCook.SourceCatalog
