/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- B52轰炸机 · dishes/drink/B52轰炸机.md -/
def recipe_989ccdcae7af : Recipe := {
  id := "989ccdcae7af"
  title := "B52轰炸机"
  category := "drink"
  sourcePath := "dishes/drink/B52轰炸机.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "甘露咖啡酒",
    "爱尔兰百利甜酒",
    "蓝天原味伏特加",
    "吧勺",
    "利口酒杯",
    "打火机"
  ]
  steps := [
    { index := 1, instruction := "在利口酒杯的最底层倒入甘露咖啡酒到 1/3 处。(10ml)" },
    { index := 2, instruction := "顺着吧勺缓缓倒入爱尔兰百利甜酒，也是 1/3 处 (10ml)。注意要慢，保证层次分明。（太快甜酒会和咖啡混合）" },
    { index := 3, instruction := "最后在上层倒入蓝天原味伏特加 （10ml)" },
    { index := 4, instruction := "用打火机热一下杯口" },
    { index := 5, instruction := "最后一步点火： 看到淡蓝色的小火苗了吗？" }
  ]
}

theorem recipe_989ccdcae7af_ingredients_nonempty :
    recipe_989ccdcae7af.ingredients.isEmpty = false := by decide

theorem recipe_989ccdcae7af_steps_nonempty :
    recipe_989ccdcae7af.steps.isEmpty = false := by decide

theorem recipe_989ccdcae7af_step_count :
    recipe_989ccdcae7af.steps.length = 5 := by decide

theorem recipe_989ccdcae7af_steps_ordered :
    orderedFrom 1 recipe_989ccdcae7af.steps = true := by decide

theorem recipe_989ccdcae7af_executes_to_terminal :
    executesToTerminal recipe_989ccdcae7af = true := by decide

theorem recipe_989ccdcae7af_kernel_certificate :
    kernelCertified recipe_989ccdcae7af = true := by decide

end LeanToCook.SourceCatalog
