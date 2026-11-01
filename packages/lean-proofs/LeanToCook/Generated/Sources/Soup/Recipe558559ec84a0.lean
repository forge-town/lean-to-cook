/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 排骨苦瓜汤 · dishes/soup/排骨苦瓜汤/排骨苦瓜汤.md -/
def recipe_558559ec84a0 : Recipe := {
  id := "558559ec84a0"
  title := "排骨苦瓜汤"
  category := "soup"
  sourcePath := "dishes/soup/排骨苦瓜汤/排骨苦瓜汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "电压力锅（可以极大简化烹饪过程和时间）",
    "砂锅（相比于炒锅更适合炖汤）",
    "排骨",
    "苦瓜",
    "虾皮"
  ]
  steps := [
    { index := 1, instruction := "排骨洗净，切到约 4cm ±2cm  3 ± 2cm 的小块（如没有剁排骨的工具，可以求助摊主）" },
    { index := 2, instruction := "炒锅倒入冷水 700ml 和排骨一起加热至煮沸，关火捞出排骨" },
    { index := 3, instruction := "苦瓜中间切为两半，清除干净内部的种子和苦瓜瓤，切为 0.5 ± 0.3 cm 的苦瓜条，洗净" }
  ]
}

theorem recipe_558559ec84a0_ingredients_nonempty :
    recipe_558559ec84a0.ingredients.isEmpty = false := by decide

theorem recipe_558559ec84a0_steps_nonempty :
    recipe_558559ec84a0.steps.isEmpty = false := by decide

theorem recipe_558559ec84a0_step_count :
    recipe_558559ec84a0.steps.length = 3 := by decide

theorem recipe_558559ec84a0_steps_ordered :
    orderedFrom 1 recipe_558559ec84a0.steps = true := by decide

theorem recipe_558559ec84a0_executes_to_terminal :
    executesToTerminal recipe_558559ec84a0 = true := by decide

theorem recipe_558559ec84a0_kernel_certificate :
    kernelCertified recipe_558559ec84a0 = true := by decide

end LeanToCook.SourceCatalog
