/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 上汤娃娃菜 · dishes/vegetable_dish/上汤娃娃菜/上汤娃娃菜.md -/
def recipe_a05b627440bb : Recipe := {
  id := "a05b627440bb"
  title := "上汤娃娃菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/上汤娃娃菜/上汤娃娃菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "娃娃菜",
    "皮蛋",
    "午餐肉（火腿肠）",
    "葱",
    "姜",
    "蒜",
    "盐",
    "糖",
    "淀粉"
  ]
  steps := [
    { index := 1, instruction := "娃娃菜洗净, 竖着切开切成段。" },
    { index := 2, instruction := "葱 3g 切 小段。蒜 10g 切片。姜 10g 切小片。" },
    { index := 3, instruction := "皮蛋切成丁, 火腿肠或者午餐肉切成丁（1cm 大小的丁）" },
    { index := 4, instruction := "金针菇洗净撕开" },
    { index := 5, instruction := "烧热水娃娃菜放进去十秒钟出一下水捞出。" },
    { index := 6, instruction := "热锅凉油, 加热锅倒入油过一遍就倒出来, 重新倒入一点油。" },
    { index := 7, instruction := "调至小火加入葱姜蒜，煎炒出香味即可。" },
    { index := 8, instruction := "加入适 300g 清水（水量没过娃娃菜即可）, 放入娃娃菜, 金针菇, 午餐肉" },
    { index := 9, instruction := "加入调味料蚝油、糖、盐、味精烧开。" },
    { index := 10, instruction := "煮 3 分钟, 煮开后开始装盘, 盛出娃娃菜后皮蛋放在上面把汤汁浇上去就可以了" }
  ]
}

theorem recipe_a05b627440bb_ingredients_nonempty :
    recipe_a05b627440bb.ingredients.isEmpty = false := by decide

theorem recipe_a05b627440bb_steps_nonempty :
    recipe_a05b627440bb.steps.isEmpty = false := by decide

theorem recipe_a05b627440bb_step_count :
    recipe_a05b627440bb.steps.length = 10 := by decide

theorem recipe_a05b627440bb_steps_ordered :
    orderedFrom 1 recipe_a05b627440bb.steps = true := by decide

theorem recipe_a05b627440bb_executes_to_terminal :
    executesToTerminal recipe_a05b627440bb = true := by decide

theorem recipe_a05b627440bb_kernel_certificate :
    kernelCertified recipe_a05b627440bb = true := by decide

end LeanToCook.SourceCatalog
