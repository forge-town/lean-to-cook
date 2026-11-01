/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 凉拌金针菇 · dishes/vegetable_dish/凉拌金针菇.md -/
def recipe_a4fb0751e170 : Recipe := {
  id := "a4fb0751e170"
  title := "凉拌金针菇"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/凉拌金针菇.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "金针菇",
    "小葱",
    "大蒜",
    "生抽",
    "醋",
    "白糖（可选）",
    "香油（可选）",
    "辣椒油（可选）"
  ]
  steps := [
    { index := 1, instruction := "将 金针菇 根部切除，用清水冲洗干净，备用。" },
    { index := 2, instruction := "将 小葱 洗净，切成葱花，备用。" },
    { index := 3, instruction := "将 大蒜 去皮，切成蒜末，备用。" },
    { index := 4, instruction := "锅中加入 1000 ml 饮用水，大火烧开。" },
    { index := 5, instruction := "放入 金针菇，煮 1-2 分钟，至金针菇变软。" },
    { index := 6, instruction := "将 煮好的 金针菇 捞出，沥干水分，放入一个较大的碗中，备用。" },
    { index := 7, instruction := "在另一个干净的小碗中，加入 15 ml 生抽，10 ml 醋，3 g 白糖（可选），5 ml 香油（可选）。" },
    { index := 8, instruction := "加入切好的 大蒜末。" },
    { index := 9, instruction := "搅拌均匀，使 白糖 充分溶解，酱汁混合均匀。" },
    { index := 10, instruction := "将制作好的酱汁均匀淋在 金针菇 上。" },
    { index := 11, instruction := "撒上切好的 小葱花。" },
    { index := 12, instruction := "根据个人喜好，淋上 5 ml 辣椒油（可选）。" },
    { index := 13, instruction := "用 筷子 轻轻拌匀，即可食用。" }
  ]
}

theorem recipe_a4fb0751e170_ingredients_nonempty :
    recipe_a4fb0751e170.ingredients.isEmpty = false := by decide

theorem recipe_a4fb0751e170_steps_nonempty :
    recipe_a4fb0751e170.steps.isEmpty = false := by decide

theorem recipe_a4fb0751e170_step_count :
    recipe_a4fb0751e170.steps.length = 13 := by decide

theorem recipe_a4fb0751e170_steps_ordered :
    orderedFrom 1 recipe_a4fb0751e170.steps = true := by decide

theorem recipe_a4fb0751e170_executes_to_terminal :
    executesToTerminal recipe_a4fb0751e170 = true := by decide

theorem recipe_a4fb0751e170_kernel_certificate :
    kernelCertified recipe_a4fb0751e170 = true := by decide

end LeanToCook.SourceCatalog
