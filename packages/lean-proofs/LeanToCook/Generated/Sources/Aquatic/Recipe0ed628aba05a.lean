/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 肉蟹煲 · dishes/aquatic/肉蟹煲.md -/
def recipe_0ed628aba05a : Recipe := {
  id := "0ed628aba05a"
  title := "肉蟹煲"
  category := "aquatic"
  sourcePath := "dishes/aquatic/肉蟹煲.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "肉蟹（推荐优先级从高到低：缅甸黑蟹、青蟹、梭子蟹、大闸蟹）",
    "虾（可选）",
    "土豆",
    "年糕（推荐硬年糕，新鲜年糕亦可）",
    "洋葱",
    "大蒜",
    "生姜",
    "干辣椒",
    "青椒",
    "红椒",
    "蚝油",
    "海鲜酱（可选）",
    "黄豆酱（可选）",
    "甜面酱（或烧烤酱，可选）",
    "番茄酱（没有就挤半颗番茄碾碎）",
    "淀粉（玉米淀粉或土豆淀粉）",
    "冰糖",
    "鸡精",
    "白胡椒粉",
    "料酒（可使用黄酒替代）",
    "生抽",
    "老抽",
    "啤酒",
    "清水"
  ]
  steps := [
    { index := 1, instruction := "土豆切块为各边均为 3 cm 的立方体，青/红椒切成边长 4 cm 的菱形片，洋葱切成 3 cm 宽的月牙瓣，年糕切成 1 cm 厚片" },
    { index := 2, instruction := "螃蟹切成 50-80 g 的块，裹薄淀粉，180 °C 油温炸 1 分钟捞出" },
    { index := 3, instruction := "锅中放油，蒜姜干辣椒爆香，放所有酱料 + 冰糖小火炒出红油，注意别糊底" },
    { index := 4, instruction := "加螃蟹、土豆、啤酒和清水，烧开转小火炖 12 分钟" },
    { index := 5, instruction := "放年糕和青红椒，开大火收汁到汤汁可以附着在物品表面，最后撒白胡椒粉" }
  ]
}

theorem recipe_0ed628aba05a_ingredients_nonempty :
    recipe_0ed628aba05a.ingredients.isEmpty = false := by decide

theorem recipe_0ed628aba05a_steps_nonempty :
    recipe_0ed628aba05a.steps.isEmpty = false := by decide

theorem recipe_0ed628aba05a_step_count :
    recipe_0ed628aba05a.steps.length = 5 := by decide

theorem recipe_0ed628aba05a_steps_ordered :
    orderedFrom 1 recipe_0ed628aba05a.steps = true := by decide

theorem recipe_0ed628aba05a_executes_to_terminal :
    executesToTerminal recipe_0ed628aba05a = true := by decide

theorem recipe_0ed628aba05a_kernel_certificate :
    kernelCertified recipe_0ed628aba05a = true := by decide

end LeanToCook.SourceCatalog
