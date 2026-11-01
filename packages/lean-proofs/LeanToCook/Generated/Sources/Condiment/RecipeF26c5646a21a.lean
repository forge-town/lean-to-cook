/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 糖醋汁 · dishes/condiment/糖醋汁.md -/
def recipe_f26c5646a21a : Recipe := {
  id := "f26c5646a21a"
  title := "糖醋汁"
  category := "condiment"
  sourcePath := "dishes/condiment/糖醋汁.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "清水",
    "白糖",
    "白醋/米醋",
    "料酒",
    "生抽"
  ]
  steps := [
    { index := 1, instruction := "按照比例将各调料在小碗中搅拌均匀" },
    { index := 2, instruction := "按不同菜肴的方式处理完毕后，将配制好的糖醋汁倒入锅中" },
    { index := 3, instruction := "根据各菜肴的不同，烹制 5-10 分钟" },
    { index := 4, instruction := "大火收汁，可增加菜的浓度、香味和光泽" }
  ]
}

theorem recipe_f26c5646a21a_ingredients_nonempty :
    recipe_f26c5646a21a.ingredients.isEmpty = false := by decide

theorem recipe_f26c5646a21a_steps_nonempty :
    recipe_f26c5646a21a.steps.isEmpty = false := by decide

theorem recipe_f26c5646a21a_step_count :
    recipe_f26c5646a21a.steps.length = 4 := by decide

theorem recipe_f26c5646a21a_steps_ordered :
    orderedFrom 1 recipe_f26c5646a21a.steps = true := by decide

theorem recipe_f26c5646a21a_executes_to_terminal :
    executesToTerminal recipe_f26c5646a21a = true := by decide

theorem recipe_f26c5646a21a_kernel_certificate :
    kernelCertified recipe_f26c5646a21a = true := by decide

end LeanToCook.SourceCatalog
