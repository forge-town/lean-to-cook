/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鹰嘴豆炸饼 · dishes/staple/鹰嘴豆炸饼.md -/
def recipe_343910aaf767 : Recipe := {
  id := "343910aaf767"
  title := "鹰嘴豆炸饼"
  category := "staple"
  sourcePath := "dishes/staple/鹰嘴豆炸饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鹰嘴豆（干）",
    "中筋面粉",
    "酸奶",
    "洋葱",
    "番茄",
    "生姜",
    "大蒜",
    "青辣椒",
    "香菜",
    "红茶包（用于鹰嘴豆上色）",
    "食用油",
    "姜黄粉",
    "红辣椒粉",
    "香菜粉",
    "孜然粉",
    "印度综合香料粉(Garam Masala)",
    "石榴粉(Amchur/Anardana)— 可用柠檬汁替代",
    "盐",
    "小苏打",
    "深锅（炸饼用）"
  ]
  steps := [
    { index := 1, instruction := "将干鹰嘴豆用清水浸泡过夜（至少 8 小时），浸泡后体积会膨胀至约两倍" },
    { index := 2, instruction := "将浸泡好的鹰嘴豆沥干水分" },
    { index := 3, instruction := "放入锅中，加入 500ml 水和 1 个红茶包（用于上色）" },
    { index := 4, instruction := "大火煮沸后转中火，煮 25-30 分钟，直至鹰嘴豆用手指可以轻松压碎" },
    { index := 5, instruction := "取出红茶包，保留煮豆的汤水，备用" },
    { index := 6, instruction := "在炒锅中倒入 30ml 食用油，中火加热" },
    { index := 7, instruction := "放入切碎的洋葱，翻炒至金棕色（约 6-8 分钟）" },
    { index := 8, instruction := "加入磨碎的生姜和大蒜，翻炒 1 分钟" },
    { index := 9, instruction := "加入切碎的番茄，翻炒至番茄完全软烂出油（约 5 分钟）" },
    { index := 10, instruction := "加入姜黄粉 3g、红辣椒粉 5g、香菜粉 8g、孜然粉 5g、盐 6g" },
    { index := 11, instruction := "翻炒 2 分钟，使香料充分释放香味" },
    { index := 12, instruction := "将煮好的鹰嘴豆连同汤水一起倒入锅中" },
    { index := 13, instruction := "加入青辣椒，搅拌均匀" },
    { index := 14, instruction := "大火煮沸后转小火，炖 15-20 分钟，期间可用铲子背面压碎一些鹰嘴豆使汤汁变稠" },
    { index := 15, instruction := "加入印度综合香料粉 5g 和石榴粉 3g（或柠檬汁 15ml）" },
    { index := 16, instruction := "搅拌均匀后关火，备用" },
    { index := 17, instruction := "在大碗中混合中筋面粉 250g、小苏打 2g、盐 3g" },
    { index := 18, instruction := "加入酸奶 60ml 和食用油 15ml" },
    { index := 19, instruction := "逐渐加入温水，边加边揉，揉成光滑柔软的面团（面团应比普通面团稍软）" },
    { index := 20, instruction := "用湿布盖住面团，静置 30 分钟" },
    { index := 21, instruction := "将面团分成 8 个等大的小剂子" },
    { index := 22, instruction := "取一个剂子，手上沾少量油，擀成直径约 15cm、厚度约 3mm 的圆形面饼" },
    { index := 23, instruction := "在深锅中倒入 500ml 食用油，中大火加热至油温约 180°C" },
    { index := 24, instruction := "将面饼轻轻滑入热油中，用漏勺轻轻按压面饼使其膨胀鼓起" },
    { index := 25, instruction := "炸 1-2 分钟，翻面炸至两面金黄" },
    { index := 26, instruction := "捞出，用厨房纸吸去多余油分" },
    { index := 27, instruction := "将鹰嘴豆咖喱重新加热" },
    { index := 28, instruction := "炸饼趁热上桌，搭配鹰嘴豆咖喱食用" },
    { index := 29, instruction := "可搭配切片洋葱、青辣椒和柠檬角" }
  ]
}

theorem recipe_343910aaf767_ingredients_nonempty :
    recipe_343910aaf767.ingredients.isEmpty = false := by decide

theorem recipe_343910aaf767_steps_nonempty :
    recipe_343910aaf767.steps.isEmpty = false := by decide

theorem recipe_343910aaf767_step_count :
    recipe_343910aaf767.steps.length = 29 := by decide

theorem recipe_343910aaf767_steps_ordered :
    orderedFrom 1 recipe_343910aaf767.steps = true := by decide

theorem recipe_343910aaf767_executes_to_terminal :
    executesToTerminal recipe_343910aaf767 = true := by decide

theorem recipe_343910aaf767_kernel_certificate :
    kernelCertified recipe_343910aaf767 = true := by decide

end LeanToCook.SourceCatalog
