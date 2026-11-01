/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 微波炉蒸蛋 · dishes/breakfast/微波炉蒸蛋.md -/
def recipe_4b816847856f : Recipe := {
  id := "4b816847856f"
  title := "微波炉蒸蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/微波炉蒸蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "温水或高汤",
    "食盐",
    "生抽（可选）",
    "香油",
    "耐热碗",
    "保鲜膜或微波炉专用盖"
  ]
  steps := [
    { index := 1, instruction := "将鸡蛋打散，加入温水/高汤、盐、生抽，轻轻搅匀，尽量不要起泡。" },
    { index := 2, instruction := "将蛋液过筛倒入耐热碗中，表面若有气泡可用牙签轻戳。" },
    { index := 3, instruction := "覆盖保鲜膜并扎 8-10 个小孔，或使用微波炉专用盖（留缝隙）。" },
    { index := 4, instruction := "放入微波炉中加热：" },
    { index := 5, instruction := "加热完成后取出静置 1 分钟，让余温使中心完全熟化。" },
    { index := 6, instruction := "淋上香油，撒葱花即可食用。" }
  ]
}

theorem recipe_4b816847856f_ingredients_nonempty :
    recipe_4b816847856f.ingredients.isEmpty = false := by decide

theorem recipe_4b816847856f_steps_nonempty :
    recipe_4b816847856f.steps.isEmpty = false := by decide

theorem recipe_4b816847856f_step_count :
    recipe_4b816847856f.steps.length = 6 := by decide

theorem recipe_4b816847856f_steps_ordered :
    orderedFrom 1 recipe_4b816847856f.steps = true := by decide

theorem recipe_4b816847856f_executes_to_terminal :
    executesToTerminal recipe_4b816847856f = true := by decide

theorem recipe_4b816847856f_kernel_certificate :
    kernelCertified recipe_4b816847856f = true := by decide

end LeanToCook.SourceCatalog
