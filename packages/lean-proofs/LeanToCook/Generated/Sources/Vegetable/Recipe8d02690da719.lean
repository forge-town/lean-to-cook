/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 凉拌豆腐 · dishes/vegetable_dish/凉拌豆腐.md -/
def recipe_8d02690da719 : Recipe := {
  id := "8d02690da719"
  title := "凉拌豆腐"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/凉拌豆腐.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "豆腐 （推荐选用北豆腐或老豆腐）",
    "小葱",
    "大蒜",
    "生抽",
    "香油",
    "醋（可选）",
    "白糖（可选）",
    "辣椒油（可选）"
  ]
  steps := [
    { index := 1, instruction := "将 豆腐 切成 2 cm 见方的小块，备用。" },
    { index := 2, instruction := "锅中加入 500 ml 饮用水，大火烧开。" },
    { index := 3, instruction := "放入 豆腐 块，煮 1-2 分钟，以去除豆腥味并使豆腐口感更紧实。" },
    { index := 4, instruction := "将 煮好的 豆腐 块捞出，沥干水分，放入碗中，备用。" },
    { index := 5, instruction := "将 小葱 洗净，切成葱花，备用。" },
    { index := 6, instruction := "将 大蒜 去皮，切成蒜末，备用。" },
    { index := 7, instruction := "在一个干净的小碗中，加入 15 ml 生抽，5 ml 香油，5 ml 醋（可选），2 g 白糖（可选）。" },
    { index := 8, instruction := "加入切好的 大蒜末。" },
    { index := 9, instruction := "搅拌均匀，使 白糖 充分溶解，酱汁混合均匀。" },
    { index := 10, instruction := "将制作好的酱汁均匀淋在 豆腐 块上。" },
    { index := 11, instruction := "撒上切好的 小葱花。" },
    { index := 12, instruction := "根据个人喜好，淋上 5 ml 辣椒油（可选）。" },
    { index := 13, instruction := "用 筷子 或勺子轻轻拌匀，即可食用。" }
  ]
}

theorem recipe_8d02690da719_ingredients_nonempty :
    recipe_8d02690da719.ingredients.isEmpty = false := by decide

theorem recipe_8d02690da719_steps_nonempty :
    recipe_8d02690da719.steps.isEmpty = false := by decide

theorem recipe_8d02690da719_step_count :
    recipe_8d02690da719.steps.length = 13 := by decide

theorem recipe_8d02690da719_steps_ordered :
    orderedFrom 1 recipe_8d02690da719.steps = true := by decide

theorem recipe_8d02690da719_executes_to_terminal :
    executesToTerminal recipe_8d02690da719 = true := by decide

theorem recipe_8d02690da719_kernel_certificate :
    kernelCertified recipe_8d02690da719 = true := by decide

end LeanToCook.SourceCatalog
