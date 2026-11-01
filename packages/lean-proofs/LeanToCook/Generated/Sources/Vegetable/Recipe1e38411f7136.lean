/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 印度葫芦丸子 · dishes/vegetable_dish/印度葫芦丸子.md -/
def recipe_1e38411f7136 : Recipe := {
  id := "1e38411f7136"
  title := "印度葫芦丸子"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/印度葫芦丸子.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "瓠瓜（葫芦）",
    "鹰嘴豆粉(Besan)",
    "洋葱",
    "番茄",
    "生姜",
    "大蒜",
    "青辣椒",
    "香菜",
    "姜黄粉(Turmeric)",
    "红辣椒粉",
    "香菜粉(Coriander Powder)",
    "孜然粉",
    "印度综合香料粉(Garam Masala)",
    "盐",
    "食用油",
    "深锅或炒锅"
  ]
  steps := [
    { index := 1, instruction := "将瓠瓜去皮，用刨丝器刨成细丝" },
    { index := 2, instruction := "用手将瓠瓜丝中的水分挤干，尽量挤干，否则丸子炸不成型" },
    { index := 3, instruction := "在挤干水分的瓠瓜丝中加入鹰嘴豆粉 80g、盐 3g、红辣椒粉 3g、香菜粉 3g" },
    { index := 4, instruction := "用手充分混合均匀，揉成不粘手的面团状" },
    { index := 5, instruction := "将混合物搓成直径约 3cm 的小丸子，备用" },
    { index := 6, instruction := "在深锅中倒入 500ml 食用油，中火加热至油温约 170°C（放入一小块面团，能快速浮起且冒泡即可）" },
    { index := 7, instruction := "将丸子分批放入油中，炸 4-5 分钟，直至表面金黄酥脆" },
    { index := 8, instruction := "炸好的丸子用厨房纸吸去多余油分，备用" },
    { index := 9, instruction := "在炒锅中倒入 30ml 食用油，中火加热 10 秒" },
    { index := 10, instruction := "放入切碎的洋葱，翻炒至洋葱变成金棕色（约 5-7 分钟）" },
    { index := 11, instruction := "加入磨碎的生姜和大蒜，翻炒 1 分钟至香味散出" },
    { index := 12, instruction := "加入切碎的番茄，翻炒至番茄完全软烂出油（约 5 分钟）" },
    { index := 13, instruction := "加入姜黄粉 3g、红辣椒粉 5g、香菜粉 5g、孜然粉 3g、盐 5g" },
    { index := 14, instruction := "翻炒 2 分钟，使香料与番茄充分融合" },
    { index := 15, instruction := "加入 200ml 水，搅拌均匀，煮沸后转小火炖 5 分钟" },
    { index := 16, instruction := "将炸好的丸子轻轻放入酱汁中，小火炖 3-5 分钟，使丸子吸收酱汁" },
    { index := 17, instruction := "撒上印度综合香料粉 3g 和切碎的青辣椒" },
    { index := 18, instruction := "关火，撒上香菜叶装饰，盛盘" }
  ]
}

theorem recipe_1e38411f7136_ingredients_nonempty :
    recipe_1e38411f7136.ingredients.isEmpty = false := by decide

theorem recipe_1e38411f7136_steps_nonempty :
    recipe_1e38411f7136.steps.isEmpty = false := by decide

theorem recipe_1e38411f7136_step_count :
    recipe_1e38411f7136.steps.length = 18 := by decide

theorem recipe_1e38411f7136_steps_ordered :
    orderedFrom 1 recipe_1e38411f7136.steps = true := by decide

theorem recipe_1e38411f7136_executes_to_terminal :
    executesToTerminal recipe_1e38411f7136 = true := by decide

theorem recipe_1e38411f7136_kernel_certificate :
    kernelCertified recipe_1e38411f7136 = true := by decide

end LeanToCook.SourceCatalog
