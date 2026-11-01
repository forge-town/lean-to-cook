/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 泰国手标红茶 · dishes/drink/泰国手标红茶/泰国手标红茶.md -/
def recipe_91c84c269928 : Recipe := {
  id := "91c84c269928"
  title := "泰国手标红茶"
  category := "drink"
  sourcePath := "dishes/drink/泰国手标红茶/泰国手标红茶.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "水",
    "茶粉",
    "炼乳",
    "白糖",
    "牛奶",
    "克称",
    "带刻度容器",
    "港式奶茶过滤袋"
  ]
  steps := [
    { index := 1, instruction := "600cc 水大火烧开" },
    { index := 2, instruction := "在过滤袋中装入 20g 茶粉，开水倒入过滤袋中，过滤 20 遍" },
    { index := 3, instruction := "使用克称量取 24g 炼乳、24g 白糖和 18ml 牛奶放入 1000ml 以上的水壶中" },
    { index := 4, instruction := "将过滤好的茶水倒入水壶中搅拌，直到白糖融化" },
    { index := 5, instruction := "将水壶放到冰箱 4 小时以上" },
    { index := 6, instruction := "喝前可以加 6-8 颗冰块" }
  ]
}

theorem recipe_91c84c269928_ingredients_nonempty :
    recipe_91c84c269928.ingredients.isEmpty = false := by decide

theorem recipe_91c84c269928_steps_nonempty :
    recipe_91c84c269928.steps.isEmpty = false := by decide

theorem recipe_91c84c269928_step_count :
    recipe_91c84c269928.steps.length = 6 := by decide

theorem recipe_91c84c269928_steps_ordered :
    orderedFrom 1 recipe_91c84c269928.steps = true := by decide

theorem recipe_91c84c269928_executes_to_terminal :
    executesToTerminal recipe_91c84c269928 = true := by decide

theorem recipe_91c84c269928_kernel_certificate :
    kernelCertified recipe_91c84c269928 = true := by decide

end LeanToCook.SourceCatalog
