/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 水煮牛肉 · dishes/meat_dish/水煮牛肉/水煮牛肉.md -/
def recipe_0d138afee099 : Recipe := {
  id := "0d138afee099"
  title := "水煮牛肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/水煮牛肉/水煮牛肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛肉",
    "豆芽",
    "鸡蛋",
    "香菜",
    "豆瓣酱",
    "料酒",
    "淀粉",
    "干辣椒粉",
    "姜",
    "蒜",
    "红辣椒",
    "蚝油"
  ]
  steps := [
    { index := 1, instruction := "牛肉洗干净切片。" },
    { index := 2, instruction := "加入 15g 姜丝，1 个鸡蛋，15g 淀粉，8g 蚝油，10ml 料酒搅拌均匀，腌制 15 分钟。" },
    { index := 3, instruction := "香菜洗干净切好。" },
    { index := 4, instruction := "锅里倒油，加入豆瓣酱，5g 姜丝，蒜片。" },
    { index := 5, instruction := "倒入开水，煮成红汤。" },
    { index := 6, instruction := "豆芽洗干净去掉尾须，放进开水里焯熟。" },
    { index := 7, instruction := "将豆芽铺入碗底。" },
    { index := 8, instruction := "将牛肉片一片一片的放进红汤中，煮熟以后捞出。" },
    { index := 9, instruction := "将牛肉铺在豆芽上，撒上香菜梗。" },
    { index := 10, instruction := "撒上香菜叶，辣椒粉，辣椒圈。" },
    { index := 11, instruction := "另起锅烧热油，将热油淋在菜上面，就完成了。" }
  ]
}

theorem recipe_0d138afee099_ingredients_nonempty :
    recipe_0d138afee099.ingredients.isEmpty = false := by decide

theorem recipe_0d138afee099_steps_nonempty :
    recipe_0d138afee099.steps.isEmpty = false := by decide

theorem recipe_0d138afee099_step_count :
    recipe_0d138afee099.steps.length = 11 := by decide

theorem recipe_0d138afee099_steps_ordered :
    orderedFrom 1 recipe_0d138afee099.steps = true := by decide

theorem recipe_0d138afee099_executes_to_terminal :
    executesToTerminal recipe_0d138afee099 = true := by decide

theorem recipe_0d138afee099_kernel_certificate :
    kernelCertified recipe_0d138afee099 = true := by decide

end LeanToCook.SourceCatalog
