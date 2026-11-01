/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 家常日本豆腐 · dishes/vegetable_dish/家常日本豆腐.md -/
def recipe_5097e0e1af4e : Recipe := {
  id := "5097e0e1af4e"
  title := "家常日本豆腐"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/家常日本豆腐.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "日本豆腐（玉子豆腐）",
    "青椒",
    "胡萝卜",
    "火腿肠（可选）",
    "黑木耳（可选）",
    "洋葱（可选）",
    "生粉",
    "蒜",
    "油（煎豆腐用，能没过一大半就行）",
    "生抽 8 ml",
    "蚝油 15 ml",
    "盐（咸鲜口）",
    "鸡精（咸鲜口，可选）",
    "番茄酱（酸甜口）",
    "白砂糖（酸甜口）"
  ]
  steps := [
    { index := 1, instruction := "胡萝卜切片，尖椒切薄块，葱蒜碎切好" },
    { index := 2, instruction := "把买好的日本豆腐打开袋子切好，切成大概 1 cm 厚的圆柱体" },
    { index := 3, instruction := "生粉放到平盘中，准备给豆腐裹面" },
    { index := 4, instruction := "轻轻把豆腐放到面粉上，上下两面和周边都裹上面粉，注意不要包裹的太厚" },
    { index := 5, instruction := "在平底锅里放 150 ml 油，油能没过豆腐一大半即可，看边缘颜色变成金黄，翻面煎就可以了" },
    { index := 6, instruction := "两边都煎好的时候捞出来放在干净的盘里备用" },
    { index := 7, instruction := "在炒锅中倒入 10-15 ml 油，放入葱蒜，爆香后放入青椒、胡萝卜、火腿肠、黑木耳" },
    { index := 8, instruction := "加入蚝油、生抽、盐、鸡精、白砂糖、番茄酱" },
    { index := 9, instruction := "轻轻翻炒至颜色均匀" }
  ]
}

theorem recipe_5097e0e1af4e_ingredients_nonempty :
    recipe_5097e0e1af4e.ingredients.isEmpty = false := by decide

theorem recipe_5097e0e1af4e_steps_nonempty :
    recipe_5097e0e1af4e.steps.isEmpty = false := by decide

theorem recipe_5097e0e1af4e_step_count :
    recipe_5097e0e1af4e.steps.length = 9 := by decide

theorem recipe_5097e0e1af4e_steps_ordered :
    orderedFrom 1 recipe_5097e0e1af4e.steps = true := by decide

theorem recipe_5097e0e1af4e_executes_to_terminal :
    executesToTerminal recipe_5097e0e1af4e = true := by decide

theorem recipe_5097e0e1af4e_kernel_certificate :
    kernelCertified recipe_5097e0e1af4e = true := by decide

end LeanToCook.SourceCatalog
