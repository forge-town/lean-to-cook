/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 麻油拌面 · dishes/staple/麻油拌面.md -/
def recipe_e5f0719e2271 : Recipe := {
  id := "e5f0719e2271"
  title := "麻油拌面"
  category := "staple"
  sourcePath := "dishes/staple/麻油拌面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "风干快熟面/任何牌子的快熟面（不需要调味料）",
    "麻油",
    "胡椒粉",
    "老抽",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "将水倒入锅中并煮沸 （喜欢吃 q 弹面的同学，可在水里加入 30 克盐，用盐水煮出来的面会比较 q 弹）" },
    { index := 2, instruction := "将快熟面放入锅中 3 分钟（也可参考当下品牌快熟面的烹饪时间）" },
    { index := 3, instruction := "当面开始散了可以开始搅拌，让面受热均匀" },
    { index := 4, instruction := "将水滤干把面倒入碗中" },
    { index := 5, instruction := "按照上面的计量放入麻油，老抽，胡椒粉，生抽（可选）" },
    { index := 6, instruction := "筷子搅拌均匀" },
    { index := 7, instruction := "一道简单即省钱的懒人麻油拌面就完成啦" }
  ]
}

theorem recipe_e5f0719e2271_ingredients_nonempty :
    recipe_e5f0719e2271.ingredients.isEmpty = false := by decide

theorem recipe_e5f0719e2271_steps_nonempty :
    recipe_e5f0719e2271.steps.isEmpty = false := by decide

theorem recipe_e5f0719e2271_step_count :
    recipe_e5f0719e2271.steps.length = 7 := by decide

theorem recipe_e5f0719e2271_steps_ordered :
    orderedFrom 1 recipe_e5f0719e2271.steps = true := by decide

theorem recipe_e5f0719e2271_executes_to_terminal :
    executesToTerminal recipe_e5f0719e2271 = true := by decide

theorem recipe_e5f0719e2271_kernel_certificate :
    kernelCertified recipe_e5f0719e2271 = true := by decide

end LeanToCook.SourceCatalog
