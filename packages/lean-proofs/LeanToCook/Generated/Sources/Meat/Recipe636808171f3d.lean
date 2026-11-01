/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 黄油鸡 · dishes/meat_dish/黄油鸡.md -/
def recipe_636808171f3d : Recipe := {
  id := "636808171f3d"
  title := "黄油鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/黄油鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡腿肉（去骨）",
    "酸奶",
    "黄油",
    "淡奶油(Heavy Cream)",
    "番茄",
    "洋葱",
    "生姜",
    "大蒜",
    "腰果（用于增稠）",
    "姜黄粉",
    "红辣椒粉（Kashmiri 红辣椒粉最佳，色红味不辣）",
    "印度综合香料粉(Garam Masala)",
    "香菜粉",
    "孜然粉",
    "小豆蔻粉",
    "干葫芦巴叶(Kasuri Methi)— 可选但强烈推荐",
    "糖",
    "盐",
    "食用油",
    "炒锅",
    "搅拌机/料理机"
  ]
  steps := [
    { index := 1, instruction := "在大碗中混合酸奶、生姜泥、大蒜泥、红辣椒粉、姜黄粉、盐、柠檬汁" },
    { index := 2, instruction := "放入鸡肉块，充分裹上腌料" },
    { index := 3, instruction := "盖保鲜膜，冷藏腌制至少 1 小时" },
    { index := 4, instruction := "在平底锅中倒入 15ml 食用油，大火加热" },
    { index := 5, instruction := "将腌好的鸡肉块放入锅中（不要倒入腌料汁）" },
    { index := 6, instruction := "大火煎至两面焦黄（每面约 3 分钟），鸡肉不需要完全煮熟" },
    { index := 7, instruction := "盛出备用" },
    { index := 8, instruction := "在锅中放入番茄块、洋葱块、腰果、生姜、大蒜和水 100ml" },
    { index := 9, instruction := "大火煮沸后转中火，煮 15 分钟，直至所有材料完全软烂" },
    { index := 10, instruction := "稍微冷却后，倒入搅拌机中打成细腻顺滑的泥状" },
    { index := 11, instruction := "用滤网过滤一遍，去除渣滓，得到顺滑的酱汁，备用" },
    { index := 12, instruction := "在炒锅中放入黄油 50g，中火加热融化" },
    { index := 13, instruction := "倒入过滤好的番茄酱汁" },
    { index := 14, instruction := "加入红辣椒粉 5g、香菜粉 5g、孜然粉 3g、盐 5g" },
    { index := 15, instruction := "翻炒 3-5 分钟，直至酱汁颜色变深且油花浮出" },
    { index := 16, instruction := "放入烤好的鸡肉块，翻拌均匀" },
    { index := 17, instruction := "加入糖 10g（平衡番茄的酸味），搅拌" },
    { index := 18, instruction := "倒入淡奶油 100ml，搅拌均匀" },
    { index := 19, instruction := "小火炖 10-12 分钟，使鸡肉完全熟透且吸收酱汁" },
    { index := 20, instruction := "加入印度综合香料粉 3g、小豆蔻粉 2g" },
    { index := 21, instruction := "撒入干葫芦巴叶 3g（用手搓碎后撒入）" },
    { index := 22, instruction := "搅拌均匀，关火" },
    { index := 23, instruction := "盛盘，可额外淋上少量淡奶油作为装饰" }
  ]
}

theorem recipe_636808171f3d_ingredients_nonempty :
    recipe_636808171f3d.ingredients.isEmpty = false := by decide

theorem recipe_636808171f3d_steps_nonempty :
    recipe_636808171f3d.steps.isEmpty = false := by decide

theorem recipe_636808171f3d_step_count :
    recipe_636808171f3d.steps.length = 23 := by decide

theorem recipe_636808171f3d_steps_ordered :
    orderedFrom 1 recipe_636808171f3d.steps = true := by decide

theorem recipe_636808171f3d_executes_to_terminal :
    executesToTerminal recipe_636808171f3d = true := by decide

theorem recipe_636808171f3d_kernel_certificate :
    kernelCertified recipe_636808171f3d = true := by decide

end LeanToCook.SourceCatalog
