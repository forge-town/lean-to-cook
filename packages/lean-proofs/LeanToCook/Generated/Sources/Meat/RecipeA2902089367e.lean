/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 香干芹菜炒肉 · dishes/meat_dish/香干芹菜炒肉/香干芹菜炒肉.md -/
def recipe_a2902089367e : Recipe := {
  id := "a2902089367e"
  title := "香干芹菜炒肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/香干芹菜炒肉/香干芹菜炒肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "豆干",
    "香芹/芹菜",
    "猪肉",
    "大蒜",
    "辣椒：青椒或者红椒都可以",
    "花椒：可选",
    "盐",
    "鸡精：可选",
    "老抽",
    "蚝油",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "芹菜去叶切段、切成不超过 4cm 的条状，备用" },
    { index := 2, instruction := "香干切条，宽约小拇指，备用" },
    { index := 3, instruction := "蒜头切片或者剁成蒜泥都行，备用" },
    { index := 4, instruction := "辣椒切圈或者斜切成条都行，备用" },
    { index := 5, instruction := "热锅，锅内放入 10ml - 15ml 食用油。等待 10 秒让油温升高" },
    { index := 6, instruction := "放入花椒、大蒜爆香（可以吃姜的也可以额外放入一些姜片/姜丝）" },
    { index := 7, instruction := "加入猪肉炒至变色，再加入 8ml 老抽上色翻炒均匀（有豆瓣酱的，可以放入 3ml 豆瓣酱一起翻炒）" },
    { index := 8, instruction := "加入香干翻炒均匀（大约 2 分钟）" },
    { index := 9, instruction := "加入辣椒翻炒均匀（大约 1-2 分钟）" },
    { index := 10, instruction := "加入芹菜，放入 5g 盐翻炒 1 分钟" },
    { index := 11, instruction := "加入 3g 鸡精、5ml 蚝油翻炒均匀，即可出锅" }
  ]
}

theorem recipe_a2902089367e_ingredients_nonempty :
    recipe_a2902089367e.ingredients.isEmpty = false := by decide

theorem recipe_a2902089367e_steps_nonempty :
    recipe_a2902089367e.steps.isEmpty = false := by decide

theorem recipe_a2902089367e_step_count :
    recipe_a2902089367e.steps.length = 11 := by decide

theorem recipe_a2902089367e_steps_ordered :
    orderedFrom 1 recipe_a2902089367e.steps = true := by decide

theorem recipe_a2902089367e_executes_to_terminal :
    executesToTerminal recipe_a2902089367e = true := by decide

theorem recipe_a2902089367e_kernel_certificate :
    kernelCertified recipe_a2902089367e = true := by decide

end LeanToCook.SourceCatalog
