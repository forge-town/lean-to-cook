/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 奶茶 · dishes/drink/奶茶.md -/
def recipe_ed29771026e7 : Recipe := {
  id := "ed29771026e7"
  title := "奶茶"
  category := "drink"
  sourcePath := "dishes/drink/奶茶.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "袋泡红茶（推荐立顿黄牌精选红茶）",
    "全脂奶粉或淡奶",
    "杯子，例如带刻度的杯子，陶瓷杯或保温杯"
  ]
  steps := [
    { index := 1, instruction := "取袋泡红茶 2 包放入杯中，加入 180-200mL 沸水。" },
    { index := 2, instruction := "等待 20 - 30 分钟。" },
    { index := 3, instruction := "称取 11-12g 奶粉和 5-7g 砂糖，分别加入前一步骤得到的液体中。" },
    { index := 4, instruction := "搅拌均匀即可饮用。" }
  ]
}

theorem recipe_ed29771026e7_ingredients_nonempty :
    recipe_ed29771026e7.ingredients.isEmpty = false := by decide

theorem recipe_ed29771026e7_steps_nonempty :
    recipe_ed29771026e7.steps.isEmpty = false := by decide

theorem recipe_ed29771026e7_step_count :
    recipe_ed29771026e7.steps.length = 4 := by decide

theorem recipe_ed29771026e7_steps_ordered :
    orderedFrom 1 recipe_ed29771026e7.steps = true := by decide

theorem recipe_ed29771026e7_executes_to_terminal :
    executesToTerminal recipe_ed29771026e7 = true := by decide

theorem recipe_ed29771026e7_kernel_certificate :
    kernelCertified recipe_ed29771026e7 = true := by decide

end LeanToCook.SourceCatalog
