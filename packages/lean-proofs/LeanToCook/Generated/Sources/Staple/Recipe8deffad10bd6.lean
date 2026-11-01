/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鲜肉烧卖 · dishes/staple/鲜肉烧卖.md -/
def recipe_8deffad10bd6 : Recipe := {
  id := "8deffad10bd6"
  title := "鲜肉烧卖"
  category := "staple"
  sourcePath := "dishes/staple/鲜肉烧卖.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "烧卖皮",
    "猪肉末（肥瘦 3:7，如果想做低脂版本，用猪里脊肉或猪前腿肉）",
    "生姜末",
    "葱末（只用绿色部分）",
    "生抽",
    "料酒",
    "盐",
    "糖（可选）",
    "白胡椒粉（可选）",
    "芝麻油",
    "高汤或浓汤宝",
    "冬笋（可选）",
    "皮冻（可选但推荐）",
    "香菇（或干香菇泡发，可选）",
    "虾仁（可选）",
    "猪油（或鸡油）（低脂版本）",
    "复配食品增稠剂（κ-卡拉胶 45%、瓜尔胶 35%、氯化钾 20%）（或玉米淀粉）（低脂版本）",
    "蒸笼垫（推荐顺序为刷油竹垫、草垫、粽叶、带孔硅油纸，传统上用草垫，现在更多用带孔硅油纸）"
  ]
  steps := [
    { index := 1, instruction := "（低脂版本）取 10 mL 冷水，加入复配食品增稠剂，调成糊糊" },
    { index := 2, instruction := "（低脂版本）加入 25 mL 开水，搅拌至半透明凝胶" },
    { index := 3, instruction := "（低脂版本）冷却后混入 280 g 纯瘦肉糜 + 15 g 融化猪油（或鸡油）" },
    { index := 4, instruction := "将猪肉末与生姜末、葱末混合，加入酱油、料酒、盐、糖、白胡椒粉，顺一个方向搅拌上劲" },
    { index := 5, instruction := "如果使用浓汤宝，取浓汤宝块加入 15 mL 热水混合，搅拌至乳浊液完全分散，再加入 15 mL 常温水" },
    { index := 6, instruction := "慢慢加入水或高汤，继续搅拌，直到馅料吸收水分，变得粘稠，如果觉得肉馅太稠，补 5 mL 水继续搅拌" },
    { index := 7, instruction := "加入可选配料（冬笋、皮冻、香菇），最后淋上芝麻油，拌匀。冷藏 30 分钟，让味道融合" },
    { index := 8, instruction := "取一张烧卖皮，放上约 20-25 g 馅料（别太贪心，否则包不住）" },
    { index := 9, instruction := "用虎口轻轻收拢皮子边缘，形成“花瓶”状，顶部留开口" },
    { index := 10, instruction := "用手指轻轻压实底部，确保站立稳定" },
    { index := 11, instruction := "如果要加虾仁，在顶部加一颗虾仁" },
    { index := 12, instruction := "重复包烧卖的步骤，直到包好" },
    { index := 13, instruction := "放在蒸笼里，间隔开，避免粘连" },
    { index := 14, instruction := "大火蒸 8-10 分钟即可" }
  ]
}

theorem recipe_8deffad10bd6_ingredients_nonempty :
    recipe_8deffad10bd6.ingredients.isEmpty = false := by decide

theorem recipe_8deffad10bd6_steps_nonempty :
    recipe_8deffad10bd6.steps.isEmpty = false := by decide

theorem recipe_8deffad10bd6_step_count :
    recipe_8deffad10bd6.steps.length = 14 := by decide

theorem recipe_8deffad10bd6_steps_ordered :
    orderedFrom 1 recipe_8deffad10bd6.steps = true := by decide

theorem recipe_8deffad10bd6_executes_to_terminal :
    executesToTerminal recipe_8deffad10bd6 = true := by decide

theorem recipe_8deffad10bd6_kernel_certificate :
    kernelCertified recipe_8deffad10bd6 = true := by decide

end LeanToCook.SourceCatalog
