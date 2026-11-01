/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 红烧冬瓜 · dishes/vegetable_dish/红烧冬瓜/红烧冬瓜.md -/
def recipe_afde2c6a3418 : Recipe := {
  id := "afde2c6a3418"
  title := "红烧冬瓜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/红烧冬瓜/红烧冬瓜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "冬瓜",
    "食用油",
    "料酒",
    "淀粉",
    "生抽",
    "老抽",
    "鸡精",
    "香葱",
    "姜末",
    "蚝油"
  ]
  steps := [
    { index := 1, instruction := "冬瓜去皮，切 边长不超过 2cm 小块" },
    { index := 2, instruction := "起锅烧油，放入冬瓜，缓缓翻滚煎炸 2 分钟 ，直至冬瓜表面泛金黄色" },
    { index := 3, instruction := "取出冬瓜，放入大碗备用" },
    { index := 4, instruction := "利用锅中的剩余油，依次放入姜末、生抽、蚝油，翻炒 15 S" },
    { index := 5, instruction := "重新倒入冬瓜，翻炒 30 S 后，加入开水，水要没过冬瓜表面，大火煮 10 分钟" },
    { index := 6, instruction := "加入老抽上色，继续煮，直至冬瓜软糯（筷子可以轻松插近冬瓜）" },
    { index := 7, instruction := "加入鸡精、料酒、香葱翻炒后 30 S， 取出冬瓜到大碗中" },
    { index := 8, instruction := "锅中剩余汤汁保留，倒入水淀粉，煮开后汤汁浇灌在冬瓜表面" }
  ]
}

theorem recipe_afde2c6a3418_ingredients_nonempty :
    recipe_afde2c6a3418.ingredients.isEmpty = false := by decide

theorem recipe_afde2c6a3418_steps_nonempty :
    recipe_afde2c6a3418.steps.isEmpty = false := by decide

theorem recipe_afde2c6a3418_step_count :
    recipe_afde2c6a3418.steps.length = 8 := by decide

theorem recipe_afde2c6a3418_steps_ordered :
    orderedFrom 1 recipe_afde2c6a3418.steps = true := by decide

theorem recipe_afde2c6a3418_executes_to_terminal :
    executesToTerminal recipe_afde2c6a3418 = true := by decide

theorem recipe_afde2c6a3418_kernel_certificate :
    kernelCertified recipe_afde2c6a3418 = true := by decide

end LeanToCook.SourceCatalog
