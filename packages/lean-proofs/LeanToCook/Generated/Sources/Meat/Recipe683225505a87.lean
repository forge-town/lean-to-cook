/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 香煎五花肉 · dishes/meat_dish/香煎五花肉/香煎五花肉.md -/
def recipe_683225505a87 : Recipe := {
  id := "683225505a87"
  title := "香煎五花肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/香煎五花肉/香煎五花肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "五花肉条（推荐长宽高为 20cm\\6cm\\5cm）",
    "生菜",
    "酱油，盐，味精，料酒，姜蒜，油，豆瓣酱"
  ]
  steps := [
    { index := 1, instruction := "将五花肉条沿长边切片，每片厚 1mm-1.5mm，备用" },
    { index := 2, instruction := "将切好的五花肉放置碗中，依次加入 8g 酱油，1g 盐，1g 味精，10g 料酒，两片姜，两朵拍扁的大蒜腌制 10 分钟" },
    { index := 3, instruction := "将生菜叶直接用手扒下来，洗干净，备用" },
    { index := 4, instruction := "热锅，倒入 5ml 食用油。油轻微冒烟后下入五花肉。单面煎制焦黄色后翻面，另一边同理。" },
    { index := 5, instruction := "五花肉出锅后，装盘。" },
    { index := 6, instruction := "将豆瓣酱抹到菜叶上，卷着五花肉即可食用" }
  ]
}

theorem recipe_683225505a87_ingredients_nonempty :
    recipe_683225505a87.ingredients.isEmpty = false := by decide

theorem recipe_683225505a87_steps_nonempty :
    recipe_683225505a87.steps.isEmpty = false := by decide

theorem recipe_683225505a87_step_count :
    recipe_683225505a87.steps.length = 6 := by decide

theorem recipe_683225505a87_steps_ordered :
    orderedFrom 1 recipe_683225505a87.steps = true := by decide

theorem recipe_683225505a87_executes_to_terminal :
    executesToTerminal recipe_683225505a87 = true := by decide

theorem recipe_683225505a87_kernel_certificate :
    kernelCertified recipe_683225505a87 = true := by decide

end LeanToCook.SourceCatalog
