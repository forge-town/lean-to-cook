/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 羊肉汤 · dishes/soup/羊肉汤/羊肉汤.md -/
def recipe_949bd05cd61f : Recipe := {
  id := "949bd05cd61f"
  title := "羊肉汤"
  category := "soup"
  sourcePath := "dishes/soup/羊肉汤/羊肉汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "羊肉或羊杂",
    "食用油",
    "料酒",
    "大葱",
    "白胡椒粉",
    "食用盐",
    "孜然粉（可选）",
    "香菜（可选）"
  ]
  steps := [
    { index := 1, instruction := "羊肉切成长 5cm 宽 0.5cm 的块" },
    { index := 2, instruction := "大葱切成小段" },
    { index := 3, instruction := "羊肉放入锅中，加入 1000ml 常温水，加入料酒、大葱" },
    { index := 4, instruction := "煮沸 2 分钟后，捞出羊肉，使用常温水洗净，沥干水分" },
    { index := 5, instruction := "热锅加入食用油，加入羊肉，翻炒 2 分钟至羊肉表面微黄" },
    { index := 6, instruction := "加入开水，开到大火档位" },
    { index := 7, instruction := "5 分钟后，加入白胡椒粉、盐，继续煮沸 5 分钟" },
    { index := 8, instruction := "出锅之后，加入香菜、孜然粉，搅拌均匀" }
  ]
}

theorem recipe_949bd05cd61f_ingredients_nonempty :
    recipe_949bd05cd61f.ingredients.isEmpty = false := by decide

theorem recipe_949bd05cd61f_steps_nonempty :
    recipe_949bd05cd61f.steps.isEmpty = false := by decide

theorem recipe_949bd05cd61f_step_count :
    recipe_949bd05cd61f.steps.length = 8 := by decide

theorem recipe_949bd05cd61f_steps_ordered :
    orderedFrom 1 recipe_949bd05cd61f.steps = true := by decide

theorem recipe_949bd05cd61f_executes_to_terminal :
    executesToTerminal recipe_949bd05cd61f = true := by decide

theorem recipe_949bd05cd61f_kernel_certificate :
    kernelCertified recipe_949bd05cd61f = true := by decide

end LeanToCook.SourceCatalog
