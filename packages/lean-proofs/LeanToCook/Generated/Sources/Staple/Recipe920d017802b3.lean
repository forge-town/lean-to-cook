/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 汤面 · dishes/staple/汤面.md -/
def recipe_920d017802b3 : Recipe := {
  id := "920d017802b3"
  title := "汤面"
  category := "staple"
  sourcePath := "dishes/staple/汤面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "面食材料：可以是手工面条、龙须面、面鱼，也可以是泡面面饼、各类规格粉丝，或者是其他任何自己所喜欢的面食形式。",
    "菜类材料：建议荤素搭配，选择自己喜欢的食材洗干净即可。例如：",
    "牛羊鱼虾等肉类（生熟皆可）",
    "鸡蛋鸭蛋鹅蛋鸵鸟蛋等蛋类",
    "豆块豆筋豆腐皮等豆制品类",
    "生菜菠菜油麦菜",
    "青椒番茄胡萝卜等蔬菜类。"
  ]
  steps := [
    { index := 1, instruction := "先将菜类材料切成边长不超过 4cm 的块状，便于煮熟" },
    { index := 2, instruction := "如有生肉，则先放入冷水中，盖上锅盖，煮沸腾，先捞出上层血沫，再关火，捞出半熟的肉备用" },
    { index := 3, instruction := "先大火将水加热至沸腾，后调至中火" },
    { index := 4, instruction := "将较难煮熟的食材放入锅中（比如半熟肉类、香菇类、等最先放入锅中）。为保证煮熟，可在沸腾后计时 10 分钟，特别难熟的大块食材可追加 5 分钟。" },
    { index := 5, instruction := "将面食放入锅中，适当搅拌确保面和汤充分接触，使液面保持轻微沸腾，煮 5 分钟。加入面后液面易产生白色泡沫，可适当抬起锅盖通气或者撤下锅盖。" },
    { index := 6, instruction := "将易于煮熟的食材如青菜类放入锅中，适当搅拌以充分浸没，煮 2-5 分钟" },
    { index := 7, instruction := "关火，随后加入盐、胡椒粉、香油等自己喜欢的调味料，适当搅拌即可出锅食用" }
  ]
}

theorem recipe_920d017802b3_ingredients_nonempty :
    recipe_920d017802b3.ingredients.isEmpty = false := by decide

theorem recipe_920d017802b3_steps_nonempty :
    recipe_920d017802b3.steps.isEmpty = false := by decide

theorem recipe_920d017802b3_step_count :
    recipe_920d017802b3.steps.length = 7 := by decide

theorem recipe_920d017802b3_steps_ordered :
    orderedFrom 1 recipe_920d017802b3.steps = true := by decide

theorem recipe_920d017802b3_executes_to_terminal :
    executesToTerminal recipe_920d017802b3 = true := by decide

theorem recipe_920d017802b3_kernel_certificate :
    kernelCertified recipe_920d017802b3 = true := by decide

end LeanToCook.SourceCatalog
