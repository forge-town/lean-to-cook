/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 带把肘子 · dishes/meat_dish/带把肘子.md -/
def recipe_2bde2d31169c : Recipe := {
  id := "2bde2d31169c"
  title := "带把肘子"
  category := "meat"
  sourcePath := "dishes/meat_dish/带把肘子.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "带脚、爪猪前肘",
    "红豆腐乳",
    "甜面酱",
    "精盐",
    "红酱油",
    "白酱油",
    "料酒",
    "蒜片",
    "姜末",
    "八角",
    "桂皮",
    "葱",
    "小斧头（砸断骨头用）",
    "消毒纱布（能盖住肘子）"
  ]
  steps := [
    { index := 1, instruction := "将肘子刮洗干净，肘头朝外、肘把（脚爪）朝里、肘皮朝下放在案板上。" },
    { index := 2, instruction := "用刀在正中由肘头向肘把沿着腿骨将皮剖开，剔去腿骨两边的肉（三面离肉），底部骨与肉相连，使骨头露出，然后将两节腿骨由中间用刀背（还是用斧头吧）砸断。" },
    { index := 3, instruction := "肘子放入煮锅煮至七成熟捞出（外观正常，内部淡红色），用干净抹布擦干水，趁热用红酱油涂抹肉皮。" },
    { index := 4, instruction := "取蒸锅一个，锅底放入八角、桂皮，先将肘把的关节处用手掰断，不伤外皮，再将肘皮朝下装进蒸锅内，装锅时根据肘子体型，将肘把贴住锅边窝着装进锅内，成为圆形。" },
    { index := 5, instruction := "撒入精盐，用消过毒的干净纱布盖在肉上，再将甜面酱（50 克）、葱（75 克）、红豆腐乳、红酱油、白酱油、姜、蒜等在纱布上抹开，用旺火蒸大约三小时（以蒸烂为准）。" },
    { index := 6, instruction := "蒸完取出，揭去纱布，扣入盘中，拣去八角，上桌时另带葱段和甜面酱小碟（或将甜面酱抹到肘面上，另带葱段小碟亦可）。" }
  ]
}

theorem recipe_2bde2d31169c_ingredients_nonempty :
    recipe_2bde2d31169c.ingredients.isEmpty = false := by decide

theorem recipe_2bde2d31169c_steps_nonempty :
    recipe_2bde2d31169c.steps.isEmpty = false := by decide

theorem recipe_2bde2d31169c_step_count :
    recipe_2bde2d31169c.steps.length = 6 := by decide

theorem recipe_2bde2d31169c_steps_ordered :
    orderedFrom 1 recipe_2bde2d31169c.steps = true := by decide

theorem recipe_2bde2d31169c_executes_to_terminal :
    executesToTerminal recipe_2bde2d31169c = true := by decide

theorem recipe_2bde2d31169c_kernel_certificate :
    kernelCertified recipe_2bde2d31169c = true := by decide

end LeanToCook.SourceCatalog
