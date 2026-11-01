/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 血浆鸭 · dishes/meat_dish/血浆鸭/血浆鸭.md -/
def recipe_a7f8fdd45ba3 : Recipe := {
  id := "a7f8fdd45ba3"
  title := "血浆鸭"
  category := "meat"
  sourcePath := "dishes/meat_dish/血浆鸭/血浆鸭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鲜仔鸭肉",
    "鲜鸭血（宰杀鸭子时加醋接鸭血，用筷子顺时针搅拌防凝固）",
    "姜",
    "蒜仔",
    "葱",
    "辣椒",
    "酒（或者白酒、啤酒、米酒皆可）",
    "生抽",
    "料酒",
    "盐",
    "鸡精"
  ]
  steps := [
    { index := 1, instruction := "鲜仔鸭肉切成约 3cm 小块，加料酒、姜片，去除血水。" },
    { index := 2, instruction := "炒锅烧热，放入约 100ml 食用油，大火待油烧开，放入腌制好的鲜鸭肉，不断翻炒。" },
    { index := 3, instruction := "待鸭肉完全变色（肉眼可见泛白），放入酒，再加入 200ml 开水，刚好淹没鸭肉即可，盖上锅盖中火煮 15 分钟。" },
    { index := 4, instruction := "水开之后，打开锅盖放入姜蒜，翻炒一遍，盖上锅盖持续加热 10 分钟。" },
    { index := 5, instruction := "打开锅盖放入辣椒，不断翻炒，待至肉眼可见辣椒炒软，放入鲜鸭血，此时需要不断翻炒，确保每块鸭肉和每片辣椒都有鸭血的浸润（此乃血浆鸭的精髓）。" },
    { index := 6, instruction := "翻炒至肉眼可见鸭血均为黑色，加入盐，鸡精，香葱，（喜欢食用山胡椒油的朋友也可以在此时放入 3-6 滴山胡椒油）再次翻炒一到二次即可。" },
    { index := 7, instruction := "出锅盛盘，上桌食用。" }
  ]
}

theorem recipe_a7f8fdd45ba3_ingredients_nonempty :
    recipe_a7f8fdd45ba3.ingredients.isEmpty = false := by decide

theorem recipe_a7f8fdd45ba3_steps_nonempty :
    recipe_a7f8fdd45ba3.steps.isEmpty = false := by decide

theorem recipe_a7f8fdd45ba3_step_count :
    recipe_a7f8fdd45ba3.steps.length = 7 := by decide

theorem recipe_a7f8fdd45ba3_steps_ordered :
    orderedFrom 1 recipe_a7f8fdd45ba3.steps = true := by decide

theorem recipe_a7f8fdd45ba3_executes_to_terminal :
    executesToTerminal recipe_a7f8fdd45ba3 = true := by decide

theorem recipe_a7f8fdd45ba3_kernel_certificate :
    kernelCertified recipe_a7f8fdd45ba3 = true := by decide

end LeanToCook.SourceCatalog
