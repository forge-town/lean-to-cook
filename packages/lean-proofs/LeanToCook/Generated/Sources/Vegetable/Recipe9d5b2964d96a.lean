/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 凉拌木耳 · dishes/vegetable_dish/凉拌木耳/凉拌木耳.md -/
def recipe_9d5b2964d96a : Recipe := {
  id := "9d5b2964d96a"
  title := "凉拌木耳"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/凉拌木耳/凉拌木耳.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "干木耳 （湿木耳也可，但不能太久之前泡发的，必须是新鲜的湿木耳）",
    "蒜瓣",
    "白糖",
    "小米辣",
    "盐",
    "香油",
    "生抽",
    "醋",
    "芥末 （可以不用）"
  ]
  steps := [
    { index := 1, instruction := "泡发干木耳, 水量约为 400ml, 泡发约 45 分钟。 （湿木耳跳过此步骤）" },
    { index := 2, instruction := "将泡发好的木耳, 进行去根处理（如图 4, 5, 6）, 并彻底洗净。" },
    { index := 3, instruction := "起锅烧水，水开后放入木耳, 大火煮 1.5-2 分钟。" },
    { index := 4, instruction := "将蒜瓣、小米辣切碎放入碗中 （可选取中大碗）, 并依次加入盐、糖、生抽、醋、香油、芥末, 用量如上。" },
    { index := 5, instruction := "木耳盛出后沥水, 放入上一步碗中。" },
    { index := 6, instruction := "搅拌充分，端盘。" }
  ]
}

theorem recipe_9d5b2964d96a_ingredients_nonempty :
    recipe_9d5b2964d96a.ingredients.isEmpty = false := by decide

theorem recipe_9d5b2964d96a_steps_nonempty :
    recipe_9d5b2964d96a.steps.isEmpty = false := by decide

theorem recipe_9d5b2964d96a_step_count :
    recipe_9d5b2964d96a.steps.length = 6 := by decide

theorem recipe_9d5b2964d96a_steps_ordered :
    orderedFrom 1 recipe_9d5b2964d96a.steps = true := by decide

theorem recipe_9d5b2964d96a_executes_to_terminal :
    executesToTerminal recipe_9d5b2964d96a = true := by decide

theorem recipe_9d5b2964d96a_kernel_certificate :
    kernelCertified recipe_9d5b2964d96a = true := by decide

end LeanToCook.SourceCatalog
