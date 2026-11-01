/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒜蓉空心菜 · dishes/vegetable_dish/蒜蓉空心菜/蒜蓉空心菜.md -/
def recipe_a1b0c1fdfc06 : Recipe := {
  id := "a1b0c1fdfc06"
  title := "蒜蓉空心菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/蒜蓉空心菜/蒜蓉空心菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "空心菜",
    "蒜末",
    "盐",
    "生抽",
    "筷子",
    "铲子"
  ]
  steps := [
    { index := 1, instruction := "空心菜洗净，去掉烂叶或者老梗，均匀切成 2 段或者 3 段（防止过长不好炒）" },
    { index := 2, instruction := "锅里先倒少量油，烧至微微冒烟，此时拿起锅将国内的热油向四周浸润，让油均匀覆盖锅底，然后再倒入剩余的油（热锅凉油法）。" },
    { index := 3, instruction := "放入蒜末，小火炒 10 到 15 秒煸香" },
    { index := 4, instruction := "尽快均匀地放入空心菜，开大火，左手拿铲子，右手拿筷子，配合将空心菜不停翻动，直至软化变绿。" },
    { index := 5, instruction := "接着不需使用筷子，而是使用铲子快速翻炒已软化的空心菜 15 - 20 秒，使之受热更均匀，撒入盐 2 g ，白糖 3 g，生抽 8 ml。" },
    { index := 6, instruction := "继续大火翻炒 10 秒，即可出锅。" }
  ]
}

theorem recipe_a1b0c1fdfc06_ingredients_nonempty :
    recipe_a1b0c1fdfc06.ingredients.isEmpty = false := by decide

theorem recipe_a1b0c1fdfc06_steps_nonempty :
    recipe_a1b0c1fdfc06.steps.isEmpty = false := by decide

theorem recipe_a1b0c1fdfc06_step_count :
    recipe_a1b0c1fdfc06.steps.length = 6 := by decide

theorem recipe_a1b0c1fdfc06_steps_ordered :
    orderedFrom 1 recipe_a1b0c1fdfc06.steps = true := by decide

theorem recipe_a1b0c1fdfc06_executes_to_terminal :
    executesToTerminal recipe_a1b0c1fdfc06 = true := by decide

theorem recipe_a1b0c1fdfc06_kernel_certificate :
    kernelCertified recipe_a1b0c1fdfc06 = true := by decide

end LeanToCook.SourceCatalog
