/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 广式萝卜牛腩 · dishes/meat_dish/广式萝卜牛腩/广式萝卜牛腩.md -/
def recipe_e4f312a87ba6 : Recipe := {
  id := "e4f312a87ba6"
  title := "广式萝卜牛腩"
  category := "meat"
  sourcePath := "dishes/meat_dish/广式萝卜牛腩/广式萝卜牛腩.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛腩",
    "白萝卜",
    "姜片",
    "蒜瓣",
    "葱",
    "八角",
    "桂皮",
    "干辣椒",
    "香叶",
    "南乳",
    "柱侯酱",
    "蚝油",
    "酱油",
    "冰糖",
    "盐",
    "老抽"
  ]
  steps := [
    { index := 1, instruction := "萝卜滚到切块备用" },
    { index := 2, instruction := "牛腩整块焯水，加入 2 片姜和一把葱结，等水开之后煮 5-10 分钟，然后捞出切件" },
    { index := 3, instruction := "将牛腩切块，切成自己喜欢的大小（牛腩焯过水，待会儿焖的时候基本不会缩水了，大块的会焖相对就一点的时间）" },
    { index := 4, instruction := "准备焖牛腩的酱料，将南乳、柱侯酱、酱油、蚝油、糖、盐按上面的量调和（冰糖刚刚没了换成了白糖）" },
    { index := 5, instruction := "热锅下油，将姜蒜爆香，放入牛腩，炒至干身，加入调好的酱料，炒香，如果喜欢色泽浓一点的可以加一点老抽润色一下" },
    { index := 6, instruction := "调料充分混合之后倒入热水" },
    { index := 7, instruction := "将牛腩换到汤锅中，放入桂皮、八角、香叶和干辣椒，焖大概 2 个小时" },
    { index := 8, instruction := "牛腩焖到半软之后加入白萝卜继续焖 30 分钟" },
    { index := 9, instruction := "等到萝卜焖软之后就完成，一锅浓香的萝卜牛腩就完成了" }
  ]
}

theorem recipe_e4f312a87ba6_ingredients_nonempty :
    recipe_e4f312a87ba6.ingredients.isEmpty = false := by decide

theorem recipe_e4f312a87ba6_steps_nonempty :
    recipe_e4f312a87ba6.steps.isEmpty = false := by decide

theorem recipe_e4f312a87ba6_step_count :
    recipe_e4f312a87ba6.steps.length = 9 := by decide

theorem recipe_e4f312a87ba6_steps_ordered :
    orderedFrom 1 recipe_e4f312a87ba6.steps = true := by decide

theorem recipe_e4f312a87ba6_executes_to_terminal :
    executesToTerminal recipe_e4f312a87ba6 = true := by decide

theorem recipe_e4f312a87ba6_kernel_certificate :
    kernelCertified recipe_e4f312a87ba6 = true := by decide

end LeanToCook.SourceCatalog
