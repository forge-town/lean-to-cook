/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 吐司果酱 · dishes/breakfast/吐司果酱.md -/
def recipe_a1ba8de42384 : Recipe := {
  id := "a1ba8de42384"
  title := "吐司果酱"
  category := "breakfast"
  sourcePath := "dishes/breakfast/吐司果酱.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "新鲜吐司",
    "果酱",
    "面包机"
  ]
  steps := [
    { index := 1, instruction := "将吐司放入面包机" },
    { index := 2, instruction := "设置好档位，时间到了会自动弹出" },
    { index := 3, instruction := "两分钟后吐司加热完成弹出" },
    { index := 4, instruction := "先取出一片吐司，涂满果酱再盖上另一片吐司即可" },
    { index := 5, instruction := "用餐巾纸包一下可以边走边吃也可以吃完再出门" }
  ]
}

theorem recipe_a1ba8de42384_ingredients_nonempty :
    recipe_a1ba8de42384.ingredients.isEmpty = false := by decide

theorem recipe_a1ba8de42384_steps_nonempty :
    recipe_a1ba8de42384.steps.isEmpty = false := by decide

theorem recipe_a1ba8de42384_step_count :
    recipe_a1ba8de42384.steps.length = 5 := by decide

theorem recipe_a1ba8de42384_steps_ordered :
    orderedFrom 1 recipe_a1ba8de42384.steps = true := by decide

theorem recipe_a1ba8de42384_executes_to_terminal :
    executesToTerminal recipe_a1ba8de42384 = true := by decide

theorem recipe_a1ba8de42384_kernel_certificate :
    kernelCertified recipe_a1ba8de42384 = true := by decide

end LeanToCook.SourceCatalog
