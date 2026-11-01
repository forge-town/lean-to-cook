/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 手抓饼 · dishes/breakfast/手抓饼.md -/
def recipe_6bb8f801a8b8 : Recipe := {
  id := "6bb8f801a8b8"
  title := "手抓饼"
  category := "breakfast"
  sourcePath := "dishes/breakfast/手抓饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "普通面粉",
    "开水",
    "冷水",
    "食用油",
    "盐",
    "鸡蛋",
    "生菜",
    "火腿",
    "芝士片"
  ]
  steps := [
    { index := 1, instruction := "面粉放入碗中，加入开水搅拌成絮状，再加入冷水揉成光滑面团，覆盖湿布静置 20 分钟。" },
    { index := 2, instruction := "面团分成每份约 100 克，搓圆，擀成薄片。" },
    { index := 3, instruction := "表面均匀涂抹食用油，撒上盐，卷成蜗牛状，松弛 10 分钟。" },
    { index := 4, instruction := "面团再次擀成薄饼，厚度均匀。" },
    { index := 5, instruction := "热锅中倒入油，小火煎至两面金黄起泡。" },
    { index := 6, instruction := "煎好的饼依次铺入煎蛋、生菜、火腿、芝士片等配料，卷起即可。" }
  ]
}

theorem recipe_6bb8f801a8b8_ingredients_nonempty :
    recipe_6bb8f801a8b8.ingredients.isEmpty = false := by decide

theorem recipe_6bb8f801a8b8_steps_nonempty :
    recipe_6bb8f801a8b8.steps.isEmpty = false := by decide

theorem recipe_6bb8f801a8b8_step_count :
    recipe_6bb8f801a8b8.steps.length = 6 := by decide

theorem recipe_6bb8f801a8b8_steps_ordered :
    orderedFrom 1 recipe_6bb8f801a8b8.steps = true := by decide

theorem recipe_6bb8f801a8b8_executes_to_terminal :
    executesToTerminal recipe_6bb8f801a8b8 = true := by decide

theorem recipe_6bb8f801a8b8_kernel_certificate :
    kernelCertified recipe_6bb8f801a8b8 = true := by decide

end LeanToCook.SourceCatalog
