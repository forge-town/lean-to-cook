/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 洋葱炒猪肉 · dishes/meat_dish/洋葱炒猪肉.md -/
def recipe_401011c58362 : Recipe := {
  id := "401011c58362"
  title := "洋葱炒猪肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/洋葱炒猪肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "洋葱",
    "猪肉片",
    "蕃茄酱",
    "麻油"
  ]
  steps := [
    { index := 1, instruction := "洋葱切片，猪肉，蒜头拍碎，以及混合上述调味料备用" },
    { index := 2, instruction := "炒锅内倒入 1 大匙食用油（等待 10 秒让油温升高），倒入猪肉" },
    { index := 3, instruction := "炒至变色后下蒜头炒香盛起备用" },
    { index := 4, instruction := "原锅下洋葱翻炒 34 分钟后加入调味料炒匀" },
    { index := 5, instruction := "下刚盛起备用的猪肉翻炒至猪肉熟后" },
    { index := 6, instruction := "待猪肉熟后再翻炒 1、2 分钟即可起锅" }
  ]
}

theorem recipe_401011c58362_ingredients_nonempty :
    recipe_401011c58362.ingredients.isEmpty = false := by decide

theorem recipe_401011c58362_steps_nonempty :
    recipe_401011c58362.steps.isEmpty = false := by decide

theorem recipe_401011c58362_step_count :
    recipe_401011c58362.steps.length = 6 := by decide

theorem recipe_401011c58362_steps_ordered :
    orderedFrom 1 recipe_401011c58362.steps = true := by decide

theorem recipe_401011c58362_executes_to_terminal :
    executesToTerminal recipe_401011c58362 = true := by decide

theorem recipe_401011c58362_kernel_certificate :
    kernelCertified recipe_401011c58362 = true := by decide

end LeanToCook.SourceCatalog
