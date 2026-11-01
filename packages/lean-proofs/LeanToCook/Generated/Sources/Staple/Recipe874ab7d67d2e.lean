/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 红芸豆拌饭 · dishes/staple/红芸豆拌饭.md -/
def recipe_874ab7d67d2e : Recipe := {
  id := "874ab7d67d2e"
  title := "红芸豆拌饭"
  category := "staple"
  sourcePath := "dishes/staple/红芸豆拌饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "红芸豆(Kidney Beans / Rajma)",
    "巴斯马蒂香米或普通大米",
    "洋葱",
    "番茄",
    "生姜",
    "大蒜",
    "青辣椒",
    "香菜",
    "食用油或酥油",
    "姜黄粉",
    "红辣椒粉",
    "香菜粉",
    "孜然粉",
    "印度综合香料粉(Garam Masala)",
    "月桂叶",
    "盐",
    "高压锅（推荐）或普通汤锅"
  ]
  steps := [
    { index := 1, instruction := "将干红芸豆用清水浸泡至少 8 小时（过夜），浸泡后体积会膨胀约两倍" },
    { index := 2, instruction := "将浸泡好的红芸豆沥干" },
    { index := 3, instruction := "使用高压锅：放入红芸豆和 600ml 水，盖好锅盖，大火上气后转中火，压 15-20 分钟，直至豆子用手指可轻松压碎" },
    { index := 4, instruction := "使用普通锅：放入红芸豆和足量水，大火煮沸后转中火，煮 60-90 分钟，直至豆子完全软烂" },
    { index := 5, instruction := "煮好后保留煮豆汤水，备用" },
    { index := 6, instruction := "在炒锅中倒入 30ml 食用油，中火加热" },
    { index := 7, instruction := "放入月桂叶 2 片，炸至散出香味（约 10 秒）" },
    { index := 8, instruction := "放入切碎的洋葱，翻炒至金棕色（约 6-8 分钟）" },
    { index := 9, instruction := "加入磨碎的生姜和大蒜，翻炒 1 分钟" },
    { index := 10, instruction := "加入切碎的番茄，翻炒至番茄完全软烂出油（约 5 分钟）" },
    { index := 11, instruction := "加入姜黄粉 3g、红辣椒粉 5g、香菜粉 5g、孜然粉 3g、盐 6g" },
    { index := 12, instruction := "翻炒 2 分钟，使香料与番茄融合" },
    { index := 13, instruction := "将煮好的红芸豆连同汤水一起倒入锅中" },
    { index := 14, instruction := "加入青辣椒，搅拌均匀" },
    { index := 15, instruction := "大火煮沸后转小火，炖 15-20 分钟" },
    { index := 16, instruction := "期间用铲子背面压碎一部分豆子，使汤汁变得浓稠" },
    { index := 17, instruction := "加入印度综合香料粉 3g，搅拌均匀" },
    { index := 18, instruction := "关火，撒上香菜叶" },
    { index := 19, instruction := "将大米淘洗干净" },
    { index := 20, instruction := "放入电饭锅，加入 400ml 水" },
    { index := 21, instruction := "正常蒸煮即可" },
    { index := 22, instruction := "将米饭盛入盘中" },
    { index := 23, instruction := "将红芸豆咖喱浇在米饭上或旁边" },
    { index := 24, instruction := "可搭配洋葱沙拉和柠檬角" }
  ]
}

theorem recipe_874ab7d67d2e_ingredients_nonempty :
    recipe_874ab7d67d2e.ingredients.isEmpty = false := by decide

theorem recipe_874ab7d67d2e_steps_nonempty :
    recipe_874ab7d67d2e.steps.isEmpty = false := by decide

theorem recipe_874ab7d67d2e_step_count :
    recipe_874ab7d67d2e.steps.length = 24 := by decide

theorem recipe_874ab7d67d2e_steps_ordered :
    orderedFrom 1 recipe_874ab7d67d2e.steps = true := by decide

theorem recipe_874ab7d67d2e_executes_to_terminal :
    executesToTerminal recipe_874ab7d67d2e = true := by decide

theorem recipe_874ab7d67d2e_kernel_certificate :
    kernelCertified recipe_874ab7d67d2e = true := by decide

end LeanToCook.SourceCatalog
