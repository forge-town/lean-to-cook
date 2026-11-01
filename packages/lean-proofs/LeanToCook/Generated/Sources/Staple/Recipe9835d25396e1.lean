/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 陕西油泼面 · dishes/staple/陕西油泼面/陕西油泼面.md -/
def recipe_9835d25396e1 : Recipe := {
  id := "9835d25396e1"
  title := "陕西油泼面"
  category := "staple"
  sourcePath := "dishes/staple/陕西油泼面/陕西油泼面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鲜面条（扯面尤佳）扯面",
    "盐",
    "葱",
    "蒜",
    "干辣椒面（或秦椒面）",
    "食用油",
    "生抽",
    "香醋",
    "青菜（油菜或菠菜均可）",
    "锅"
  ]
  steps := [
    { index := 1, instruction := "扯面的话，用擀面杖（没有擀面杖，用手也行）上下两边轻压，两手拽住左侧和右侧两端，轻轻拉开" },
    { index := 2, instruction := "葱切成葱花，蒜切成蒜末备用" },
    { index := 3, instruction := "青菜洗净，豆芽洗净备用（如使用）" },
    { index := 4, instruction := "锅中加入足量清水，大火烧开后加入 1g 盐" },
    { index := 5, instruction := "放入面条，用筷子轻轻搅动防止粘连，煮至面条浮起后再煮 1-2 分钟" },
    { index := 6, instruction := "在煮面的最后 1 分钟，放入青菜和豆芽焯水" },
    { index := 7, instruction := "将煮好的面条和青菜、豆芽捞出，沥干水分后放入碗中" },
    { index := 8, instruction := "在面条上依次加入生抽、香醋、葱花、蒜末和干辣椒面, 也可放点芝麻" },
    { index := 9, instruction := "炒锅中倒入食用油，同时放入花椒、八角、桂皮、香叶（如使用），小火炸出香味后捞出香料" },
    { index := 10, instruction := "待油温升至七成热（微微冒烟）时，迅速均匀地泼在碗中的干辣椒面上，听到“滋啦”声即可" },
    { index := 11, instruction := "用筷子将所有调料和面条充分拌匀即可食用" }
  ]
}

theorem recipe_9835d25396e1_ingredients_nonempty :
    recipe_9835d25396e1.ingredients.isEmpty = false := by decide

theorem recipe_9835d25396e1_steps_nonempty :
    recipe_9835d25396e1.steps.isEmpty = false := by decide

theorem recipe_9835d25396e1_step_count :
    recipe_9835d25396e1.steps.length = 11 := by decide

theorem recipe_9835d25396e1_steps_ordered :
    orderedFrom 1 recipe_9835d25396e1.steps = true := by decide

theorem recipe_9835d25396e1_executes_to_terminal :
    executesToTerminal recipe_9835d25396e1 = true := by decide

theorem recipe_9835d25396e1_kernel_certificate :
    kernelCertified recipe_9835d25396e1 = true := by decide

end LeanToCook.SourceCatalog
