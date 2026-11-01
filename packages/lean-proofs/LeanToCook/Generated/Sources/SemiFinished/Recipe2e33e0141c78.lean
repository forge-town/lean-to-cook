/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 速冻馄饨 · dishes/semi-finished/速冻馄饨.md -/
def recipe_2e33e0141c78 : Recipe := {
  id := "2e33e0141c78"
  title := "速冻馄饨"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/速冻馄饨.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "未过期的一袋速冻馄饨（自带调味料包更佳）",
    "电饭煲（推荐品牌小米智能电饭煲）",
    "盐（速冻馄饨无调味料包时）",
    "鸡精（速冻馄饨无调味料包时）",
    "胡椒粉（速冻馄饨无调味料包时）",
    "香油（速冻馄饨无调味料包时）",
    "香菜 1 根（可选）"
  ]
  steps := [
    { index := 1, instruction := "将水倒入电饭煲中，按炖或煮的模式运行 35 分钟，此时揭开电饭煲应看到水为沸腾状态。" },
    { index := 2, instruction := "将速冻馄饨小心放入水中，注意不要烫伤。" },
    { index := 3, instruction := "放入电饭煲前可以适当用水过一下。" },
    { index := 4, instruction := "如果馄饨有调料包，此时可一并加入水中。" },
    { index := 5, instruction := "盖上电饭煲，按同样炖或煮的模式运行 20 分钟。" },
    { index := 6, instruction := "将所有馄饨连同能没过所有馄饨的水一同盛入碗中。" },
    { index := 7, instruction := "如果此前没有加入调料包，此时可按自身口味轻重加入盐、鸡精、胡椒粉、香油调味。" },
    { index := 8, instruction := "也可撒上 58 片香菜叶佐味（仅适用于对香菜味道不敏感的人）。" }
  ]
}

theorem recipe_2e33e0141c78_ingredients_nonempty :
    recipe_2e33e0141c78.ingredients.isEmpty = false := by decide

theorem recipe_2e33e0141c78_steps_nonempty :
    recipe_2e33e0141c78.steps.isEmpty = false := by decide

theorem recipe_2e33e0141c78_step_count :
    recipe_2e33e0141c78.steps.length = 8 := by decide

theorem recipe_2e33e0141c78_steps_ordered :
    orderedFrom 1 recipe_2e33e0141c78.steps = true := by decide

theorem recipe_2e33e0141c78_executes_to_terminal :
    executesToTerminal recipe_2e33e0141c78 = true := by decide

theorem recipe_2e33e0141c78_kernel_certificate :
    kernelCertified recipe_2e33e0141c78 = true := by decide

end LeanToCook.SourceCatalog
