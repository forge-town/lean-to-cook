/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鸡蛋花 · dishes/vegetable_dish/鸡蛋花/鸡蛋花.md -/
def recipe_a1b5c702a812 : Recipe := {
  id := "a1b5c702a812"
  title := "鸡蛋花"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/鸡蛋花/鸡蛋花.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "白糖 （可选，制作甜口）",
    "食盐 （可选，制作咸口）",
    "搅拌器 （可选）"
  ]
  steps := [
    { index := 1, instruction := "将鸡蛋打入碗中。" },
    { index := 2, instruction := "使用筷子或搅拌器，顺着一个方向搅打蛋液，直至蛋清与蛋黄完全混合均匀，颜色一致。（此过程约需 1 - 2 分钟）" },
    { index := 3, instruction := "将糖或盐等调味料加入蛋液中，略微搅匀。" },
    { index := 4, instruction := "准备刚烧开的、100 ℃ 的沸水。" },
    { index := 5, instruction := "一边用筷子快速搅拌碗中的蛋液，一边将沸水以细流状冲入蛋液中。确保沸水与蛋液充分混合。" },
    { index := 6, instruction := "持续搅拌片刻，直至蛋液被完全烫熟，形成均匀的淡黄色蛋花。" }
  ]
}

theorem recipe_a1b5c702a812_ingredients_nonempty :
    recipe_a1b5c702a812.ingredients.isEmpty = false := by decide

theorem recipe_a1b5c702a812_steps_nonempty :
    recipe_a1b5c702a812.steps.isEmpty = false := by decide

theorem recipe_a1b5c702a812_step_count :
    recipe_a1b5c702a812.steps.length = 6 := by decide

theorem recipe_a1b5c702a812_steps_ordered :
    orderedFrom 1 recipe_a1b5c702a812.steps = true := by decide

theorem recipe_a1b5c702a812_executes_to_terminal :
    executesToTerminal recipe_a1b5c702a812 = true := by decide

theorem recipe_a1b5c702a812_kernel_certificate :
    kernelCertified recipe_a1b5c702a812 = true := by decide

end LeanToCook.SourceCatalog
