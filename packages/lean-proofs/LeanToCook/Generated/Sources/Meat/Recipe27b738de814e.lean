/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 小米辣炒肉 · dishes/meat_dish/小米辣炒肉.md -/
def recipe_27b738de814e : Recipe := {
  id := "27b738de814e"
  title := "小米辣炒肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/小米辣炒肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "小米辣",
    "花生油",
    "五花肉/瘦肉",
    "盐",
    "生抽",
    "蚝油",
    "大蒜",
    "姜",
    "豆瓣酱",
    "鸡精",
    "白糖"
  ]
  steps := [
    { index := 1, instruction := "将小米辣洗净，斜刀切大一点" },
    { index := 2, instruction := "肉的话，想切丝切丝，想切片切片，倒入调料（生抽、蚝油、盐）腌制 5 分钟" },
    { index := 3, instruction := "热锅倒油，先把肉炒好盛起" },
    { index := 4, instruction := "姜蒜爆香，倒入豆瓣酱翻炒，到入切好的小米辣，再倒入瘦肉，翻炒一下，放点生抽、鸡精、盐、糖翻炒" }
  ]
}

theorem recipe_27b738de814e_ingredients_nonempty :
    recipe_27b738de814e.ingredients.isEmpty = false := by decide

theorem recipe_27b738de814e_steps_nonempty :
    recipe_27b738de814e.steps.isEmpty = false := by decide

theorem recipe_27b738de814e_step_count :
    recipe_27b738de814e.steps.length = 4 := by decide

theorem recipe_27b738de814e_steps_ordered :
    orderedFrom 1 recipe_27b738de814e.steps = true := by decide

theorem recipe_27b738de814e_executes_to_terminal :
    executesToTerminal recipe_27b738de814e = true := by decide

theorem recipe_27b738de814e_kernel_certificate :
    kernelCertified recipe_27b738de814e = true := by decide

end LeanToCook.SourceCatalog
