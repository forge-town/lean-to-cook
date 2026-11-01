/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 冷吃兔 · dishes/meat_dish/冷吃兔.md -/
def recipe_50cf74d8dc74 : Recipe := {
  id := "50cf74d8dc74"
  title := "冷吃兔"
  category := "meat"
  sourcePath := "dishes/meat_dish/冷吃兔.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "兔肉",
    "盐",
    "味精",
    "蚝油",
    "料酒",
    "蒜",
    "姜",
    "小葱/大葱/洋葱",
    "干辣椒",
    "青花椒",
    "八角",
    "桂皮",
    "香叶",
    "山奈",
    "白蔻",
    "小茴香",
    "白芝麻"
  ]
  steps := [
    { index := 1, instruction := "蒜、姜扒皮并剁碎备用，八角、桂皮、香叶、山奈、白蔻、小茴香洗净备用。" },
    { index := 2, instruction := "干辣椒剪成 2 厘米的小段，洗净备用。" },
    { index := 3, instruction := "小葱/大葱/洋葱洗净，洋葱切成小块。" },
    { index := 4, instruction := "兔肉剁成 2 厘米的小块，加入盐、料酒、味精调味，腌制 15 分钟。" },
    { index := 5, instruction := "锅中倒油，油温 4 成热下小葱/大葱/洋葱，中小火煸炒出香味，待到小葱/大葱/洋葱微焦，将其捞出。" },
    { index := 6, instruction := "开大火升高油温，油温 8 成热时下入兔肉，炸制过程转中小火，炸至兔肉微微焦黄时捞出兔肉。" },
    { index := 7, instruction := "升高油温，倒入干辣椒、青花椒、八角、桂皮、香叶、山奈、白蔻、小茴香；转小火将辣椒段炸脆。" },
    { index := 8, instruction := "重新倒入兔肉，加入蚝油、翻炒几分钟。" },
    { index := 9, instruction := "关火，加入蒜、姜、白芝麻，翻炒均匀。" },
    { index := 10, instruction := "放置一夜更加入味。" }
  ]
}

theorem recipe_50cf74d8dc74_ingredients_nonempty :
    recipe_50cf74d8dc74.ingredients.isEmpty = false := by decide

theorem recipe_50cf74d8dc74_steps_nonempty :
    recipe_50cf74d8dc74.steps.isEmpty = false := by decide

theorem recipe_50cf74d8dc74_step_count :
    recipe_50cf74d8dc74.steps.length = 10 := by decide

theorem recipe_50cf74d8dc74_steps_ordered :
    orderedFrom 1 recipe_50cf74d8dc74.steps = true := by decide

theorem recipe_50cf74d8dc74_executes_to_terminal :
    executesToTerminal recipe_50cf74d8dc74 = true := by decide

theorem recipe_50cf74d8dc74_kernel_certificate :
    kernelCertified recipe_50cf74d8dc74 = true := by decide

end LeanToCook.SourceCatalog
