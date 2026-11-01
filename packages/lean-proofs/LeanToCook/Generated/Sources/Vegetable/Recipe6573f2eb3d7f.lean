/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 烤茄子 · dishes/vegetable_dish/烤茄子/烤茄子.md -/
def recipe_6573f2eb3d7f : Recipe := {
  id := "6573f2eb3d7f"
  title := "烤茄子"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/烤茄子/烤茄子.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "茄子",
    "食用油",
    "酱油（生抽）",
    "蒜蓉",
    "辣椒",
    "孜然",
    "食用盐"
  ]
  steps := [
    { index := 1, instruction := "将酱油、孜然、食用盐、蒜蓉和切碎的小米椒置于碗中，均匀搅拌备用" },
    { index := 2, instruction := "茄子洗净，用纸巾擦干表面的水分" },
    { index := 3, instruction := "用叉子在茄子的一侧扎 4-8 下" },
    { index := 4, instruction := "使用 15-25ml 的食用油涂满茄子表面" },
    { index := 5, instruction := "将烤箱温度设置为 200℃ （打开烤箱风扇 大火），预热 2 分钟" },
    { index := 6, instruction := "将茄子放入烤箱中层或者上层，烤制 12-15 分钟 （茄子表面有褶皱，且能按压 0.3-0.5cm 的深度即可）" },
    { index := 7, instruction := "取出茄子，用刀茄子上竖着划一个口子。口子居中，上下距 1-1.5cm" },
    { index := 8, instruction := "用小刀或者叉子伸入口子，竖着切割茄子内部" },
    { index := 9, instruction := "将口子微微掰开，倒入第一步准备的酱料" },
    { index := 10, instruction := "再次将茄子放入烤箱，将烤箱温度设置为 200℃ ，烤制 4-7 分钟" },
    { index := 11, instruction := "取出，关闭烤箱电源" }
  ]
}

theorem recipe_6573f2eb3d7f_ingredients_nonempty :
    recipe_6573f2eb3d7f.ingredients.isEmpty = false := by decide

theorem recipe_6573f2eb3d7f_steps_nonempty :
    recipe_6573f2eb3d7f.steps.isEmpty = false := by decide

theorem recipe_6573f2eb3d7f_step_count :
    recipe_6573f2eb3d7f.steps.length = 11 := by decide

theorem recipe_6573f2eb3d7f_steps_ordered :
    orderedFrom 1 recipe_6573f2eb3d7f.steps = true := by decide

theorem recipe_6573f2eb3d7f_executes_to_terminal :
    executesToTerminal recipe_6573f2eb3d7f = true := by decide

theorem recipe_6573f2eb3d7f_kernel_certificate :
    kernelCertified recipe_6573f2eb3d7f = true := by decide

end LeanToCook.SourceCatalog
