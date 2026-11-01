/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 麻婆豆腐 · dishes/meat_dish/麻婆豆腐/麻婆豆腐.md -/
def recipe_c68aaa42a6ac : Recipe := {
  id := "c68aaa42a6ac"
  title := "麻婆豆腐"
  category := "meat"
  sourcePath := "dishes/meat_dish/麻婆豆腐/麻婆豆腐.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "内脂豆腐（推荐清美）",
    "水果刀",
    "咸鸭蛋（推荐留夫鸭的，这个是灵魂）",
    "五花肉（超市的肉糜也行）",
    "大蒜",
    "生姜",
    "小米椒（不吃辣的可选）",
    "香辣酱（推荐广乐的）",
    "花椒",
    "食盐",
    "酱油（味极鲜酱油）"
  ]
  steps := [
    { index := 1, instruction := "大蒜和生姜切碎，备用" },
    { index := 2, instruction := "小米辣切成辣椒圈，备用" },
    { index := 3, instruction := "五花肉切成肉糜（本来就是买的肉糜的跳过）" },
    { index := 4, instruction := "肉糜中加入一半的食盐和味极鲜酱油，搅拌均匀，备用" },
    { index := 5, instruction := "鸭蛋用菜刀竖着对半切开（注意安全），去除蛋黄（一定要去除，不然会腥），剩下的蛋白捣碎成大约 2 mm  2 mm 大小，不用太碎，备用" },
    { index := 6, instruction := "打开豆腐包装，用水果刀将在盒子中的豆腐划成大约 2.5 cm  3 cm 大小，备用" },
    { index := 7, instruction := "热锅，锅内放入 10ml - 15ml 食用油。等待 10 秒让油温升高" },
    { index := 8, instruction := "调成小火，放入大蒜、生姜、辣椒圈、花椒、咸鸭蛋、蒜蓉辣酱翻炒 20 秒，炒出香味" },
    { index := 9, instruction := "调成中火，放入肉糜，翻炒大约 1 分钟，肉炒变色" },
    { index := 10, instruction := "调成小火，放入豆腐，将剩下的食盐、味极鲜酱油酱油均匀的洒在豆腐上" },
    { index := 11, instruction := "从锅边倒入开水（不然豆腐容易破），没过豆腐即可" },
    { index := 12, instruction := "开大火，水沸腾后立马转入中火，等待大约 10 分钟" },
    { index := 13, instruction := "等到水只剩 1/5 并且豆腐表面已经入色，关火，盛盘" }
  ]
}

theorem recipe_c68aaa42a6ac_ingredients_nonempty :
    recipe_c68aaa42a6ac.ingredients.isEmpty = false := by decide

theorem recipe_c68aaa42a6ac_steps_nonempty :
    recipe_c68aaa42a6ac.steps.isEmpty = false := by decide

theorem recipe_c68aaa42a6ac_step_count :
    recipe_c68aaa42a6ac.steps.length = 13 := by decide

theorem recipe_c68aaa42a6ac_steps_ordered :
    orderedFrom 1 recipe_c68aaa42a6ac.steps = true := by decide

theorem recipe_c68aaa42a6ac_executes_to_terminal :
    executesToTerminal recipe_c68aaa42a6ac = true := by decide

theorem recipe_c68aaa42a6ac_kernel_certificate :
    kernelCertified recipe_c68aaa42a6ac = true := by decide

end LeanToCook.SourceCatalog
