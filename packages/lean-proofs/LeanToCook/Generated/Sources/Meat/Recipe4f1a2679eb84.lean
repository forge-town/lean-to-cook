/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 香菇滑鸡 · dishes/meat_dish/香菇滑鸡/香菇滑鸡.md -/
def recipe_4f1a2679eb84 : Recipe := {
  id := "4f1a2679eb84"
  title := "香菇滑鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/香菇滑鸡/香菇滑鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "大鸡腿",
    "干香菇",
    "姜",
    "葱",
    "蒜"
  ]
  steps := [
    { index := 1, instruction := "温水泡发干香菇" },
    { index := 2, instruction := "姜切小块，葱切段，蒜对半切小粒" },
    { index := 3, instruction := "鸡腿去骨（不去骨也可，只是略影响程序员吃饭的效率而已），切成小块" },
    { index := 4, instruction := "泡发的香菇一分为四，香菇水留着备用" },
    { index := 5, instruction := "鸡腿肉焯水 1 分钟，去除血沫和杂质" },
    { index := 6, instruction := "鸡腿肉中加料酒 15ml、生抽 15ml、盐 1.5g、老抽 15ml，抓匀" },
    { index := 7, instruction := "油温 3 成，下入鸡腿肉煸炒，等鸡腿肉金黄后盛出备用" },
    { index := 8, instruction := "锅留底油，下入葱、姜、蒜炒香，香菇入锅，大火翻匀" },
    { index := 9, instruction := "等待 20 秒会有香菇香味从锅中飘出，此时下入煸炒过的鸡腿肉，下入香菇水（全部，本程序员认为的灵魂操作）、糖 15ml、生抽 30ml" },
    { index := 10, instruction := "转中火不盖盖，咕嘟 2 分钟收浓汤汁，淋入香油 5ml，撒上葱花后即可关火、装盘" }
  ]
}

theorem recipe_4f1a2679eb84_ingredients_nonempty :
    recipe_4f1a2679eb84.ingredients.isEmpty = false := by decide

theorem recipe_4f1a2679eb84_steps_nonempty :
    recipe_4f1a2679eb84.steps.isEmpty = false := by decide

theorem recipe_4f1a2679eb84_step_count :
    recipe_4f1a2679eb84.steps.length = 10 := by decide

theorem recipe_4f1a2679eb84_steps_ordered :
    orderedFrom 1 recipe_4f1a2679eb84.steps = true := by decide

theorem recipe_4f1a2679eb84_executes_to_terminal :
    executesToTerminal recipe_4f1a2679eb84 = true := by decide

theorem recipe_4f1a2679eb84_kernel_certificate :
    kernelCertified recipe_4f1a2679eb84 = true := by decide

end LeanToCook.SourceCatalog
