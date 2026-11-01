/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 豉汁蒸白鱔 · dishes/meat_dish/豉汁蒸白鱔/豉汁蒸白鱔.md -/
def recipe_945e60912113 : Recipe := {
  id := "945e60912113"
  title := "豉汁蒸白鱔"
  category := "meat"
  sourcePath := "dishes/meat_dish/豉汁蒸白鱔/豉汁蒸白鱔.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "白鱔（白鳝）",
    "豆豉",
    "蒜头",
    "姜",
    "葱",
    "生抽",
    "老抽",
    "糖",
    "麻油",
    "生粉（可选）",
    "红椒（可选，装饰用）",
    "蒸锅或电蒸炉",
    "耐热盘（适合蒸的盘子）",
    "刀和砧板",
    "小碗（调酱汁用）"
  ]
  steps := [
    { index := 1, instruction := "检查与清洗白鱔：" },
    { index := 2, instruction := "准备酱汁：" },
    { index := 3, instruction := "摆盘：" },
    { index := 4, instruction := "蒸制：" },
    { index := 5, instruction := "装饰与完成：" }
  ]
}

theorem recipe_945e60912113_ingredients_nonempty :
    recipe_945e60912113.ingredients.isEmpty = false := by decide

theorem recipe_945e60912113_steps_nonempty :
    recipe_945e60912113.steps.isEmpty = false := by decide

theorem recipe_945e60912113_step_count :
    recipe_945e60912113.steps.length = 5 := by decide

theorem recipe_945e60912113_steps_ordered :
    orderedFrom 1 recipe_945e60912113.steps = true := by decide

theorem recipe_945e60912113_executes_to_terminal :
    executesToTerminal recipe_945e60912113 = true := by decide

theorem recipe_945e60912113_kernel_certificate :
    kernelCertified recipe_945e60912113 = true := by decide

end LeanToCook.SourceCatalog
