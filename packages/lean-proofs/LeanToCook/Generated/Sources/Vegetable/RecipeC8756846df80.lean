/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 白灼菜心 · dishes/vegetable_dish/白灼菜心/白灼菜心.md -/
def recipe_c8756846df80 : Recipe := {
  id := "c8756846df80"
  title := "白灼菜心"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/白灼菜心/白灼菜心.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "新鲜菜心",
    "生抽、蚝油、盐",
    "大蒜、小米辣",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "菜心洗净，去除根部比较硬或老的地方。此处还用刀刮了刮菜心根茎部分，刮掉外面那层比较硬的，菜心内部更可口，但要注意根茎白灼时长，时间太长的话根茎不脆了" },
    { index := 2, instruction := "大蒜切成蒜末，有洋葱顺便加了点洋葱" },
    { index := 3, instruction := "调制灵魂料汁：生抽 5g 吧、蚝油 5g，加 3g 糖和 100g 清水半碗成一碗汁儿" },
    { index := 4, instruction := "一锅 500ml 清水加 5g 盐和 10g 食用油烧开" },
    { index := 5, instruction := "将菜心根茎在沸水中烫 1 分钟，直到根茎颜色变成深绿。再将整个菜心放到锅中烫熟 1 分钟，捞起来码入盘中" },
    { index := 6, instruction := "开另一小锅将兑好的料汁倒入，小火烧开，放入一半的蒜末，一点点姜丝和小米椒碎。在制作时加了一点点洋葱碎和大蒜，先在锅底倒油，五成热后倒入蒜末、洋葱，稍稍爆香后再加入料汁，加入小米辣煮开" },
    { index := 7, instruction := "料汁稍微收汁，煮沸后稍等十来秒吧，后直接浇在菜心上，不要特别多，但蒜末还是很给力的不要少蒜" }
  ]
}

theorem recipe_c8756846df80_ingredients_nonempty :
    recipe_c8756846df80.ingredients.isEmpty = false := by decide

theorem recipe_c8756846df80_steps_nonempty :
    recipe_c8756846df80.steps.isEmpty = false := by decide

theorem recipe_c8756846df80_step_count :
    recipe_c8756846df80.steps.length = 7 := by decide

theorem recipe_c8756846df80_steps_ordered :
    orderedFrom 1 recipe_c8756846df80.steps = true := by decide

theorem recipe_c8756846df80_executes_to_terminal :
    executesToTerminal recipe_c8756846df80 = true := by decide

theorem recipe_c8756846df80_kernel_certificate :
    kernelCertified recipe_c8756846df80 = true := by decide

end LeanToCook.SourceCatalog
