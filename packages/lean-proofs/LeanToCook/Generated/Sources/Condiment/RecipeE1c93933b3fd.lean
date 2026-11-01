/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蔗糖糖浆 · dishes/condiment/蔗糖糖浆/蔗糖糖浆.md -/
def recipe_e1c93933b3fd : Recipe := {
  id := "e1c93933b3fd"
  title := "蔗糖糖浆"
  category := "condiment"
  sourcePath := "dishes/condiment/蔗糖糖浆/蔗糖糖浆.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "白砂糖",
    "水",
    "可密封容器（建议使用高硼硅试剂瓶，便宜）"
  ]
  steps := [
    { index := 1, instruction := "将称好的白砂糖的饮用水于容器混匀" },
    { index := 2, instruction := "容器封盖放冰箱冷藏" }
  ]
}

theorem recipe_e1c93933b3fd_ingredients_nonempty :
    recipe_e1c93933b3fd.ingredients.isEmpty = false := by decide

theorem recipe_e1c93933b3fd_steps_nonempty :
    recipe_e1c93933b3fd.steps.isEmpty = false := by decide

theorem recipe_e1c93933b3fd_step_count :
    recipe_e1c93933b3fd.steps.length = 2 := by decide

theorem recipe_e1c93933b3fd_steps_ordered :
    orderedFrom 1 recipe_e1c93933b3fd.steps = true := by decide

theorem recipe_e1c93933b3fd_executes_to_terminal :
    executesToTerminal recipe_e1c93933b3fd = true := by decide

theorem recipe_e1c93933b3fd_kernel_certificate :
    kernelCertified recipe_e1c93933b3fd = true := by decide

end LeanToCook.SourceCatalog
