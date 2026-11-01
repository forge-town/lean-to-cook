/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蚝油三鲜菇 · dishes/vegetable_dish/蚝油三鲜菇/蚝油三鲜菇.md -/
def recipe_a4b59bbb9852 : Recipe := {
  id := "a4b59bbb9852"
  title := "蚝油三鲜菇"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/蚝油三鲜菇/蚝油三鲜菇.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "香菇",
    "蟹味菇",
    "白玉菇",
    "小米辣",
    "菜椒",
    "食用油",
    "盐",
    "料酒",
    "淀粉",
    "生抽",
    "鸡精",
    "香葱",
    "姜末",
    "蚝油",
    "西蓝花"
  ]
  steps := [
    { index := 1, instruction := "蟹味菇、白玉菇 去掉根部泥土，掰散菌朵" },
    { index := 2, instruction := "香菇切片（每片厚度 0.5-1 cm，厚点相对薄点更有嚼劲）" },
    { index := 3, instruction := "生粉倒入小碗中，加入 50ml 水，搅拌生粉直至融化没有颗粒（即水淀粉）备用" },
    { index := 4, instruction := "水开，放入西蓝花，清水煮 3 分钟，放入碗中备用" },
    { index := 5, instruction := "洗锅烧开水，加入 5 g 食用盐，倒入蟹味菇、白玉菇、香菇，水煮 1 分钟" },
    { index := 6, instruction := "1 分钟后，捞出沥干水分" },
    { index := 7, instruction := "起锅烧油，待油开始冒小泡，放入姜末、小米辣、菜椒 煸炒 30 S" },
    { index := 8, instruction := "倒入三鲜菇，然后依次倒入生抽、蚝油、鸡精，翻炒均匀后，倒入水淀粉" },
    { index := 9, instruction := "中火烧干汁，加入料酒、葱花 出锅" },
    { index := 10, instruction := "摆上西蓝花" }
  ]
}

theorem recipe_a4b59bbb9852_ingredients_nonempty :
    recipe_a4b59bbb9852.ingredients.isEmpty = false := by decide

theorem recipe_a4b59bbb9852_steps_nonempty :
    recipe_a4b59bbb9852.steps.isEmpty = false := by decide

theorem recipe_a4b59bbb9852_step_count :
    recipe_a4b59bbb9852.steps.length = 10 := by decide

theorem recipe_a4b59bbb9852_steps_ordered :
    orderedFrom 1 recipe_a4b59bbb9852.steps = true := by decide

theorem recipe_a4b59bbb9852_executes_to_terminal :
    executesToTerminal recipe_a4b59bbb9852 = true := by decide

theorem recipe_a4b59bbb9852_kernel_certificate :
    kernelCertified recipe_a4b59bbb9852 = true := by decide

end LeanToCook.SourceCatalog
