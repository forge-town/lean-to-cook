/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 杀猪菜 · dishes/meat_dish/杀猪菜.md -/
def recipe_c5fddf9813b2 : Recipe := {
  id := "c5fddf9813b2"
  title := "杀猪菜"
  category := "meat"
  sourcePath := "dishes/meat_dish/杀猪菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "血肠",
    "酸菜",
    "排骨",
    "料酒",
    "辣椒",
    "香叶",
    "八角",
    "葱结",
    "香油",
    "菜籽油",
    "蒜"
  ]
  steps := [
    { index := 1, instruction := "血肠用牙签多扎一些小孔，然后放水中小火煮十分钟，不要让水烧开，保持 80 度，否则血肠非常容易爆开。" },
    { index := 2, instruction := "煮好的血肠切块备用。" },
    { index := 3, instruction := "排骨放料酒焯水，控干水分备用。" },
    { index := 4, instruction := "锅内放入菜籽油，放蒜瓣，干辣椒，姜粉炒香。" },
    { index := 5, instruction := "放入排骨翻炒至表面金黄。" },
    { index := 6, instruction := "酸菜洗净拧干水分，放入锅中，加入香油翻炒，香油可以更好的去除酸味而且让酸菜更香，大火翻炒二分钟。" },
    { index := 7, instruction := "加入 600 毫升热水。" },
    { index := 8, instruction := "转入电压力锅，加香叶，八角，葱结，盐。" },
    { index := 9, instruction := "浓香模式压 40 分钟。" },
    { index := 10, instruction := "到时间后放气开盖。加入血肠和枸杞，盖上锅盖焖二分钟即可，血肠是熟的，不需再加热。" },
    { index := 11, instruction := "倒入盆中，按照上表调制蘸料，即可开吃。" }
  ]
}

theorem recipe_c5fddf9813b2_ingredients_nonempty :
    recipe_c5fddf9813b2.ingredients.isEmpty = false := by decide

theorem recipe_c5fddf9813b2_steps_nonempty :
    recipe_c5fddf9813b2.steps.isEmpty = false := by decide

theorem recipe_c5fddf9813b2_step_count :
    recipe_c5fddf9813b2.steps.length = 11 := by decide

theorem recipe_c5fddf9813b2_steps_ordered :
    orderedFrom 1 recipe_c5fddf9813b2.steps = true := by decide

theorem recipe_c5fddf9813b2_executes_to_terminal :
    executesToTerminal recipe_c5fddf9813b2 = true := by decide

theorem recipe_c5fddf9813b2_kernel_certificate :
    kernelCertified recipe_c5fddf9813b2 = true := by decide

end LeanToCook.SourceCatalog
