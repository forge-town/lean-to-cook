/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 红烧茄子 · dishes/vegetable_dish/红烧茄子.md -/
def recipe_5fa782ab3b20 : Recipe := {
  id := "5fa782ab3b20"
  title := "红烧茄子"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/红烧茄子.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "大蒜",
    "大葱",
    "青辣椒",
    "洋葱",
    "西红柿",
    "青茄子",
    "盐",
    "酱油",
    "鸡蛋",
    "面粉",
    "淀粉"
  ]
  steps := [
    { index := 1, instruction := "青茄子、青辣椒、西红柿、洋葱、大葱洗净。" },
    { index := 2, instruction := "大葱切 5 毫米宽的葱花，大蒜扒皮并拍碎，西红柿切 6 立方厘米的块，青辣椒、洋葱切 5g 的块。" },
    { index := 3, instruction := "茄子切菱形块（先切 2 公分厚的片，然后再把片切成 2 公分的条，最后斜刀切块儿...）。" },
    { index := 4, instruction := "将面粉倒入盆中，依次加入少量水，搅拌均匀，呈粘稠糊状。" },
    { index := 5, instruction := "加入淀粉，加入 30 克水，搅拌均匀。" },
    { index := 6, instruction := "将鸡蛋打到盆中，加入（面粉 / 20）克的盐，搅拌均匀。" },
    { index := 7, instruction := "将茄块倒入面糊中，搅拌使茄块的每一面都能沾上面糊。" },
    { index := 8, instruction := "开大火，热锅，加入 500 毫升的油，当能看到锅里的油冒出一丝烟时，调至小火，将茄块用筷子夹入到油锅，待所有的茄块下锅之后，调至中火，直到茄块变金黄色时捞出，将油倒出。" },
    { index := 9, instruction := "加入（份数  5）g 的油，放入大蒜、葱花，翻炒 15 秒，放入青辣椒块翻炒 30 秒，放入西红柿翻炒 30 秒。" },
    { index := 10, instruction := "放入炸好的茄块，加水面高度为锅内食材的 0.8 倍。" },
    { index := 11, instruction := "放入酱油和（份数  3）g 的盐。" },
    { index := 12, instruction := "等待，直到汤汁呈粘稠状（水位大概为剩余食材高度的 0.2-0.3 倍），开盖，盛出菜，关火。" }
  ]
}

theorem recipe_5fa782ab3b20_ingredients_nonempty :
    recipe_5fa782ab3b20.ingredients.isEmpty = false := by decide

theorem recipe_5fa782ab3b20_steps_nonempty :
    recipe_5fa782ab3b20.steps.isEmpty = false := by decide

theorem recipe_5fa782ab3b20_step_count :
    recipe_5fa782ab3b20.steps.length = 12 := by decide

theorem recipe_5fa782ab3b20_steps_ordered :
    orderedFrom 1 recipe_5fa782ab3b20.steps = true := by decide

theorem recipe_5fa782ab3b20_executes_to_terminal :
    executesToTerminal recipe_5fa782ab3b20 = true := by decide

theorem recipe_5fa782ab3b20_kernel_certificate :
    kernelCertified recipe_5fa782ab3b20 = true := by decide

end LeanToCook.SourceCatalog
