/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 肉饼炖蛋 · dishes/meat_dish/肉饼炖蛋.md -/
def recipe_1e8e59b9e765 : Recipe := {
  id := "1e8e59b9e765"
  title := "肉饼炖蛋"
  category := "meat"
  sourcePath := "dishes/meat_dish/肉饼炖蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪肉末",
    "鸡蛋",
    "料酒",
    "生抽",
    "白胡椒粉",
    "芝麻香油"
  ]
  steps := [
    { index := 1, instruction := "在碗中加入猪肉末、料酒、生抽、白胡椒粉、鸡蛋和芝麻香油，搅拌均匀。" },
    { index := 2, instruction := "将调好味的猪肉末铺在盘子里，肉末中间用勺子挖一个洞，往洞中打入 1 个鸡蛋。" },
    { index := 3, instruction := "锅中加水至 1/4 高度，水烧开后，将盘子放入锅中，盖上锅盖，蒸 15 分钟。" }
  ]
}

theorem recipe_1e8e59b9e765_ingredients_nonempty :
    recipe_1e8e59b9e765.ingredients.isEmpty = false := by decide

theorem recipe_1e8e59b9e765_steps_nonempty :
    recipe_1e8e59b9e765.steps.isEmpty = false := by decide

theorem recipe_1e8e59b9e765_step_count :
    recipe_1e8e59b9e765.steps.length = 3 := by decide

theorem recipe_1e8e59b9e765_steps_ordered :
    orderedFrom 1 recipe_1e8e59b9e765.steps = true := by decide

theorem recipe_1e8e59b9e765_executes_to_terminal :
    executesToTerminal recipe_1e8e59b9e765 = true := by decide

theorem recipe_1e8e59b9e765_kernel_certificate :
    kernelCertified recipe_1e8e59b9e765 = true := by decide

end LeanToCook.SourceCatalog
