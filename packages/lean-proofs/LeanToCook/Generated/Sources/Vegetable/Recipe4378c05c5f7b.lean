/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 拔丝土豆 · dishes/vegetable_dish/拔丝土豆/拔丝土豆.md -/
def recipe_4378c05c5f7b : Recipe := {
  id := "4378c05c5f7b"
  title := "拔丝土豆"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/拔丝土豆/拔丝土豆.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "土豆",
    "食用油",
    "淀粉",
    "白砂糖",
    "水",
    "芝麻"
  ]
  steps := [
    { index := 1, instruction := "土豆去皮，切均匀的小块。放入淀粉（不加水）搅拌，使得淀粉覆盖土豆表面" },
    { index := 2, instruction := "起锅烧油，放入土豆块，缓缓翻滚煎炸 5-7 分钟 ，直至筷子可以插进土豆" },
    { index := 3, instruction := "取出土豆，放入大碗备用" },
    { index := 4, instruction := "锅中加入水、白砂糖，沿着一个方向慢慢搅动白砂糖，直到白砂糖颜色变成褐色" },
    { index := 5, instruction := "重新倒入土豆，翻炒 30 S 后 出锅" },
    { index := 6, instruction := "土豆盛盘，散上芝麻" }
  ]
}

theorem recipe_4378c05c5f7b_ingredients_nonempty :
    recipe_4378c05c5f7b.ingredients.isEmpty = false := by decide

theorem recipe_4378c05c5f7b_steps_nonempty :
    recipe_4378c05c5f7b.steps.isEmpty = false := by decide

theorem recipe_4378c05c5f7b_step_count :
    recipe_4378c05c5f7b.steps.length = 6 := by decide

theorem recipe_4378c05c5f7b_steps_ordered :
    orderedFrom 1 recipe_4378c05c5f7b.steps = true := by decide

theorem recipe_4378c05c5f7b_executes_to_terminal :
    executesToTerminal recipe_4378c05c5f7b = true := by decide

theorem recipe_4378c05c5f7b_kernel_certificate :
    kernelCertified recipe_4378c05c5f7b = true := by decide

end LeanToCook.SourceCatalog
