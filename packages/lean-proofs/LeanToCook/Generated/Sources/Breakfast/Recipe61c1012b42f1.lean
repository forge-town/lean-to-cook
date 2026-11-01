/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蛋煎糍粑 · dishes/breakfast/蛋煎糍粑.md -/
def recipe_61c1012b42f1 : Recipe := {
  id := "61c1012b42f1"
  title := "蛋煎糍粑"
  category := "breakfast"
  sourcePath := "dishes/breakfast/蛋煎糍粑.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "糍粑",
    "白糖或红糖"
  ]
  steps := [
    { index := 1, instruction := "把糍粑切成长方形小块，便于后面煎" },
    { index := 2, instruction := "碗里打入一个鸡蛋并把鸡蛋搅碎，加入 2g 食用盐" },
    { index := 3, instruction := "将切好的小糍粑依此放入搅碎的鸡蛋里面，涂抹完糍粑双面为止" },
    { index := 4, instruction := "锅里倒入植物油 10ml ，把涂抹好的糍粑小块放进去小火慢慢煎软。" },
    { index := 5, instruction := "将剩下的鸡蛋液慢慢倒在糍粑表面" },
    { index := 6, instruction := "用筷子或者勺子为糍粑翻面，来回煎至金黄色后开吃" }
  ]
}

theorem recipe_61c1012b42f1_ingredients_nonempty :
    recipe_61c1012b42f1.ingredients.isEmpty = false := by decide

theorem recipe_61c1012b42f1_steps_nonempty :
    recipe_61c1012b42f1.steps.isEmpty = false := by decide

theorem recipe_61c1012b42f1_step_count :
    recipe_61c1012b42f1.steps.length = 6 := by decide

theorem recipe_61c1012b42f1_steps_ordered :
    orderedFrom 1 recipe_61c1012b42f1.steps = true := by decide

theorem recipe_61c1012b42f1_executes_to_terminal :
    executesToTerminal recipe_61c1012b42f1 = true := by decide

theorem recipe_61c1012b42f1_kernel_certificate :
    kernelCertified recipe_61c1012b42f1 = true := by decide

end LeanToCook.SourceCatalog
