/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 山药南瓜炖鸡汤 · dishes/soup/山药南瓜炖鸡汤.md -/
def recipe_4c944fb35c21 : Recipe := {
  id := "4c944fb35c21"
  title := "山药南瓜炖鸡汤"
  category := "soup"
  sourcePath := "dishes/soup/山药南瓜炖鸡汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡肉",
    "姜",
    "料酒（焯水用）",
    "板栗",
    "山药",
    "小南瓜",
    "红枣",
    "盐（出锅调味）"
  ]
  steps := [
    { index := 1, instruction := "鸡肉切块，加姜、料酒，冷水下锅焯水，水开后煮 3 分钟捞出备用" },
    { index := 2, instruction := "山药去皮切滚刀块，板栗去壳备用" },
    { index := 3, instruction := "小南瓜洗净，上锅蒸熟后挖出果肉，压成南瓜泥备用" },
    { index := 4, instruction := "将焯好的鸡肉、山药、板栗、姜片放入锅中，加水没过食材，大火烧开后转小火炖 30 分钟" },
    { index := 5, instruction := "加入南瓜泥搅开，放入红枣，再煮 10 分钟" },
    { index := 6, instruction := "加盐调味，盛出即可" }
  ]
}

theorem recipe_4c944fb35c21_ingredients_nonempty :
    recipe_4c944fb35c21.ingredients.isEmpty = false := by decide

theorem recipe_4c944fb35c21_steps_nonempty :
    recipe_4c944fb35c21.steps.isEmpty = false := by decide

theorem recipe_4c944fb35c21_step_count :
    recipe_4c944fb35c21.steps.length = 6 := by decide

theorem recipe_4c944fb35c21_steps_ordered :
    orderedFrom 1 recipe_4c944fb35c21.steps = true := by decide

theorem recipe_4c944fb35c21_executes_to_terminal :
    executesToTerminal recipe_4c944fb35c21 = true := by decide

theorem recipe_4c944fb35c21_kernel_certificate :
    kernelCertified recipe_4c944fb35c21 = true := by decide

end LeanToCook.SourceCatalog
