/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 朱雀汤 · dishes/soup/朱雀汤/朱雀汤.md -/
def recipe_bb2673fc51ec : Recipe := {
  id := "bb2673fc51ec"
  title := "朱雀汤"
  category := "soup"
  sourcePath := "dishes/soup/朱雀汤/朱雀汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "香油（芝麻油）",
    "白糖",
    "水"
  ]
  steps := [
    { index := 1, instruction := "鸡蛋在碗中打散，再倒入香油。" },
    { index := 2, instruction := "水烧开后，在沸腾状态下快速倒入盛有鸡蛋的碗中。" },
    { index := 3, instruction := "放入白糖。" }
  ]
}

theorem recipe_bb2673fc51ec_ingredients_nonempty :
    recipe_bb2673fc51ec.ingredients.isEmpty = false := by decide

theorem recipe_bb2673fc51ec_steps_nonempty :
    recipe_bb2673fc51ec.steps.isEmpty = false := by decide

theorem recipe_bb2673fc51ec_step_count :
    recipe_bb2673fc51ec.steps.length = 3 := by decide

theorem recipe_bb2673fc51ec_steps_ordered :
    orderedFrom 1 recipe_bb2673fc51ec.steps = true := by decide

theorem recipe_bb2673fc51ec_executes_to_terminal :
    executesToTerminal recipe_bb2673fc51ec = true := by decide

theorem recipe_bb2673fc51ec_kernel_certificate :
    kernelCertified recipe_bb2673fc51ec = true := by decide

end LeanToCook.SourceCatalog
