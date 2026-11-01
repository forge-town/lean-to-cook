/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒸水蛋 · dishes/breakfast/蒸水蛋.md -/
def recipe_b13f782654bf : Recipe := {
  id := "b13f782654bf"
  title := "蒸水蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/蒸水蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "新鲜鸡蛋",
    "热水",
    "锡纸或保鲜膜"
  ]
  steps := [
    { index := 1, instruction := "鸡蛋打入碗中，打散" },
    { index := 2, instruction := "取其他容器，倒入 1.5 倍（半个蛋壳为 0.5 倍水）于蛋液的温水（温度 2030），将盐倒入水中化开" },
    { index := 3, instruction := "将盐水倒入鸡蛋液中，顺时针或逆时针单方向搅拌均匀，气泡之类的可以用舀出丢弃，过筛则口感更加。" },
    { index := 4, instruction := "使用锡纸包裹盛蛋液的碗（或用盘子盖住），置入提前带盖并加入大约 3cm 深度水的锅中" },
    { index := 5, instruction := "中火烧至水开，转最小的火继续蒸 4 分钟" }
  ]
}

theorem recipe_b13f782654bf_ingredients_nonempty :
    recipe_b13f782654bf.ingredients.isEmpty = false := by decide

theorem recipe_b13f782654bf_steps_nonempty :
    recipe_b13f782654bf.steps.isEmpty = false := by decide

theorem recipe_b13f782654bf_step_count :
    recipe_b13f782654bf.steps.length = 5 := by decide

theorem recipe_b13f782654bf_steps_ordered :
    orderedFrom 1 recipe_b13f782654bf.steps = true := by decide

theorem recipe_b13f782654bf_executes_to_terminal :
    executesToTerminal recipe_b13f782654bf = true := by decide

theorem recipe_b13f782654bf_kernel_certificate :
    kernelCertified recipe_b13f782654bf = true := by decide

end LeanToCook.SourceCatalog
