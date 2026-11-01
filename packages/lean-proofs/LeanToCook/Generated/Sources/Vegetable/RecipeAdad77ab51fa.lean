/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒滑蛋 · dishes/vegetable_dish/炒滑蛋/炒滑蛋.md -/
def recipe_adad77ab51fa : Recipe := {
  id := "adad77ab51fa"
  title := "炒滑蛋"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/炒滑蛋/炒滑蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋（最好是无菌蛋）",
    "牛奶"
  ]
  steps := [
    { index := 1, instruction := "鸡蛋加入牛奶以及 5ml 食用油搅拌均匀，备用" },
    { index := 2, instruction := "大火烧热平底锅约 30s, 加入 5ml 食用油" },
    { index := 3, instruction := "烧 30s 转小火, 并且放入搅拌好的鸡蛋" },
    { index := 4, instruction := "在锅中静置 5 秒后，用锅铲将蛋液从边缘缓慢推向中间" },
    { index := 5, instruction := "翻炒至鸡蛋大致凝固后关火，装盘" }
  ]
}

theorem recipe_adad77ab51fa_ingredients_nonempty :
    recipe_adad77ab51fa.ingredients.isEmpty = false := by decide

theorem recipe_adad77ab51fa_steps_nonempty :
    recipe_adad77ab51fa.steps.isEmpty = false := by decide

theorem recipe_adad77ab51fa_step_count :
    recipe_adad77ab51fa.steps.length = 5 := by decide

theorem recipe_adad77ab51fa_steps_ordered :
    orderedFrom 1 recipe_adad77ab51fa.steps = true := by decide

theorem recipe_adad77ab51fa_executes_to_terminal :
    executesToTerminal recipe_adad77ab51fa = true := by decide

theorem recipe_adad77ab51fa_kernel_certificate :
    kernelCertified recipe_adad77ab51fa = true := by decide

end LeanToCook.SourceCatalog
