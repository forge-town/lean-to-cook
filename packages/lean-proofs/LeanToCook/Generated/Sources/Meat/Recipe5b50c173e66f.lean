/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 萝卜炖羊排 · dishes/meat_dish/萝卜炖羊排.md -/
def recipe_5b50c173e66f : Recipe := {
  id := "5b50c173e66f"
  title := "萝卜炖羊排"
  category := "meat"
  sourcePath := "dishes/meat_dish/萝卜炖羊排.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "羊排",
    "白萝卜",
    "大葱",
    "花椒",
    "白芷（可选）",
    "姜",
    "料酒或者黄酒",
    "食用盐",
    "冰糖",
    "水"
  ]
  steps := [
    { index := 1, instruction := "萝卜去皮、滚刀切成 3-5cm 的大块，备用" },
    { index := 2, instruction := "羊排在购买时可以让卖家切好，因为家用刀一般难以切动，备用" },
    { index := 3, instruction := "羊肉冷水下锅，加入一半的料酒，一半的葱姜，煮 10 分钟去掉血腥，（可选）把焯的过程中出现的血沫子可以用勺子盛出来" },
    { index := 4, instruction := "另起一锅冷水，放入切好的白萝卜，放入一半的冰糖，等水开后煮 5 分钟去掉白萝卜的辣味" },
    { index := 5, instruction := "盛出来焯好的羊排，放入高压锅中，加水没过所有食材后再增加大约 300ml 的水" },
    { index := 6, instruction := "将剩余的葱姜料酒，花椒，冰糖，白芷（可选），盐放入锅中，盖锅等待上汽后计时，中火炖大约 15 分钟。" },
    { index := 7, instruction := "关火，等待高压锅放气完毕，开盖，加入之前焯好的萝卜，调味，加入 3-10g 的食盐或者水，品尝汤的咸淡，" },
    { index := 8, instruction := "再开火，中火，高压锅上汽再炖 10 分钟，普通锅盖盖再炖 20 分钟" },
    { index := 9, instruction := "关火，盛盘" }
  ]
}

theorem recipe_5b50c173e66f_ingredients_nonempty :
    recipe_5b50c173e66f.ingredients.isEmpty = false := by decide

theorem recipe_5b50c173e66f_steps_nonempty :
    recipe_5b50c173e66f.steps.isEmpty = false := by decide

theorem recipe_5b50c173e66f_step_count :
    recipe_5b50c173e66f.steps.length = 9 := by decide

theorem recipe_5b50c173e66f_steps_ordered :
    orderedFrom 1 recipe_5b50c173e66f.steps = true := by decide

theorem recipe_5b50c173e66f_executes_to_terminal :
    executesToTerminal recipe_5b50c173e66f = true := by decide

theorem recipe_5b50c173e66f_kernel_certificate :
    kernelCertified recipe_5b50c173e66f = true := by decide

end LeanToCook.SourceCatalog
