/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 小炒藕丁 · dishes/vegetable_dish/小炒藕丁/小炒藕丁.md -/
def recipe_a5e465c95847 : Recipe := {
  id := "a5e465c95847"
  title := "小炒藕丁"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/小炒藕丁/小炒藕丁.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "大葱",
    "小米辣",
    "莲藕",
    "生抽",
    "老抽",
    "耗油",
    "油"
  ]
  steps := [
    { index := 1, instruction := "大葱、小米辣切小段，备用" },
    { index := 2, instruction := "莲藕去皮，切成不超过 3cm 的小块，放入水中备用（防止氧化发黑）" },
    { index := 3, instruction := "取炒锅，锅内放入 500ml 凉水，煮沸" },
    { index := 4, instruction := "将藕丁下入沸水中，焯水 2 分钟后，取出放入盘中备用" },
    { index := 5, instruction := "将锅中水倒掉后，将锅加热干燥，加入 10-15 ml 食用油" },
    { index := 6, instruction := "待油温升高后，下入葱花，小米辣爆香" },
    { index := 7, instruction := "将处理好的藕丁下入锅中，大火翻炒" },
    { index := 8, instruction := "加入生抽、老抽、耗油" },
    { index := 9, instruction := "翻炒 2 分钟即可出锅" }
  ]
}

theorem recipe_a5e465c95847_ingredients_nonempty :
    recipe_a5e465c95847.ingredients.isEmpty = false := by decide

theorem recipe_a5e465c95847_steps_nonempty :
    recipe_a5e465c95847.steps.isEmpty = false := by decide

theorem recipe_a5e465c95847_step_count :
    recipe_a5e465c95847.steps.length = 9 := by decide

theorem recipe_a5e465c95847_steps_ordered :
    orderedFrom 1 recipe_a5e465c95847.steps = true := by decide

theorem recipe_a5e465c95847_executes_to_terminal :
    executesToTerminal recipe_a5e465c95847 = true := by decide

theorem recipe_a5e465c95847_kernel_certificate :
    kernelCertified recipe_a5e465c95847 = true := by decide

end LeanToCook.SourceCatalog
