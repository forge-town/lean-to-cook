/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 微波葱姜黑鳕鱼 · dishes/aquatic/微波葱姜黑鳕鱼.md -/
def recipe_cc2c4f786f63 : Recipe := {
  id := "cc2c4f786f63"
  title := "微波葱姜黑鳕鱼"
  category := "aquatic"
  sourcePath := "dishes/aquatic/微波葱姜黑鳕鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "黑鳕鱼，带皮",
    "青葱",
    "姜",
    "料酒",
    "酱油",
    "芝麻油",
    "花生油",
    "密封袋"
  ]
  steps := [
    { index := 1, instruction := "鱼片分别放入密封袋，鱼皮向下放在盘子中。" },
    { index := 2, instruction := "取葱白切丝 25g，姜去皮后切丝，10g，混合在一起后分成两半，分别放在袋内鱼片上。" },
    { index := 3, instruction := "每个袋子倒入 2.5mL 料酒。" },
    { index := 4, instruction := "封好密封袋，放入微波炉中，中火（800 瓦）微波至不透明且容易散开时（约 3.5-5 分钟），从袋中取出鱼片。" },
    { index := 5, instruction := "去除青葱和姜。" },
    { index := 6, instruction := "取酱油 25mL，芝麻油 2mL，混合均匀后平均淋在两片鱼片上。" },
    { index := 7, instruction := "取葱绿切细丝 10g，姜去皮后切丝 3g，混合后分成两份撒在鱼片上。" },
    { index := 8, instruction := "取花生油 50mL，在小锅中加热至 190℃。" },
    { index := 9, instruction := "将热油淋到放油葱绿的鱼片上，立刻上桌。" }
  ]
}

theorem recipe_cc2c4f786f63_ingredients_nonempty :
    recipe_cc2c4f786f63.ingredients.isEmpty = false := by decide

theorem recipe_cc2c4f786f63_steps_nonempty :
    recipe_cc2c4f786f63.steps.isEmpty = false := by decide

theorem recipe_cc2c4f786f63_step_count :
    recipe_cc2c4f786f63.steps.length = 9 := by decide

theorem recipe_cc2c4f786f63_steps_ordered :
    orderedFrom 1 recipe_cc2c4f786f63.steps = true := by decide

theorem recipe_cc2c4f786f63_executes_to_terminal :
    executesToTerminal recipe_cc2c4f786f63 = true := by decide

theorem recipe_cc2c4f786f63_kernel_certificate :
    kernelCertified recipe_cc2c4f786f63 = true := by decide

end LeanToCook.SourceCatalog
