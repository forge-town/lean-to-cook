/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鲤鱼炖白菜 · dishes/aquatic/鲤鱼炖白菜/鲤鱼炖白菜.md -/
def recipe_f8c41af7879a : Recipe := {
  id := "f8c41af7879a"
  title := "鲤鱼炖白菜"
  category := "aquatic"
  sourcePath := "dishes/aquatic/鲤鱼炖白菜/鲤鱼炖白菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "食用油",
    "姜",
    "蒜",
    "鲤鱼",
    "白菜心/娃娃菜",
    "盐",
    "老抽",
    "生抽",
    "桂皮",
    "八角",
    "郫县豆瓣酱",
    "干辣椒（不吃辣可以不放）"
  ]
  steps := [
    { index := 1, instruction := "鲤鱼清洗干净，改刀（在鱼身上多划几个伤口，方便入味）" },
    { index := 2, instruction := "娃娃菜清洗干净放入盘中备用" },
    { index := 3, instruction := "锅中加油，等油热放入“少盐” “姜” “蒜” “郫县豆瓣酱” “桂皮” “八角” 炒出香味" },
    { index := 4, instruction := "把鱼放锅里煎（3 分钟）每（30 秒）需要翻面" },
    { index := 5, instruction := "加入“水”（水量尽量和鱼平齐，可以少一点点） 放入 “生抽” “老抽” “娃娃菜”" },
    { index := 6, instruction := "大火炖 15-20 分钟，汤汁快干时添加 “盐” 即可出锅" }
  ]
}

theorem recipe_f8c41af7879a_ingredients_nonempty :
    recipe_f8c41af7879a.ingredients.isEmpty = false := by decide

theorem recipe_f8c41af7879a_steps_nonempty :
    recipe_f8c41af7879a.steps.isEmpty = false := by decide

theorem recipe_f8c41af7879a_step_count :
    recipe_f8c41af7879a.steps.length = 6 := by decide

theorem recipe_f8c41af7879a_steps_ordered :
    orderedFrom 1 recipe_f8c41af7879a.steps = true := by decide

theorem recipe_f8c41af7879a_executes_to_terminal :
    executesToTerminal recipe_f8c41af7879a = true := by decide

theorem recipe_f8c41af7879a_kernel_certificate :
    kernelCertified recipe_f8c41af7879a = true := by decide

end LeanToCook.SourceCatalog
