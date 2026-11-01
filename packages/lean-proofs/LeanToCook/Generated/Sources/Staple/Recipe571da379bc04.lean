/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 日式咖喱饭 · dishes/staple/日式咖喱饭/日式咖喱饭.md -/
def recipe_571da379bc04 : Recipe := {
  id := "571da379bc04"
  title := "日式咖喱饭"
  category := "staple"
  sourcePath := "dishes/staple/日式咖喱饭/日式咖喱饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "咖喱块（推荐品牌好侍）",
    "土豆",
    "胡萝卜",
    "洋葱",
    "肉（猪肉、鸡肉、牛肉均可）",
    "蒜头",
    "花椰菜（清水煮开）",
    "培根（即食）",
    "煎蛋或太阳蛋"
  ]
  steps := [
    { index := 1, instruction := "胡萝卜去头尾，去皮，滚刀切" },
    { index := 2, instruction := "洋葱剥去外层去芯，切成月牙状" },
    { index := 3, instruction := "土豆去皮、切大块" },
    { index := 4, instruction := "肉切块状" },
    { index := 5, instruction := "剥蒜拍平切碎" },
    { index := 6, instruction := "咖喱块切碎，增加接触面积加速溶解" },
    { index := 7, instruction := "热油锅放入蒜和肉，快速翻炒至肉表面变白" },
    { index := 8, instruction := "加入胡萝卜，快速翻炒至均匀受热" },
    { index := 9, instruction := "加入洋葱，快速翻炒至洋葱变透明状" },
    { index := 10, instruction := "加入土豆，保持翻炒至土豆变软（可以用筷子确认）" },
    { index := 11, instruction := "加水没过所有食材，沸腾后等待 15 分钟" },
    { index := 12, instruction := "关火，加咖喱并搅拌" },
    { index := 13, instruction := "等待咖喱融化后再开火，缓慢搅拌 10 分钟，防止糊锅" },
    { index := 14, instruction := "在外观呈粘稠状态关火结束制作" },
    { index := 15, instruction := "微波炉：单人份高火 2-3 分钟" },
    { index := 16, instruction := "锅：需额外加 50ml 水，加热时保持搅拌" }
  ]
}

theorem recipe_571da379bc04_ingredients_nonempty :
    recipe_571da379bc04.ingredients.isEmpty = false := by decide

theorem recipe_571da379bc04_steps_nonempty :
    recipe_571da379bc04.steps.isEmpty = false := by decide

theorem recipe_571da379bc04_step_count :
    recipe_571da379bc04.steps.length = 16 := by decide

theorem recipe_571da379bc04_steps_ordered :
    orderedFrom 1 recipe_571da379bc04.steps = true := by decide

theorem recipe_571da379bc04_executes_to_terminal :
    executesToTerminal recipe_571da379bc04 = true := by decide

theorem recipe_571da379bc04_kernel_certificate :
    kernelCertified recipe_571da379bc04 = true := by decide

end LeanToCook.SourceCatalog
