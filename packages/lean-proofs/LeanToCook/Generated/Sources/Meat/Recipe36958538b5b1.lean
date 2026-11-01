/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 香辣鸡爪煲 · dishes/meat_dish/香辣鸡爪煲/香辣鸡爪煲.md -/
def recipe_36958538b5b1 : Recipe := {
  id := "36958538b5b1"
  title := "香辣鸡爪煲"
  category := "meat"
  sourcePath := "dishes/meat_dish/香辣鸡爪煲/香辣鸡爪煲.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡爪",
    "葱",
    "姜",
    "料酒",
    "香叶",
    "八角",
    "生抽",
    "老抽",
    "蒜",
    "小米椒",
    "辣椒面（可选）",
    "蚝油",
    "五香粉",
    "盐",
    "鸡精"
  ]
  steps := [
    { index := 1, instruction := "给鸡爪剪去指甲。如果买的鸡爪只有脚掌部分，对半切开即可。 如果是整只鸡爪，需要去骨。清水洗干净。" },
    { index := 2, instruction := "鸡爪冷水下锅，葱姜料酒焯水，水开，撇去浮沫。" },
    { index := 3, instruction := "加入香叶、八角、生抽、老抽，盖盖小火慢煮三十分钟。" },
    { index := 4, instruction := "捞出鸡爪，留一碗鸡汤备用。" },
    { index := 5, instruction := "起锅烧油，用小火炒香姜末、蒜末、小米椒，能吃辣再放点辣椒面。加入生抽、老抽、蚝油、五香粉、盐，炒出酱香味。" },
    { index := 6, instruction := "放入鸡爪，放一点盐调味，翻炒一两分钟，再倒入鸡汤，边炒边搅动。" },
    { index := 7, instruction := "放入鸡精提鲜，撒入葱段搅拌均匀即可出锅。" }
  ]
}

theorem recipe_36958538b5b1_ingredients_nonempty :
    recipe_36958538b5b1.ingredients.isEmpty = false := by decide

theorem recipe_36958538b5b1_steps_nonempty :
    recipe_36958538b5b1.steps.isEmpty = false := by decide

theorem recipe_36958538b5b1_step_count :
    recipe_36958538b5b1.steps.length = 7 := by decide

theorem recipe_36958538b5b1_steps_ordered :
    orderedFrom 1 recipe_36958538b5b1.steps = true := by decide

theorem recipe_36958538b5b1_executes_to_terminal :
    executesToTerminal recipe_36958538b5b1 = true := by decide

theorem recipe_36958538b5b1_kernel_certificate :
    kernelCertified recipe_36958538b5b1 = true := by decide

end LeanToCook.SourceCatalog
