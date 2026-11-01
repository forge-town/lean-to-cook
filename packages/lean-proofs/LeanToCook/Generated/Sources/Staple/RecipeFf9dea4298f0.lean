/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 豆角焖面 · dishes/staple/豆角焖面/豆角焖面.md -/
def recipe_ff9dea4298f0 : Recipe := {
  id := "ff9dea4298f0"
  title := "豆角焖面"
  category := "staple"
  sourcePath := "dishes/staple/豆角焖面/豆角焖面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鲜面条（韭叶 or 二细<解释见最下方 关于面条粗细区别一栏）",
    "肉（最好为五花肉）",
    "盐",
    "豆角",
    "鸡精",
    "耗油",
    "味精",
    "十三香",
    "生抽",
    "老抽",
    "葱",
    "蒜头",
    "姜",
    "热水",
    "菜刀"
  ]
  steps := [
    { index := 1, instruction := "将豆角切成 5cm - 6cm 的小段。" },
    { index := 2, instruction := "将葱切成 1cm - 2cm 小段。" },
    { index := 3, instruction := "将姜切成 1mm x 1mm x 3cm 的长条" },
    { index := 4, instruction := "将蒜放在砧板上拍碎，切成 1mm 的粒度。" },
    { index := 5, instruction := "将五花肉切成 2mm 厚度的肉片。" },
    { index := 6, instruction := "首先将锅烧热，烧去锅内全部水汽，手放过内距离锅底 10cm 处，感觉明显有些许烤手。" },
    { index := 7, instruction := "加入上述定量的食用油，手持锅柄，离灶 5cm 处，摇晃锅，使食用油充分挂满锅的三分之二（自下而上）。" },
    { index := 8, instruction := "放入全部的姜和全部的葱段，翻炒爆香 5 秒（注意！此时有油飞溅的危险，建议带上手套或做好防护措施）。" },
    { index := 9, instruction := "放入全部的肉片，放入以后不着急饭锅，静置 5 秒后，再翻炒，使所有的肉都裹满食用油。" },
    { index := 10, instruction := "不断翻炒肉片，待到全部肉片都已经变色，沿锅边均匀淋如准备好的生抽，翻炒均匀。" },
    { index := 11, instruction := "依次加入准备好的盐、老抽、耗油、十三香、鸡精以及全部准备好的豆角，翻炒 2 分钟。" },
    { index := 12, instruction := "加入准备好的热水。" },
    { index := 13, instruction := "水开使用勺子舀出锅内 2 分之一菜汤（注意！不要将菜舀出）。" },
    { index := 14, instruction := "将所有面条平铺在菜的上方。" },
    { index := 15, instruction := "盖上锅盖，中火焖 5 分钟。" },
    { index := 16, instruction := "打开锅盖，将舀出的菜汤使用勺子，以每次一勺的量，均匀撒在面条上。" },
    { index := 17, instruction := "盖上锅盖，中火焖 3 分钟。" },
    { index := 18, instruction := "打开锅盖，将所有的蒜、味精均匀撒入。" },
    { index := 19, instruction := "使用筷子不断翻炒，将菜与肉均匀搅拌。" },
    { index := 20, instruction := "关火" }
  ]
}

theorem recipe_ff9dea4298f0_ingredients_nonempty :
    recipe_ff9dea4298f0.ingredients.isEmpty = false := by decide

theorem recipe_ff9dea4298f0_steps_nonempty :
    recipe_ff9dea4298f0.steps.isEmpty = false := by decide

theorem recipe_ff9dea4298f0_step_count :
    recipe_ff9dea4298f0.steps.length = 20 := by decide

theorem recipe_ff9dea4298f0_steps_ordered :
    orderedFrom 1 recipe_ff9dea4298f0.steps = true := by decide

theorem recipe_ff9dea4298f0_executes_to_terminal :
    executesToTerminal recipe_ff9dea4298f0 = true := by decide

theorem recipe_ff9dea4298f0_kernel_certificate :
    kernelCertified recipe_ff9dea4298f0 = true := by decide

end LeanToCook.SourceCatalog
