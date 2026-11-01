/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 黔式腊肠娃娃菜 · dishes/meat_dish/黔式腊肠娃娃菜/黔式腊肠娃娃菜.md -/
def recipe_f20a63e1bd7e : Recipe := {
  id := "f20a63e1bd7e"
  title := "黔式腊肠娃娃菜"
  category := "meat"
  sourcePath := "dishes/meat_dish/黔式腊肠娃娃菜/黔式腊肠娃娃菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "黔式腊肠",
    "娃娃菜"
  ]
  steps := [
    { index := 1, instruction := "锅内放入 750ml 水，开火加热至沸腾" },
    { index := 2, instruction := "放入腊肠，计时 13 分钟" },
    { index := 3, instruction := "放入娃娃菜，计时 2 分钟" },
    { index := 4, instruction := "关火，夹出腊肠及娃娃菜" },
    { index := 5, instruction := "娃娃菜切段、腊肠切片，装盘" }
  ]
}

theorem recipe_f20a63e1bd7e_ingredients_nonempty :
    recipe_f20a63e1bd7e.ingredients.isEmpty = false := by decide

theorem recipe_f20a63e1bd7e_steps_nonempty :
    recipe_f20a63e1bd7e.steps.isEmpty = false := by decide

theorem recipe_f20a63e1bd7e_step_count :
    recipe_f20a63e1bd7e.steps.length = 5 := by decide

theorem recipe_f20a63e1bd7e_steps_ordered :
    orderedFrom 1 recipe_f20a63e1bd7e.steps = true := by decide

theorem recipe_f20a63e1bd7e_executes_to_terminal :
    executesToTerminal recipe_f20a63e1bd7e = true := by decide

theorem recipe_f20a63e1bd7e_kernel_certificate :
    kernelCertified recipe_f20a63e1bd7e = true := by decide

end LeanToCook.SourceCatalog
