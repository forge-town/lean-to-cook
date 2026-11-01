/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 微波炉腊肠煲仔饭 · dishes/staple/微波炉腊肠煲仔饭/微波炉腊肠煲仔饭.md -/
def recipe_1d64ef29c97b : Recipe := {
  id := "1d64ef29c97b"
  title := "微波炉腊肠煲仔饭"
  category := "staple"
  sourcePath := "dishes/staple/微波炉腊肠煲仔饭/微波炉腊肠煲仔饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "工具",
    "微波炉",
    "2 个大碗（推荐微波炉专用碗）",
    "1 个小碗",
    "原料",
    "米 200 ml",
    "腊肠 1 根",
    "鸡蛋 1 个",
    "红萝卜 1 个",
    "盐",
    "油 15 ml",
    "生抽 10 ml",
    "香葱 1 颗"
  ]
  steps := [
    { index := 1, instruction := "将米淘洗干净后倒入 饭碗 内，加入 400ml 的水，盖上盖" },
    { index := 2, instruction := "放入微波炉，高火，6 分钟，煮饭途中准备原料" },
    { index := 3, instruction := "6 分钟后，用毛巾或隔热手套取出碗，可以看见米饭已经八分熟" },
    { index := 4, instruction := "在米饭上摆入切片的腊肠，继续高火 2 分钟" },
    { index := 5, instruction := "取出腊肠饭，放入 青菜碗，高火 4-5 分钟" },
    { index := 6, instruction := "在腊肠饭上摆好青菜，磕入鸡蛋，看个人喜好继续高火 40-60 秒" },
    { index := 7, instruction := "取出腊肠饭，此时已经基本完成。" },
    { index := 8, instruction := "将 小碗 放入，继续高火 30 秒" },
    { index := 9, instruction := "在腊肠饭上淋上叮热的生抽，撒上葱花即可" },
    { index := 10, instruction := "多余的青菜可以沾着酱油吃" }
  ]
}

theorem recipe_1d64ef29c97b_ingredients_nonempty :
    recipe_1d64ef29c97b.ingredients.isEmpty = false := by decide

theorem recipe_1d64ef29c97b_steps_nonempty :
    recipe_1d64ef29c97b.steps.isEmpty = false := by decide

theorem recipe_1d64ef29c97b_step_count :
    recipe_1d64ef29c97b.steps.length = 10 := by decide

theorem recipe_1d64ef29c97b_steps_ordered :
    orderedFrom 1 recipe_1d64ef29c97b.steps = true := by decide

theorem recipe_1d64ef29c97b_executes_to_terminal :
    executesToTerminal recipe_1d64ef29c97b = true := by decide

theorem recipe_1d64ef29c97b_kernel_certificate :
    kernelCertified recipe_1d64ef29c97b = true := by decide

end LeanToCook.SourceCatalog
