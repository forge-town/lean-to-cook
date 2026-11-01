/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 徽派红烧肉 · dishes/meat_dish/徽派红烧肉/徽派红烧肉.md -/
def recipe_ca670c5a113e : Recipe := {
  id := "ca670c5a113e"
  title := "徽派红烧肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/徽派红烧肉/徽派红烧肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "五花肉",
    "白砂糖",
    "食用油",
    "生抽",
    "蚝油",
    "老抽",
    "姜片",
    "蒜头",
    "料酒",
    "葱",
    "五香粉",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "五花肉切块，每块 2-3 cm 大小" },
    { index := 2, instruction := "锅中加入 150 ml 食用油，倒入五花肉，煎炸 2 分钟 后，加入盐，翻炒五花肉，2 分钟 后出锅" },
    { index := 3, instruction := "锅中加入 50 ml 食用油，倒入白砂糖，翻炒到咖啡色" },
    { index := 4, instruction := "倒入五花肉，翻炒 30 S ，加入姜片、蒜头后翻炒 30 S" },
    { index := 5, instruction := "加入料酒，五香粉、葱，加入水没过五花肉，盖上锅盖煮 10 分钟" },
    { index := 6, instruction := "加入生抽、老抽、蚝油，中火煮 20 分钟" },
    { index := 7, instruction := "开锅，大火烧汁，端盘" }
  ]
}

theorem recipe_ca670c5a113e_ingredients_nonempty :
    recipe_ca670c5a113e.ingredients.isEmpty = false := by decide

theorem recipe_ca670c5a113e_steps_nonempty :
    recipe_ca670c5a113e.steps.isEmpty = false := by decide

theorem recipe_ca670c5a113e_step_count :
    recipe_ca670c5a113e.steps.length = 7 := by decide

theorem recipe_ca670c5a113e_steps_ordered :
    orderedFrom 1 recipe_ca670c5a113e.steps = true := by decide

theorem recipe_ca670c5a113e_executes_to_terminal :
    executesToTerminal recipe_ca670c5a113e = true := by decide

theorem recipe_ca670c5a113e_kernel_certificate :
    kernelCertified recipe_ca670c5a113e = true := by decide

end LeanToCook.SourceCatalog
