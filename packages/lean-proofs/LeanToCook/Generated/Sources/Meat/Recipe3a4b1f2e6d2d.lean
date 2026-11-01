/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 白菜猪肉炖粉条 · dishes/meat_dish/白菜猪肉炖粉条.md -/
def recipe_3a4b1f2e6d2d : Recipe := {
  id := "3a4b1f2e6d2d"
  title := "白菜猪肉炖粉条"
  category := "meat"
  sourcePath := "dishes/meat_dish/白菜猪肉炖粉条.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "五花肉",
    "白菜",
    "土豆干粉条",
    "十三香",
    "鸡精",
    "食用盐",
    "老抽",
    "生抽"
  ]
  steps := [
    { index := 1, instruction := "锅内烧水，水开后放入干粉条，煮 5 分钟后同水一起倒出容器中，盖上盖子继续浸泡泡 备用（第一步先做这个，期间可以进行以下步骤）" },
    { index := 2, instruction := "五花肉切 3mm 的肉片，备用" },
    { index := 3, instruction := "大白菜嫩叶与白菜帮子分开切成 2 份菜片，备用" },
    { index := 4, instruction := "热锅，锅内放入 10ml - 15ml 食用油。等待 10 秒让油温升高" },
    { index := 5, instruction := "放入五花肉，保持翻炒至肉变色" },
    { index := 6, instruction := "加入老抽，炒 1 分钟，给肉上色" },
    { index := 7, instruction := "加入白菜帮子，加入食用盐、生抽，炒一分钟（如果粘锅，烹入 10ml 水）" },
    { index := 8, instruction := "加水没过所有食材，加入鸡精 ，十三香，沸腾后，将火调小然后等待 20 分钟" },
    { index := 9, instruction := "粉条滤水切成小段放入碗中 备用" },
    { index := 10, instruction := "加入白菜嫩叶，炒匀后将粉条放在菜上方，加盖再煮 5 分钟" },
    { index := 11, instruction := "尝味、关火，收汁" }
  ]
}

theorem recipe_3a4b1f2e6d2d_ingredients_nonempty :
    recipe_3a4b1f2e6d2d.ingredients.isEmpty = false := by decide

theorem recipe_3a4b1f2e6d2d_steps_nonempty :
    recipe_3a4b1f2e6d2d.steps.isEmpty = false := by decide

theorem recipe_3a4b1f2e6d2d_step_count :
    recipe_3a4b1f2e6d2d.steps.length = 11 := by decide

theorem recipe_3a4b1f2e6d2d_steps_ordered :
    orderedFrom 1 recipe_3a4b1f2e6d2d.steps = true := by decide

theorem recipe_3a4b1f2e6d2d_executes_to_terminal :
    executesToTerminal recipe_3a4b1f2e6d2d = true := by decide

theorem recipe_3a4b1f2e6d2d_kernel_certificate :
    kernelCertified recipe_3a4b1f2e6d2d = true := by decide

end LeanToCook.SourceCatalog
