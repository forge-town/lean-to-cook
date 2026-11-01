/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 冬瓜茶 · dishes/drink/冬瓜茶.md -/
def recipe_678acb8ed4c0 : Recipe := {
  id := "678acb8ed4c0"
  title := "冬瓜茶"
  category := "drink"
  sourcePath := "dishes/drink/冬瓜茶.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "冬瓜",
    "冰糖",
    "保鲜膜",
    "过滤网",
    "大锅"
  ]
  steps := [
    { index := 1, instruction := "准备冬瓜：将冬瓜去皮，去籽，切成小块（每块不超过 4cm）。" },
    { index := 2, instruction := "加入冰糖：冬瓜加入冰糖，搅拌均匀，盖上保鲜膜放冰箱冷藏 2 小时以上。" },
    { index := 3, instruction := "煮冬瓜： 此时冬瓜出了很多水, 倒入锅中 大火煮开，然后转中小火慢慢熬制 12 个小时，中途多搅拌防止糊锅。" },
    { index := 4, instruction := "过滤冬瓜茶：使用过滤网将煮好的冬瓜茶液过滤，取出冬瓜块，只保留茶液。" },
    { index := 5, instruction := "冷却：将冬瓜茶液放凉后，倒入干净的容器中，放入冰箱冷藏即可。" },
    { index := 6, instruction := "享用: 熬好的冬瓜茶液是浓缩汁，根据个人喜好添加水或其他饮品，冷热皆宜。" }
  ]
}

theorem recipe_678acb8ed4c0_ingredients_nonempty :
    recipe_678acb8ed4c0.ingredients.isEmpty = false := by decide

theorem recipe_678acb8ed4c0_steps_nonempty :
    recipe_678acb8ed4c0.steps.isEmpty = false := by decide

theorem recipe_678acb8ed4c0_step_count :
    recipe_678acb8ed4c0.steps.length = 6 := by decide

theorem recipe_678acb8ed4c0_steps_ordered :
    orderedFrom 1 recipe_678acb8ed4c0.steps = true := by decide

theorem recipe_678acb8ed4c0_executes_to_terminal :
    executesToTerminal recipe_678acb8ed4c0 = true := by decide

theorem recipe_678acb8ed4c0_kernel_certificate :
    kernelCertified recipe_678acb8ed4c0 = true := by decide

end LeanToCook.SourceCatalog
