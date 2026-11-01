/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 煎饺 · dishes/breakfast/煎饺.md -/
def recipe_49e499d0553b : Recipe := {
  id := "49e499d0553b"
  title := "煎饺"
  category := "breakfast"
  sourcePath := "dishes/breakfast/煎饺.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "饺子（速冻水饺）",
    "芝麻、葱花（切段）或其他配料"
  ]
  steps := [
    { index := 1, instruction := "取出平底锅（不沾平底锅最佳）" },
    { index := 2, instruction := "加入 10ml - 15 ml 食用油" },
    { index := 3, instruction := "开火，放入饺子（尽量平均铺开，不宜堆叠）" },
    { index := 4, instruction := "立刻加入清水，水线没过饺子平均高度的 1/2" },
    { index := 5, instruction := "盖上锅盖（此时炉灶应该处于大火）" },
    { index := 6, instruction := "等待 8 - 10 分钟" },
    { index := 7, instruction := "当锅中水分仅剩 2mm 时， 转中火开始煎制" },
    { index := 8, instruction := "当水分全部蒸发后，摇晃平底锅使饺子受热均匀" },
    { index := 9, instruction := "放入黑芝麻和葱花再焖 10s" },
    { index := 10, instruction := "1 - 2 分钟夹出一个饺子观察底部，若出现金黄色脆皮立即取出" }
  ]
}

theorem recipe_49e499d0553b_ingredients_nonempty :
    recipe_49e499d0553b.ingredients.isEmpty = false := by decide

theorem recipe_49e499d0553b_steps_nonempty :
    recipe_49e499d0553b.steps.isEmpty = false := by decide

theorem recipe_49e499d0553b_step_count :
    recipe_49e499d0553b.steps.length = 10 := by decide

theorem recipe_49e499d0553b_steps_ordered :
    orderedFrom 1 recipe_49e499d0553b.steps = true := by decide

theorem recipe_49e499d0553b_executes_to_terminal :
    executesToTerminal recipe_49e499d0553b = true := by decide

theorem recipe_49e499d0553b_kernel_certificate :
    kernelCertified recipe_49e499d0553b = true := by decide

end LeanToCook.SourceCatalog
