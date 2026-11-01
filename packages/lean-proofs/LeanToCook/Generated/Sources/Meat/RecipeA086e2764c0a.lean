/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 老妈蹄花 · dishes/meat_dish/老妈蹄花/老妈蹄花.md -/
def recipe_a086e2764c0a : Recipe := {
  id := "a086e2764c0a"
  title := "老妈蹄花"
  category := "meat"
  sourcePath := "dishes/meat_dish/老妈蹄花/老妈蹄花.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪蹄（尽量选择猪前蹄：肉多筋多骨头少）",
    "葱",
    "姜",
    "料酒",
    "生抽",
    "白芷",
    "当归（可选）",
    "鸡精",
    "盐",
    "蒜",
    "小米椒",
    "白胡椒粉",
    "生抽",
    "香醋",
    "花椒油",
    "油泼辣子（可选）",
    "白芸豆（没有可用海带）"
  ]
  steps := [
    { index := 1, instruction := "200g 白芸豆提前一晚清水浸泡备用" },
    { index := 2, instruction := "准备猪前蹄，买菜的时候让师傅从中间劈开，用喷火枪去除毛囊，拿回家清洗" },
    { index := 3, instruction := "冷水锅中加入猪蹄、大葱段、姜片、料酒，焯水十分钟，撇去浮沫，捞出洗干净备用" },
    { index := 4, instruction := "高压锅中放入猪蹄、当归、白芷、白胡椒粉、姜片，上汽后压三十分钟，放入白芸豆，再压十分钟，这个时候如果汤底是奶白色，那么恭喜是正确的（如果中途需要加水，只能加热水）" },
    { index := 5, instruction := "揭盖后加入盐、鸡精、葱花调味" },
    { index := 6, instruction := "调制灵魂汁子：放入葱、蒜、小米椒，白胡椒粉、生抽、香醋、油泼辣子、花椒油、猪蹄原汤" },
    { index := 7, instruction := "灵魂汁子，浇给" }
  ]
}

theorem recipe_a086e2764c0a_ingredients_nonempty :
    recipe_a086e2764c0a.ingredients.isEmpty = false := by decide

theorem recipe_a086e2764c0a_steps_nonempty :
    recipe_a086e2764c0a.steps.isEmpty = false := by decide

theorem recipe_a086e2764c0a_step_count :
    recipe_a086e2764c0a.steps.length = 7 := by decide

theorem recipe_a086e2764c0a_steps_ordered :
    orderedFrom 1 recipe_a086e2764c0a.steps = true := by decide

theorem recipe_a086e2764c0a_executes_to_terminal :
    executesToTerminal recipe_a086e2764c0a = true := by decide

theorem recipe_a086e2764c0a_kernel_certificate :
    kernelCertified recipe_a086e2764c0a = true := by decide

end LeanToCook.SourceCatalog
