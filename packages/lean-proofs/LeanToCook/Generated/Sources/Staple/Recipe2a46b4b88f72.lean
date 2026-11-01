/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 印度焖饭 · dishes/staple/印度焖饭.md -/
def recipe_2a46b4b88f72 : Recipe := {
  id := "2a46b4b88f72"
  title := "印度焖饭"
  category := "staple"
  sourcePath := "dishes/staple/印度焖饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "巴斯马蒂长粒香米(Basmati Rice)",
    "鸡腿肉（去骨，可用羊肉替代）",
    "酸奶",
    "洋葱",
    "番茄",
    "生姜",
    "大蒜",
    "青辣椒",
    "香菜",
    "薄荷叶",
    "藏红花(Saffron)— 可用食用黄色素替代",
    "牛奶",
    "酥油(Ghee)",
    "食用油",
    "姜黄粉",
    "红辣椒粉",
    "印度综合香料粉(Garam Masala)",
    "全香料：月桂叶、肉桂棒、小豆蔻、丁香、八角",
    "盐",
    "厚底锅（带盖，密封用）",
    "面团（封锅口用）"
  ]
  steps := [
    { index := 1, instruction := "在大碗中混合酸奶、磨碎的生姜和大蒜、红辣椒粉、姜黄粉、印度综合香料粉、盐、柠檬汁" },
    { index := 2, instruction := "放入鸡肉块，均匀裹上腌料" },
    { index := 3, instruction := "盖保鲜膜，冷藏腌制至少 1 小时（过夜更佳）" },
    { index := 4, instruction := "将藏红花 0.5g 放入 30ml 温牛奶中浸泡 15 分钟，备用" },
    { index := 5, instruction := "在锅中倒入 50ml 食用油，中火加热" },
    { index := 6, instruction := "放入洋葱薄片，翻炒至深金棕色且酥脆（约 12-15 分钟，需耐心）" },
    { index := 7, instruction := "捞出炸洋葱，用厨房纸吸油，备用" },
    { index := 8, instruction := "将浸泡好的巴斯马蒂香米沥干" },
    { index := 9, instruction := "在大锅中烧开 2000ml 水" },
    { index := 10, instruction := "加入月桂叶、小豆蔻、丁香、肉桂棒、八角和盐 10g" },
    { index := 11, instruction := "放入米饭，大火煮 5-6 分钟，直至米粒约七成熟（外部软、芯部仍有硬度）" },
    { index := 12, instruction := "立即沥干，丢弃全香料，备用" },
    { index := 13, instruction := "在厚底锅底部涂抹酥油 15g" },
    { index := 14, instruction := "第一层：将腌制好的鸡肉均匀铺在锅底" },
    { index := 15, instruction := "第二层：铺上一半的半熟米饭" },
    { index := 16, instruction := "撒上一半的炸洋葱、薄荷叶、香菜叶、青辣椒" },
    { index := 17, instruction := "第三层：铺上剩余的米饭" },
    { index := 18, instruction := "撒上剩余的炸洋葱、薄荷叶、香菜叶" },
    { index := 19, instruction := "将藏红花牛奶均匀淋在最上层米饭表面" },
    { index := 20, instruction := "放上剩余的酥油 15g（切小块散放）" },
    { index := 21, instruction := "密封锅盖：用面粉加水和成面团条，沿锅口边缘封住缝隙（传统方法），或用锡纸包裹锅口再盖锅盖" },
    { index := 22, instruction := "先用大火加热 3 分钟，直至锅内开始冒蒸汽" },
    { index := 23, instruction := "然后转最小火，焖 25-30 分钟" },
    { index := 24, instruction := "关火后不要开盖，再焖 5 分钟" },
    { index := 25, instruction := "开盖，用大铲子从底部轻轻翻拌，使各层混合均匀" },
    { index := 26, instruction := "盛盘，搭配酸奶(Raita)食用" }
  ]
}

theorem recipe_2a46b4b88f72_ingredients_nonempty :
    recipe_2a46b4b88f72.ingredients.isEmpty = false := by decide

theorem recipe_2a46b4b88f72_steps_nonempty :
    recipe_2a46b4b88f72.steps.isEmpty = false := by decide

theorem recipe_2a46b4b88f72_step_count :
    recipe_2a46b4b88f72.steps.length = 26 := by decide

theorem recipe_2a46b4b88f72_steps_ordered :
    orderedFrom 1 recipe_2a46b4b88f72.steps = true := by decide

theorem recipe_2a46b4b88f72_executes_to_terminal :
    executesToTerminal recipe_2a46b4b88f72 = true := by decide

theorem recipe_2a46b4b88f72_kernel_certificate :
    kernelCertified recipe_2a46b4b88f72 = true := by decide

end LeanToCook.SourceCatalog
