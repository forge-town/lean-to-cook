/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 素炒豆角 · dishes/vegetable_dish/素炒豆角.md -/
def recipe_d3e98d659448 : Recipe := {
  id := "d3e98d659448"
  title := "素炒豆角"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/素炒豆角.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "豆角",
    "小米椒",
    "葱",
    "蒜",
    "生抽",
    "老抽",
    "耗油",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "葱切花，蒜切沫，备用。" },
    { index := 2, instruction := "生抽、老抽、耗油、盐混合调料汁，备用。" },
    { index := 3, instruction := "小米椒切圈，备用。" },
    { index := 4, instruction := "豆角去筋，45° 斜切4-10cm小段，备用。" },
    { index := 5, instruction := "起锅烧油(10ml - 15ml)，冒烟后放入葱、小米椒，翻炒至闻到香味；" },
    { index := 6, instruction := "加入豆角，翻炒30s," },
    { index := 7, instruction := "加入料汁，开大火翻炒2分钟" },
    { index := 8, instruction := "倒入 150ml 水" },
    { index := 9, instruction := "转中小火，盖上锅盖焖制 8-10 分钟" },
    { index := 10, instruction := "加入蒜切沫，出锅。" }
  ]
}

theorem recipe_d3e98d659448_ingredients_nonempty :
    recipe_d3e98d659448.ingredients.isEmpty = false := by decide

theorem recipe_d3e98d659448_steps_nonempty :
    recipe_d3e98d659448.steps.isEmpty = false := by decide

theorem recipe_d3e98d659448_step_count :
    recipe_d3e98d659448.steps.length = 10 := by decide

theorem recipe_d3e98d659448_steps_ordered :
    orderedFrom 1 recipe_d3e98d659448.steps = true := by decide

theorem recipe_d3e98d659448_executes_to_terminal :
    executesToTerminal recipe_d3e98d659448 = true := by decide

theorem recipe_d3e98d659448_kernel_certificate :
    kernelCertified recipe_d3e98d659448 = true := by decide

end LeanToCook.SourceCatalog
