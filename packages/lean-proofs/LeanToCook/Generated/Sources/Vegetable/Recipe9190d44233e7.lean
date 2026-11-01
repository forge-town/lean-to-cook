/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酸辣土豆丝 · dishes/vegetable_dish/酸辣土豆丝.md -/
def recipe_9190d44233e7 : Recipe := {
  id := "9190d44233e7"
  title := "酸辣土豆丝"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/酸辣土豆丝.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "土豆",
    "大蒜",
    "青椒",
    "红椒",
    "干辣椒",
    "葱",
    "生抽",
    "陈醋",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "土豆去皮、切丝（或用刨丝器）。" },
    { index := 2, instruction := "切好的土豆丝用清水清洗，去除多余的淀粉，然后对土豆丝焯水 10 秒。沥干，备用。" },
    { index := 3, instruction := "葱切成葱花；大蒜拍碎切成蒜末（分为两等份备用）；干辣椒切小段；青红椒切丝。" },
    { index := 4, instruction := "热锅，小火热油，下入一半的葱花（葱白部分）、一半的蒜末和干辣椒爆香。" },
    { index := 5, instruction := "加入青红椒翻炒几下，加入土豆丝翻炒至变色。" },
    { index := 6, instruction := "加 5ml 生抽，10ml 陈醋，倒入剩下的一半蒜末和 2g 盐快速翻炒均匀。" },
    { index := 7, instruction := "出锅前撒上剩余的葱花，翻匀即可装盘。" }
  ]
}

theorem recipe_9190d44233e7_ingredients_nonempty :
    recipe_9190d44233e7.ingredients.isEmpty = false := by decide

theorem recipe_9190d44233e7_steps_nonempty :
    recipe_9190d44233e7.steps.isEmpty = false := by decide

theorem recipe_9190d44233e7_step_count :
    recipe_9190d44233e7.steps.length = 7 := by decide

theorem recipe_9190d44233e7_steps_ordered :
    orderedFrom 1 recipe_9190d44233e7.steps = true := by decide

theorem recipe_9190d44233e7_executes_to_terminal :
    executesToTerminal recipe_9190d44233e7 = true := by decide

theorem recipe_9190d44233e7_kernel_certificate :
    kernelCertified recipe_9190d44233e7 = true := by decide

end LeanToCook.SourceCatalog
