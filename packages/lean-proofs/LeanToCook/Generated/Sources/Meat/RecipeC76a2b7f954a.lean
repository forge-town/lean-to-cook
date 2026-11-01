/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒜苔炒肉末 · dishes/meat_dish/蒜苔炒肉末.md -/
def recipe_c76a2b7f954a : Recipe := {
  id := "c76a2b7f954a"
  title := "蒜苔炒肉末"
  category := "meat"
  sourcePath := "dishes/meat_dish/蒜苔炒肉末.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "五花肉薄片",
    "蒜苔",
    "食用盐",
    "生抽",
    "食用油",
    "蒜瓣"
  ]
  steps := [
    { index := 1, instruction := "蒜苔切成 5cm 小段，备用" },
    { index := 2, instruction := "五花肉切成 5mm  5cm 丝状，备用" },
    { index := 3, instruction := "蒜瓣拍碎切成末，备用" },
    { index := 4, instruction := "热锅，锅内放入 10ml 食用油。等待 10 秒让油温升高" },
    { index := 5, instruction := "放入蒜末，中火翻炒 10 秒 将蒜末炒出香味" },
    { index := 6, instruction := "放入五花肉和 5ml 生抽，中火翻炒 30 秒 将肉炒熟并上色" },
    { index := 7, instruction := "将蒜苔放入锅内并加入 10ml 生抽，翻炒 30 秒" },
    { index := 8, instruction := "锅内加入 20g 水，中火翻炒 5 分钟 将蒜苔炒至稍稍变软" },
    { index := 9, instruction := "最后加入 2g 食盐，中火翻炒 30 秒，即可出锅装盘" }
  ]
}

theorem recipe_c76a2b7f954a_ingredients_nonempty :
    recipe_c76a2b7f954a.ingredients.isEmpty = false := by decide

theorem recipe_c76a2b7f954a_steps_nonempty :
    recipe_c76a2b7f954a.steps.isEmpty = false := by decide

theorem recipe_c76a2b7f954a_step_count :
    recipe_c76a2b7f954a.steps.length = 9 := by decide

theorem recipe_c76a2b7f954a_steps_ordered :
    orderedFrom 1 recipe_c76a2b7f954a.steps = true := by decide

theorem recipe_c76a2b7f954a_executes_to_terminal :
    executesToTerminal recipe_c76a2b7f954a = true := by decide

theorem recipe_c76a2b7f954a_kernel_certificate :
    kernelCertified recipe_c76a2b7f954a = true := by decide

end LeanToCook.SourceCatalog
