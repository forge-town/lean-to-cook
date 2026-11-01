/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 完美水煮蛋 · dishes/breakfast/完美水煮蛋.md -/
def recipe_2a9c58483b71 : Recipe := {
  id := "2a9c58483b71"
  title := "完美水煮蛋"
  category := "breakfast"
  sourcePath := "dishes/breakfast/完美水煮蛋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "新鲜鸡蛋（推荐 AA 级）",
    "100°C 沸水锅（直径≥ 15cm）",
    "30°C 温水锅（直径≥ 15cm）",
    "定时器",
    "漏勺"
  ]
  steps := [
    { index := 1, instruction := "准备两锅水： A 锅维持 100°C 沸水， B 锅维持 30°C 温水" },
    { index := 2, instruction := "用漏勺将鸡蛋放入 A 锅，启动定时器" },
    { index := 3, instruction := "精准每 2 分钟将鸡蛋转移至另一锅水" },
    { index := 4, instruction := "重复转移操作共 16 次（总时长 32 分钟）" },
    { index := 5, instruction := "最后一次转移后，在 B 锅静置 30 秒" },
    { index := 6, instruction := "立即放入冰水（ 0 摄氏度）终止加热（维持 30 秒）" },
    { index := 7, instruction := "剥壳时从钝端气室处开始，沿纵轴剥离蛋膜" }
  ]
}

theorem recipe_2a9c58483b71_ingredients_nonempty :
    recipe_2a9c58483b71.ingredients.isEmpty = false := by decide

theorem recipe_2a9c58483b71_steps_nonempty :
    recipe_2a9c58483b71.steps.isEmpty = false := by decide

theorem recipe_2a9c58483b71_step_count :
    recipe_2a9c58483b71.steps.length = 7 := by decide

theorem recipe_2a9c58483b71_steps_ordered :
    orderedFrom 1 recipe_2a9c58483b71.steps = true := by decide

theorem recipe_2a9c58483b71_executes_to_terminal :
    executesToTerminal recipe_2a9c58483b71 = true := by decide

theorem recipe_2a9c58483b71_kernel_certificate :
    kernelCertified recipe_2a9c58483b71 = true := by decide

end LeanToCook.SourceCatalog
