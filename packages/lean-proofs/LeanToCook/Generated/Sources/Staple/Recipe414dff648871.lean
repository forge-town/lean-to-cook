/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒凉粉 · dishes/staple/炒凉粉/炒凉粉.md -/
def recipe_414dff648871 : Recipe := {
  id := "414dff648871"
  title := "炒凉粉"
  category := "staple"
  sourcePath := "dishes/staple/炒凉粉/炒凉粉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "凉粉",
    "玉米油",
    "大蒜",
    "香葱",
    "豆瓣酱",
    "生抽",
    "老抽",
    "食盐",
    "十三香",
    "中粗辣椒面",
    "矿泉水"
  ]
  steps := [
    { index := 1, instruction := "凉粉改刀切麻将块大小" },
    { index := 2, instruction := "开小火，起锅烧油，锅烧微热后，下入蒜末爆香后加入豆瓣酱炒出红油" },
    { index := 3, instruction := "将凉粉块下入锅中，翻炒 10 秒" },
    { index := 4, instruction := "加入生抽提味，老抽上色，翻炒均匀后加入辣椒面继续翻炒均匀" },
    { index := 5, instruction := "加入食盐、十三香继续翻炒 10 秒" },
    { index := 6, instruction := "加入准备好的矿泉水，再次翻炒 10 秒，待汤汁浓稠后，关火出锅装盘" },
    { index := 7, instruction := "撒上葱花即可完成" }
  ]
}

theorem recipe_414dff648871_ingredients_nonempty :
    recipe_414dff648871.ingredients.isEmpty = false := by decide

theorem recipe_414dff648871_steps_nonempty :
    recipe_414dff648871.steps.isEmpty = false := by decide

theorem recipe_414dff648871_step_count :
    recipe_414dff648871.steps.length = 7 := by decide

theorem recipe_414dff648871_steps_ordered :
    orderedFrom 1 recipe_414dff648871.steps = true := by decide

theorem recipe_414dff648871_executes_to_terminal :
    executesToTerminal recipe_414dff648871 = true := by decide

theorem recipe_414dff648871_kernel_certificate :
    kernelCertified recipe_414dff648871 = true := by decide

end LeanToCook.SourceCatalog
