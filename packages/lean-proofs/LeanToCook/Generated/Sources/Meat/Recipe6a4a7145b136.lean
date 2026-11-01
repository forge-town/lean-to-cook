/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 湘祁米夫鸭 · dishes/meat_dish/湘祁米夫鸭/湘祁米夫鸭.md -/
def recipe_6a4a7145b136 : Recipe := {
  id := "6a4a7145b136"
  title := "湘祁米夫鸭"
  category := "meat"
  sourcePath := "dishes/meat_dish/湘祁米夫鸭/湘祁米夫鸭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸭子（必须新鲜现杀的）",
    "糯米粉",
    "粘米粉",
    "蒸肉粉",
    "细辣椒粉（吃辣则加）",
    "白胡椒粉",
    "五花肉（可加可不加）",
    "姜蒜",
    "盐",
    "食用油",
    "开水"
  ]
  steps := [
    { index := 1, instruction := "将糯米粉、粘米粉、蒸肉粉、细辣椒粉、5 克盐、白胡椒粉倒一起搅匀" },
    { index := 2, instruction := "鸭子让热心摊主剁成蒸煮块，姜切片，蒜子剥皮，五花肉切片即可" },
    { index := 3, instruction := "热锅凉油煸炒五花肉出油，再加食用油烧热，下入鸭子煸炒" },
    { index := 4, instruction := "鸭子煸炒到表皮焦变色，下入姜蒜和盐继续煸炒香味" },
    { index := 5, instruction := "关小火倒入米粉翻炒，鸭肉均匀裹满米粉子，加入开水，少量多次的加，边加边翻炒" },
    { index := 6, instruction := "翻炒鸭肉和米粉有湿感，铲出入碗中，高压锅放水蒸 20-25 分钟" },
    { index := 7, instruction := "出锅前撒点葱花即可享用了" }
  ]
}

theorem recipe_6a4a7145b136_ingredients_nonempty :
    recipe_6a4a7145b136.ingredients.isEmpty = false := by decide

theorem recipe_6a4a7145b136_steps_nonempty :
    recipe_6a4a7145b136.steps.isEmpty = false := by decide

theorem recipe_6a4a7145b136_step_count :
    recipe_6a4a7145b136.steps.length = 7 := by decide

theorem recipe_6a4a7145b136_steps_ordered :
    orderedFrom 1 recipe_6a4a7145b136.steps = true := by decide

theorem recipe_6a4a7145b136_executes_to_terminal :
    executesToTerminal recipe_6a4a7145b136 = true := by decide

theorem recipe_6a4a7145b136_kernel_certificate :
    kernelCertified recipe_6a4a7145b136 = true := by decide

end LeanToCook.SourceCatalog
