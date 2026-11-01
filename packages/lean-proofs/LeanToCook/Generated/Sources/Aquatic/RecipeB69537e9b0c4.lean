/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 咖喱炒蟹 · dishes/aquatic/咖喱炒蟹.md -/
def recipe_b69537e9b0c4 : Recipe := {
  id := "b69537e9b0c4"
  title := "咖喱炒蟹"
  category := "aquatic"
  sourcePath := "dishes/aquatic/咖喱炒蟹.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "青蟹（别称：肉蟹）",
    "咖喱块（推介乐惠蟹黄咖喱）",
    "洋葱",
    "椰浆",
    "鸡蛋",
    "生粉（别称：淀粉）",
    "大蒜"
  ]
  steps := [
    { index := 1, instruction := "肉蟹掀盖后对半砍开，蟹钳用刀背轻轻拍裂，切口和蟹钳蘸一下生粉，不要太多。撒 5g 生粉到蟹盖中，盖住蟹黄，备用" },
    { index := 2, instruction := "洋葱切成洋葱碎，备用" },
    { index := 3, instruction := "大蒜切碎，备用" },
    { index := 4, instruction := "烧一壶开水，备用" },
    { index := 5, instruction := "起锅烧油，倒入约 20ml 食用油，等待 10 秒让油温升高" },
    { index := 6, instruction := "将螃蟹切口朝下，轻轻放入锅中，煎 20 秒，这一步主要是封住蟹黄，蟹肉。然后翻面，每面煎 10 秒。煎完将螃蟹取出备用" },
    { index := 7, instruction := "将螃蟹盖放入锅中，使用勺子舀起锅中热油泼到蟹盖中，煎封住蟹盖中的蟹黄，煎 20 秒后取出备用" },
    { index := 8, instruction := "不用刷锅，再倒入 10ml 食用油，大火让油温升高至轻微冒烟，将大蒜末，洋葱碎倒入，炒 10 秒钟" },
    { index := 9, instruction := "将咖喱块放入锅中炒化（10 秒），放入煎好的螃蟹，翻炒均匀" },
    { index := 10, instruction := "倒入开水 300ml，焖煮 3 分钟。" },
    { index := 11, instruction := "焖煮完后，倒入椰浆和蛋清，关火，关火后不断翻炒，一直到酱汁变浓稠。" },
    { index := 12, instruction := "出锅" }
  ]
}

theorem recipe_b69537e9b0c4_ingredients_nonempty :
    recipe_b69537e9b0c4.ingredients.isEmpty = false := by decide

theorem recipe_b69537e9b0c4_steps_nonempty :
    recipe_b69537e9b0c4.steps.isEmpty = false := by decide

theorem recipe_b69537e9b0c4_step_count :
    recipe_b69537e9b0c4.steps.length = 12 := by decide

theorem recipe_b69537e9b0c4_steps_ordered :
    orderedFrom 1 recipe_b69537e9b0c4.steps = true := by decide

theorem recipe_b69537e9b0c4_executes_to_terminal :
    executesToTerminal recipe_b69537e9b0c4 = true := by decide

theorem recipe_b69537e9b0c4_kernel_certificate :
    kernelCertified recipe_b69537e9b0c4 = true := by decide

end LeanToCook.SourceCatalog
