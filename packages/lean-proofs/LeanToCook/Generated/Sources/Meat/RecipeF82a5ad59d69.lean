/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 商芝肉 · dishes/meat_dish/商芝肉.md -/
def recipe_f82a5ad59d69 : Recipe := {
  id := "f82a5ad59d69"
  title := "商芝肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/商芝肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "带皮猪五花肉（去骨）",
    "商芝（又名紫萁，属蕨类，嫩叶可食）",
    "葱",
    "姜",
    "八角",
    "蜂蜜",
    "醋",
    "料酒",
    "味精",
    "酱油",
    "摊鸡蛋皮",
    "精盐",
    "鸡汤",
    "芝麻油",
    "熟猪油"
  ]
  steps := [
    { index := 1, instruction := "将肉刮洗干净，入煮锅煮至六成熟（变色为白），捞出趁热用蜂蜜、醋涂抹肉皮。" },
    { index := 2, instruction := "炒锅内放入熟猪油，用旺火烧至八成熟（约 200 度，油表有大量青烟，油状平静），将肉块皮朝下投入，炸至呈金红色时，捞入凉肉煮锅（之前煮完的煮锅）中泡软，放在案板上，切成三寸(10 cm)长、两分(0.6 cm)厚的片，仍然皮朝下，整齐装入蒸碗内。" },
    { index := 3, instruction := "将 5 克大葱切成 2.4 cm 长的段，5 克切成 2.4 cm 长的斜形片。姜去皮洗净，1.5 克切成片，5 克切成末，摊的鸡蛋皮切成 2.4 cm 长的等腰三角形片。" },
    { index := 4, instruction := "商芝入沸水锅中煮软捞出，去除老茎、杂质，淘洗干净，切成 3 cm 长的段，放入碗中,加酱油（5 克）、精盐（1 克）、熟猪油（10 克）拌匀，盖在肉片上，另将鸡汤（100 克）放入一小碗中，加酱油（5 克）、精盐（0.5 克）、料酒（15 克）搅匀，浇入蒸碗，再放入姜片、葱段、八角上笼用旺火蒸约半小时后，转用小火继续蒸约一小时三十分钟，熟烂后取出，拣去姜、葱、八角，倒、过滤原汁，将肉扣入汤盘。" },
    { index := 5, instruction := "炒锅内，放入鸡汤（100 克），加入原汁，用旺火烧沸，下入姜末、葱片、味精后搅匀，投入摊鸡蛋皮，淋芝麻油，浇入汤盘即成。" }
  ]
}

theorem recipe_f82a5ad59d69_ingredients_nonempty :
    recipe_f82a5ad59d69.ingredients.isEmpty = false := by decide

theorem recipe_f82a5ad59d69_steps_nonempty :
    recipe_f82a5ad59d69.steps.isEmpty = false := by decide

theorem recipe_f82a5ad59d69_step_count :
    recipe_f82a5ad59d69.steps.length = 5 := by decide

theorem recipe_f82a5ad59d69_steps_ordered :
    orderedFrom 1 recipe_f82a5ad59d69.steps = true := by decide

theorem recipe_f82a5ad59d69_executes_to_terminal :
    executesToTerminal recipe_f82a5ad59d69 = true := by decide

theorem recipe_f82a5ad59d69_kernel_certificate :
    kernelCertified recipe_f82a5ad59d69 = true := by decide

end LeanToCook.SourceCatalog
