/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 巴基斯坦牛肉咖喱 · dishes/meat_dish/巴基斯坦牛肉咖喱/巴基斯坦牛肉咖喱.md -/
def recipe_c8feda2006c4 : Recipe := {
  id := "c8feda2006c4"
  title := "巴基斯坦牛肉咖喱"
  category := "meat"
  sourcePath := "dishes/meat_dish/巴基斯坦牛肉咖喱/巴基斯坦牛肉咖喱.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "普通的炒锅",
    "电饭煲/电炖锅",
    "Masala 粉（品牌可选 Shan）",
    "牛肉",
    "番茄",
    "螺丝椒",
    "原味酸奶",
    "蒜粉",
    "姜粉"
  ]
  steps := [
    { index := 1, instruction := "全部螺丝椒切成段状，备用" },
    { index := 2, instruction := "全部番茄打成番茄蓉，备用" },
    { index := 3, instruction := "牛肉切成 2cm 的小块，洗净备用" },
    { index := 4, instruction := "炒锅中倒入一层油（用来防止番茄蓉沸腾蒸发）" },
    { index := 5, instruction := "倒入番茄蓉，持续搅拌 2-3 分钟，等待它越变越红" },
    { index := 6, instruction := "加入 5g 蒜粉，5g 姜粉和 1 包 50g 的 Masala 粉，搅拌均匀" },
    { index := 7, instruction := "加入牛肉和螺丝椒段，搅拌均匀" },
    { index := 8, instruction := "加入 1 盒酸奶（为了让整个酱汁变得粘稠），搅拌均匀" },
    { index := 9, instruction := "将整锅材料转移到电饭煲/电炖锅，并加入 250 ml 的水，开启炖肉/慢炖档，设定时间 2-3 个小时" },
    { index := 10, instruction := "等待完成，开锅检查牛肉软糯，就可以吃了" }
  ]
}

theorem recipe_c8feda2006c4_ingredients_nonempty :
    recipe_c8feda2006c4.ingredients.isEmpty = false := by decide

theorem recipe_c8feda2006c4_steps_nonempty :
    recipe_c8feda2006c4.steps.isEmpty = false := by decide

theorem recipe_c8feda2006c4_step_count :
    recipe_c8feda2006c4.steps.length = 10 := by decide

theorem recipe_c8feda2006c4_steps_ordered :
    orderedFrom 1 recipe_c8feda2006c4.steps = true := by decide

theorem recipe_c8feda2006c4_executes_to_terminal :
    executesToTerminal recipe_c8feda2006c4 = true := by decide

theorem recipe_c8feda2006c4_kernel_certificate :
    kernelCertified recipe_c8feda2006c4 = true := by decide

end LeanToCook.SourceCatalog
