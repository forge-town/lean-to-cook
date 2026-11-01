/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 意式香肠北非蛋 · dishes/breakfast/意式香肠北非蛋.md -/
def recipe_e9b179096587 : Recipe := {
  id := "e9b179096587"
  title := "意式香肠北非蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/意式香肠北非蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "意式猪肉香肠（去肠衣）、辣香肠 (Chorizo) 或切块的午餐肉",
    "百味来 (Barilla) 拿坡里意面酱 (Napoletana Sauce)",
    "鸡蛋",
    "甜椒（青椒或红椒皆可）",
    "洋葱",
    "橄榄油",
    "帕马森干酪（可选）",
    "新鲜欧芹（可选）",
    "干辣椒碎（可选）",
    "面包（推荐酸面团面包 Sourdough、恰巴塔 Ciabatta 或厚切吐司）",
    "宽口平底锅（带锅盖）"
  ]
  steps := [
    { index := 1, instruction := "将意式猪肉香肠去肠衣备用；洋葱切小丁；甜椒切细丝。" },
    { index := 2, instruction := "在宽口平底锅中倒入 10ml - 15ml 橄榄油，中火加热。" },
    { index := 3, instruction := "放入处理好的香肠或午餐肉，翻炒至边缘金黄酥脆（如果使用生香肠，翻炒时用勺子将其捣碎变色）。" },
    { index := 4, instruction := "将洋葱丁和甜椒丝加入锅中与肉一起翻炒，持续翻炒 4 - 5 分钟，直到蔬菜变软，洋葱呈半透明状。" },
    { index := 5, instruction := "倒入百味来拿坡里意面酱，搅拌均匀。将火调至中低火，保持微沸炖煮 2 - 3 分钟。（如果酱汁看起来太稠，可以加入 15ml 水）。" },
    { index := 6, instruction := "用勺子的背面在锅内的酱汁中挖出 3 - 4 个小“坑”。" },
    { index := 7, instruction := "依次小心地将鸡蛋打入每个坑中。" },
    { index := 8, instruction := "盖上平底锅的盖子，利用蒸汽焖熟蛋白。等待 3 - 5 分钟。注意：请频繁检查状态。当蛋白变得不透明且凝固，但轻轻摇晃平底锅时蛋黄仍能晃动（溏心状态）时即可结束这一步。" },
    { index := 9, instruction := "关火。根据个人喜好撒上磨碎的帕马森干酪、新鲜欧芹或干辣椒碎。" },
    { index := 10, instruction := "将平底锅直接端上桌，配以硬壳面包蘸取蛋黄与酱汁食用。" }
  ]
}

theorem recipe_e9b179096587_ingredients_nonempty :
    recipe_e9b179096587.ingredients.isEmpty = false := by decide

theorem recipe_e9b179096587_steps_nonempty :
    recipe_e9b179096587.steps.isEmpty = false := by decide

theorem recipe_e9b179096587_step_count :
    recipe_e9b179096587.steps.length = 10 := by decide

theorem recipe_e9b179096587_steps_ordered :
    orderedFrom 1 recipe_e9b179096587.steps = true := by decide

theorem recipe_e9b179096587_executes_to_terminal :
    executesToTerminal recipe_e9b179096587 = true := by decide

theorem recipe_e9b179096587_kernel_certificate :
    kernelCertified recipe_e9b179096587 = true := by decide

end LeanToCook.SourceCatalog
