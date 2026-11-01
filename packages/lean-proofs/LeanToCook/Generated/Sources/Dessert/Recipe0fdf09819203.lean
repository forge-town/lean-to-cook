/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 玛格丽特饼干 · dishes/dessert/玛格丽特饼干/玛格丽特饼干.md -/
def recipe_0fdf09819203 : Recipe := {
  id := "0fdf09819203"
  title := "玛格丽特饼干"
  category := "dessert"
  sourcePath := "dishes/dessert/玛格丽特饼干/玛格丽特饼干.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "熟蛋黄",
    "黄油",
    "白砂糖",
    "盐",
    "低筋面粉",
    "玉米淀粉",
    "烤箱"
  ]
  steps := [
    { index := 1, instruction := "黄油隔热水融化、将蛋黄磨碎备用。" },
    { index := 2, instruction := "在融化的黄油中添加糖、盐、以及碾碎的鸡蛋黄，搅拌均匀" },
    { index := 3, instruction := "加入低筋面粉与玉米淀粉，揉成面团" },
    { index := 4, instruction := "将面团均匀分割成大约 8 克重的小面团，然后将它们搓成球状。" },
    { index := 5, instruction := "使用大拇指轻压在每个小面团上，以形成裂纹。" },
    { index := 6, instruction := "预热烤箱至 150℃，将小面团放入烤箱中，烘烤 20 分钟。" },
    { index := 7, instruction := "微微放凉即可食用" }
  ]
}

theorem recipe_0fdf09819203_ingredients_nonempty :
    recipe_0fdf09819203.ingredients.isEmpty = false := by decide

theorem recipe_0fdf09819203_steps_nonempty :
    recipe_0fdf09819203.steps.isEmpty = false := by decide

theorem recipe_0fdf09819203_step_count :
    recipe_0fdf09819203.steps.length = 7 := by decide

theorem recipe_0fdf09819203_steps_ordered :
    orderedFrom 1 recipe_0fdf09819203.steps = true := by decide

theorem recipe_0fdf09819203_executes_to_terminal :
    executesToTerminal recipe_0fdf09819203 = true := by decide

theorem recipe_0fdf09819203_kernel_certificate :
    kernelCertified recipe_0fdf09819203 = true := by decide

end LeanToCook.SourceCatalog
