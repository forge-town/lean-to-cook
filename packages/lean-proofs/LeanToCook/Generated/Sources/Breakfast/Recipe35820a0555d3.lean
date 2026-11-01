/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒸花卷 · dishes/breakfast/蒸花卷.md -/
def recipe_35820a0555d3 : Recipe := {
  id := "35820a0555d3"
  title := "蒸花卷"
  category := "breakfast"
  sourcePath := "dishes/breakfast/蒸花卷.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "冷冻花卷",
    "圆碟子",
    "蒸架",
    "水 400ml"
  ]
  steps := [
    { index := 1, instruction := "从花卷的包装袋中取出 5 个花卷" },
    { index := 2, instruction := "把花卷平铺在碟子上，尽量不用重叠" },
    { index := 3, instruction := "往锅里倒入 400ml 水，把蒸架放里面，把装花卷的碟子放在蒸架上，盖上锅盖。" },
    { index := 4, instruction := "开大火加热，直至水沸腾。" },
    { index := 5, instruction := "转中火加热 15 分钟" },
    { index := 6, instruction := "开盖用手感受花卷的表面温度，如果不够热，就继续盖上盖子加热，否则就可以关火出锅。" },
    { index := 7, instruction := "碟子取出放凉至 50 度即可食用" }
  ]
}

theorem recipe_35820a0555d3_ingredients_nonempty :
    recipe_35820a0555d3.ingredients.isEmpty = false := by decide

theorem recipe_35820a0555d3_steps_nonempty :
    recipe_35820a0555d3.steps.isEmpty = false := by decide

theorem recipe_35820a0555d3_step_count :
    recipe_35820a0555d3.steps.length = 7 := by decide

theorem recipe_35820a0555d3_steps_ordered :
    orderedFrom 1 recipe_35820a0555d3.steps = true := by decide

theorem recipe_35820a0555d3_executes_to_terminal :
    executesToTerminal recipe_35820a0555d3 = true := by decide

theorem recipe_35820a0555d3_kernel_certificate :
    kernelCertified recipe_35820a0555d3 = true := by decide

end LeanToCook.SourceCatalog
