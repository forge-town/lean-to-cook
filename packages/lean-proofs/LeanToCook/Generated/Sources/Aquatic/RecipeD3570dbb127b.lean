/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酱炖蟹 · dishes/aquatic/酱炖蟹.md -/
def recipe_d3570dbb127b : Recipe := {
  id := "d3570dbb127b"
  title := "酱炖蟹"
  category := "aquatic"
  sourcePath := "dishes/aquatic/酱炖蟹.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "螃蟹（首选河蟹，次选梭子蟹）",
    "豆瓣酱",
    "冰糖（可选）",
    "老抽",
    "菜油（未脱色的菜籽油，俗称“毛菜油”或“土菜油”，备选花生油）",
    "番茄酱",
    "料酒",
    "老姜",
    "小葱",
    "鸡蛋（可选）",
    "猪肉末（可选）"
  ]
  steps := [
    { index := 1, instruction := "把螃蟹刷洗干净，然后在砧板上对半劈开" },
    { index := 2, instruction := "锅里下菜油，放入姜末和豆瓣酱爆香，加入冰糖炒化，直到冒小气泡就盛出" },
    { index := 3, instruction := "在盘子里铺上一层酱，然后把切好的螃蟹切开面朝下，整齐排放在酱上" },
    { index := 4, instruction := "放点葱段和姜片，建议敲个鸡蛋或在盘底铺肉末" },
    { index := 5, instruction := "上锅蒸 10-12 分钟" }
  ]
}

theorem recipe_d3570dbb127b_ingredients_nonempty :
    recipe_d3570dbb127b.ingredients.isEmpty = false := by decide

theorem recipe_d3570dbb127b_steps_nonempty :
    recipe_d3570dbb127b.steps.isEmpty = false := by decide

theorem recipe_d3570dbb127b_step_count :
    recipe_d3570dbb127b.steps.length = 5 := by decide

theorem recipe_d3570dbb127b_steps_ordered :
    orderedFrom 1 recipe_d3570dbb127b.steps = true := by decide

theorem recipe_d3570dbb127b_executes_to_terminal :
    executesToTerminal recipe_d3570dbb127b = true := by decide

theorem recipe_d3570dbb127b_kernel_certificate :
    kernelCertified recipe_d3570dbb127b = true := by decide

end LeanToCook.SourceCatalog
