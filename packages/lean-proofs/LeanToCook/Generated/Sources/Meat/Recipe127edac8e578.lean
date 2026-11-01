/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 孜然牛肉 · dishes/meat_dish/孜然牛肉.md -/
def recipe_127edac8e578 : Recipe := {
  id := "127edac8e578"
  title := "孜然牛肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/孜然牛肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛柳或牛肩肉",
    "青椒",
    "孜然（颗粒>粉）",
    "小米椒",
    "生抽酱油",
    "淀粉",
    "油",
    "盐",
    "葱",
    "捣药罐（可选）"
  ]
  steps := [
    { index := 1, instruction := "首先将小米椒切碎，和孜然粒一起放入捣药罐捣碎成颗粒，这样更入味。如果时间紧张可跳过捣碎步骤" },
    { index := 2, instruction := "青椒切头去籽（喜欢辣的可不去），切成丝。葱切段。" },
    { index := 3, instruction := "牛肉提前解冻，过一边水洗干净，晾干或用厨用纸吸干，将牛肉顺着纹理切成片" },
    { index := 4, instruction := "然后进行腌肉，加入生抽，淀粉，油，均匀搅拌，静止 30 分钟。腌肉方法也可参考学习腌" },
    { index := 5, instruction := "热锅下油，放入葱，爆出香味后放入腌好的牛肉煸炒" },
    { index := 6, instruction := "牛肉变色后均匀放入孜然辣椒颗粒并炒熟" },
    { index := 7, instruction := "然后下入青椒丝，断生后放盐" },
    { index := 8, instruction := "大🔥炒 1 分钟后关火再翻炒 30 秒保证受热均匀即可出锅" }
  ]
}

theorem recipe_127edac8e578_ingredients_nonempty :
    recipe_127edac8e578.ingredients.isEmpty = false := by decide

theorem recipe_127edac8e578_steps_nonempty :
    recipe_127edac8e578.steps.isEmpty = false := by decide

theorem recipe_127edac8e578_step_count :
    recipe_127edac8e578.steps.length = 8 := by decide

theorem recipe_127edac8e578_steps_ordered :
    orderedFrom 1 recipe_127edac8e578.steps = true := by decide

theorem recipe_127edac8e578_executes_to_terminal :
    executesToTerminal recipe_127edac8e578 = true := by decide

theorem recipe_127edac8e578_kernel_certificate :
    kernelCertified recipe_127edac8e578 = true := by decide

end LeanToCook.SourceCatalog
