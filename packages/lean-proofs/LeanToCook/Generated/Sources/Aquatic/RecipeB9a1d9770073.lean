/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 响油鳝丝 · dishes/aquatic/响油鳝丝.md -/
def recipe_b9a1d9770073 : Recipe := {
  id := "b9a1d9770073"
  title := "响油鳝丝"
  category := "aquatic"
  sourcePath := "dishes/aquatic/响油鳝丝.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鳝丝",
    "大蒜",
    "姜末",
    "料酒",
    "生抽",
    "蚝油",
    "老抽",
    "食用盐",
    "白糖",
    "胡椒粉",
    "淀粉",
    "蒜末",
    "葱花",
    "猪油"
  ]
  steps := [
    { index := 1, instruction := "将鳝鱼切成三段后切成细丝" },
    { index := 2, instruction := "加入 0.5 g 胡椒粉、3 g 料酒搅拌均匀，再加入 5 g 香油腌制" },
    { index := 3, instruction := "热油滑锅" },
    { index := 4, instruction := "加入植物油，烧到 6 成热" },
    { index := 5, instruction := "加入一半蒜末和全部姜末，翻炒几下" },
    { index := 6, instruction := "加入鳝丝，中火爆炒 30 秒" },
    { index := 7, instruction := "边缘淋入 10 g 料酒，翻炒几下" },
    { index := 8, instruction := "加入生抽，炒匀" },
    { index := 9, instruction := "加入蚝油、老抽，翻炒几下" },
    { index := 10, instruction := "加入食用盐、白糖、3 g 胡椒粉，炒匀" },
    { index := 11, instruction := "淀粉和水混合为水淀粉，倒入锅中，收汁至浓稠" },
    { index := 12, instruction := "装盘，撒上蒜蓉、葱花" },
    { index := 13, instruction := "另起锅烧热，加入猪油，烧至七成热，浇在鳝丝上" }
  ]
}

theorem recipe_b9a1d9770073_ingredients_nonempty :
    recipe_b9a1d9770073.ingredients.isEmpty = false := by decide

theorem recipe_b9a1d9770073_steps_nonempty :
    recipe_b9a1d9770073.steps.isEmpty = false := by decide

theorem recipe_b9a1d9770073_step_count :
    recipe_b9a1d9770073.steps.length = 13 := by decide

theorem recipe_b9a1d9770073_steps_ordered :
    orderedFrom 1 recipe_b9a1d9770073.steps = true := by decide

theorem recipe_b9a1d9770073_executes_to_terminal :
    executesToTerminal recipe_b9a1d9770073 = true := by decide

theorem recipe_b9a1d9770073_kernel_certificate :
    kernelCertified recipe_b9a1d9770073 = true := by decide

end LeanToCook.SourceCatalog
