/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 韩国麻药鸡蛋 · dishes/breakfast/韩国麻药鸡蛋.md -/
def recipe_fb61ba750320 : Recipe := {
  id := "fb61ba750320"
  title := "韩国麻药鸡蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/韩国麻药鸡蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "韩式酱油（或生抽）",
    "日式味淋",
    "白糖",
    "芝麻油",
    "青葱",
    "辣椒（小米辣或青红椒）"
  ]
  steps := [
    { index := 1, instruction := "烧一锅开水，水沸腾后放入鸡蛋，煮 7 分钟（得到完美的溏心蛋状态）。" },
    { index := 2, instruction := "煮鸡蛋的期间调制酱汁：将 4 汤匙酱油、4 汤匙清水、2 汤匙味淋、2 汤匙白糖倒入小锅中。" },
    { index := 3, instruction := "加热酱汁至沸腾，煮开以挥发掉味淋中的酒精味，随后关火放凉备用。" },
    { index := 4, instruction := "将切好的辣椒圈加入放凉的酱汁中。" },
    { index := 5, instruction := "将煮好的鸡蛋捞出，放入冰水中冷却后剥去蛋壳。" },
    { index := 6, instruction := "将剥好的鸡蛋放入调好的酱汁中，表面淋上 5ml 芝麻油并撒上葱花。" },
    { index := 7, instruction := "放入冰箱冷藏等待 1 - 2 小时，让鸡蛋充分入味。" }
  ]
}

theorem recipe_fb61ba750320_ingredients_nonempty :
    recipe_fb61ba750320.ingredients.isEmpty = false := by decide

theorem recipe_fb61ba750320_steps_nonempty :
    recipe_fb61ba750320.steps.isEmpty = false := by decide

theorem recipe_fb61ba750320_step_count :
    recipe_fb61ba750320.steps.length = 7 := by decide

theorem recipe_fb61ba750320_steps_ordered :
    orderedFrom 1 recipe_fb61ba750320.steps = true := by decide

theorem recipe_fb61ba750320_executes_to_terminal :
    executesToTerminal recipe_fb61ba750320 = true := by decide

theorem recipe_fb61ba750320_kernel_certificate :
    kernelCertified recipe_fb61ba750320 = true := by decide

end LeanToCook.SourceCatalog
