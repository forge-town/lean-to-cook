/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 瘦肉土豆片 · dishes/meat_dish/瘦肉土豆片/瘦肉土豆片.md -/
def recipe_6e1381b6647e : Recipe := {
  id := "6e1381b6647e"
  title := "瘦肉土豆片"
  category := "meat"
  sourcePath := "dishes/meat_dish/瘦肉土豆片/瘦肉土豆片.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "纯瘦肉",
    "土豆",
    "蒜苗",
    "生粉（玉米淀粉或其他淀粉）",
    "生抽",
    "老抽",
    "食用盐"
  ]
  steps := [
    { index := 1, instruction := "土豆去皮、对半切开，再切成约 2mm 的薄片，备用" },
    { index := 2, instruction := "蒜苗洗净，切成约 1cm 的段，备用" },
    { index := 3, instruction := "瘦肉洗净切成约 2mm 的薄片，放入碗中，加入 5g 生粉、5g 生抽、3g 老抽腌制十分钟，备用" },
    { index := 4, instruction := "瘦肉腌制时，烧一锅开水，将土豆片放入锅中，焯水，约 5 分钟" },
    { index := 5, instruction := "热锅，锅内放入 10ml - 15ml 食用油。等待 10 秒让油温升高" },
    { index := 6, instruction := "放入瘦肉，翻炒至变色，倒入蒜苗一起炒，蒜苗炒约 20 秒" },
    { index := 7, instruction := "放入土豆，保持翻炒，加入 2g 食用盐、5g 生抽，" },
    { index := 8, instruction := "炒约 3 分钟，盛盘" }
  ]
}

theorem recipe_6e1381b6647e_ingredients_nonempty :
    recipe_6e1381b6647e.ingredients.isEmpty = false := by decide

theorem recipe_6e1381b6647e_steps_nonempty :
    recipe_6e1381b6647e.steps.isEmpty = false := by decide

theorem recipe_6e1381b6647e_step_count :
    recipe_6e1381b6647e.steps.length = 8 := by decide

theorem recipe_6e1381b6647e_steps_ordered :
    orderedFrom 1 recipe_6e1381b6647e.steps = true := by decide

theorem recipe_6e1381b6647e_executes_to_terminal :
    executesToTerminal recipe_6e1381b6647e = true := by decide

theorem recipe_6e1381b6647e_kernel_certificate :
    kernelCertified recipe_6e1381b6647e = true := by decide

end LeanToCook.SourceCatalog
