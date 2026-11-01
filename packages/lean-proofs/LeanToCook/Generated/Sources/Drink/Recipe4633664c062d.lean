/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酒酿醪糟 · dishes/drink/酒酿醪糟/酒酿醪糟.md -/
def recipe_4633664c062d : Recipe := {
  id := "4633664c062d"
  title := "酒酿醪糟"
  category := "drink"
  sourcePath := "dishes/drink/酒酿醪糟/酒酿醪糟.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "糯米 800g（推荐使用圆糯米）",
    "安琪甜酒曲一包 (8g)（虽然按比例为每 1000g 糯米用 3g，但多放酒曲能提高成功概率）",
    "清水 720g + 600g（720 克用于蒸饭，后 500g 用于发酵）",
    "蒸锅（电饭煲即可）",
    "温度计（可选但推荐）",
    "干净密封玻璃或陶瓷容器 1 个"
  ]
  steps := [
    { index := 1, instruction := "将 800g 糯米淘洗干净放入电饭煲，加入 720g 清水选择蒸饭模式" },
    { index := 2, instruction := "蒸熟后将米饭倒出摊凉，使用干净的工具将其摊至 30°C （用温度计测量为宜，体感温热但不烫手）" },
    { index := 3, instruction := "将 8g 安琪甜酒曲用 20ml 温水（约 30°C）化开，均匀撒在糯米饭中，同时翻拌均匀" },
    { index := 4, instruction := "向糯米饭中加入 600g 清水帮助酒曲翻拌均匀。静置 2-3 分钟后发现糯米饭吸饱水分。这次加水可以让酒酿首次发酵便汤汁丰富" },
    { index := 5, instruction := "用擀面杖在糯米饭中央挖一个小洞（便于出酒）" },
    { index := 6, instruction := "将混合好的米饭装入干净容器中，轻轻压平表面，盖上盖子或保鲜膜密封好" },
    { index := 7, instruction := "放置于 28 ～ 32°C 环境下发酵 24 ～ 48 小时。发酵期间不可剧烈摇晃或移动" },
    { index := 8, instruction := "发酵成功标准为：中间凹槽有透明酒液渗出，整体略带酒香，无异味、不酸败" },
    { index := 9, instruction := "发酵结束后可立即冷藏保存（过程中可以加入桂花），每次食用用干净工具取出，可冷藏保存 7 ～ 10 天" },
    { index := 10, instruction := "可以继续二次发酵，加入 500ml 清水增加酒酿产量（800g 水以内即可）" },
    { index := 11, instruction := "酒酿会一直持续发酵。如果想停止发酵，可以上锅蒸 10 分钟杀菌，或放入冰箱冷藏" },
    { index := 12, instruction := "将 800g 糯米淘洗干净，倒入清水中浸泡 6 ～ 8 小时（冬季建议泡 8 ～ 10 小时），泡至米粒饱满" },
    { index := 13, instruction := "沥干糯米，放入蒸布中，隔水蒸 40 ～ 60 分钟。每 20 分钟打开锅盖翻动一次确保蒸熟均匀" },
    { index := 14, instruction := "蒸熟后将米饭倒出摊凉，加入酒曲，后续步骤同上" },
    { index := 15, instruction := "当然，酒酿老手可以随意尝试不同米搭配。可以替换 20%的糯米为小米、燕麦、黄米、血糯米等" }
  ]
}

theorem recipe_4633664c062d_ingredients_nonempty :
    recipe_4633664c062d.ingredients.isEmpty = false := by decide

theorem recipe_4633664c062d_steps_nonempty :
    recipe_4633664c062d.steps.isEmpty = false := by decide

theorem recipe_4633664c062d_step_count :
    recipe_4633664c062d.steps.length = 15 := by decide

theorem recipe_4633664c062d_steps_ordered :
    orderedFrom 1 recipe_4633664c062d.steps = true := by decide

theorem recipe_4633664c062d_executes_to_terminal :
    executesToTerminal recipe_4633664c062d = true := by decide

theorem recipe_4633664c062d_kernel_certificate :
    kernelCertified recipe_4633664c062d = true := by decide

end LeanToCook.SourceCatalog
