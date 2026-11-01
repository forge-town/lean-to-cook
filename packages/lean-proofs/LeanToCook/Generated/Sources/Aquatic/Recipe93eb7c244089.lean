/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 芥末黄油罗氏虾 · dishes/aquatic/芥末黄油罗氏虾/芥末黄油罗氏虾.md -/
def recipe_93eb7c244089 : Recipe := {
  id := "93eb7c244089"
  title := "芥末黄油罗氏虾"
  category := "aquatic"
  sourcePath := "dishes/aquatic/芥末黄油罗氏虾/芥末黄油罗氏虾.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "罗氏虾",
    "黄油",
    "芥末",
    "白糖",
    "生抽",
    "蚝油",
    "盐",
    "料酒、朗姆酒或啤酒",
    "香菜",
    "蒜"
  ]
  steps := [
    { index := 1, instruction := "将罗氏虾剪掉头尾尖刺、触须和脚，剪刀把虾身开背，去除虾线。" },
    { index := 2, instruction := "提前搅拌好芥末酱汁：酱油、蚝油、芥末、盐、糖，搅拌均匀！" },
    { index := 3, instruction := "洗好香菜，切段备用。" },
    { index := 4, instruction := "罗氏虾沥干水，锅中加入油，直接放入罗氏虾，中火，外表煎至金黄，捞出。" },
    { index := 5, instruction := "下入蒜蓉，大火，利用煎虾剩下的油继续煎炒蒜蓉，等到锅中白雾冒出，蒜蓉已经煎出香味，下虾和黄油，让虾充分吸收黄油香味" },
    { index := 6, instruction := "下入调好的酱汁，继续大火煮沸，翻炒虾，至酱汁收汁，加入酒（料酒、啤酒可以放 30g，朗姆酒味道浓郁放 15g 即可。）" },
    { index := 7, instruction := "在等酱汁稍微收汁，加入香菜翻炒两下，即可出锅。" }
  ]
}

theorem recipe_93eb7c244089_ingredients_nonempty :
    recipe_93eb7c244089.ingredients.isEmpty = false := by decide

theorem recipe_93eb7c244089_steps_nonempty :
    recipe_93eb7c244089.steps.isEmpty = false := by decide

theorem recipe_93eb7c244089_step_count :
    recipe_93eb7c244089.steps.length = 7 := by decide

theorem recipe_93eb7c244089_steps_ordered :
    orderedFrom 1 recipe_93eb7c244089.steps = true := by decide

theorem recipe_93eb7c244089_executes_to_terminal :
    executesToTerminal recipe_93eb7c244089 = true := by decide

theorem recipe_93eb7c244089_kernel_certificate :
    kernelCertified recipe_93eb7c244089 = true := by decide

end LeanToCook.SourceCatalog
