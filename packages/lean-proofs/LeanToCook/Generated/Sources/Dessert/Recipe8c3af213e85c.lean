/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 提拉米苏 · dishes/dessert/提拉米苏/提拉米苏.md -/
def recipe_8c3af213e85c : Recipe := {
  id := "8c3af213e85c"
  title := "提拉米苏"
  category := "dessert"
  sourcePath := "dishes/dessert/提拉米苏/提拉米苏.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "马斯卡彭芝士",
    "手指饼干",
    "放凉浓缩咖啡",
    "无菌鸡蛋",
    "白砂糖",
    "可可粉",
    "朗姆酒（不喜欢酒的朋友可省略，可按照自己口味调节）",
    "一个装成品的容器（这里用的是玻璃乐扣）",
    "打蛋器（手劲儿大的朋友也可以锻炼臂力）"
  ]
  steps := [
    { index := 1, instruction := "分离蛋黄蛋清" },
    { index := 2, instruction := "盛有蛋白的碗中加 10g 白砂糖湿性打发" },
    { index := 3, instruction := "盛有蛋黄的碗中将 40g 白砂糖分三次加入，搅拌至均匀" },
    { index := 4, instruction := "蛋黄中分三次加入马斯卡彭芝士，搅拌至均匀" },
    { index := 5, instruction := "蛋黄中最后加入朗姆酒，搅拌均匀" },
    { index := 6, instruction := "将打发好的蛋白分三次加入蛋黄芝士液中" },
    { index := 7, instruction := "手指饼干两面浸湿咖啡液，平铺入容器" },
    { index := 8, instruction := "两层芝士液两层饼干交替放入容器（这一步按照大家意愿及容器高度酌情处理）" },
    { index := 9, instruction := "放入冰箱冷藏四个小时（心急的小伙伴可以提早拿出来）" },
    { index := 10, instruction := "取出后在表面筛上可可粉，即可享用啦" }
  ]
}

theorem recipe_8c3af213e85c_ingredients_nonempty :
    recipe_8c3af213e85c.ingredients.isEmpty = false := by decide

theorem recipe_8c3af213e85c_steps_nonempty :
    recipe_8c3af213e85c.steps.isEmpty = false := by decide

theorem recipe_8c3af213e85c_step_count :
    recipe_8c3af213e85c.steps.length = 10 := by decide

theorem recipe_8c3af213e85c_steps_ordered :
    orderedFrom 1 recipe_8c3af213e85c.steps = true := by decide

theorem recipe_8c3af213e85c_executes_to_terminal :
    executesToTerminal recipe_8c3af213e85c = true := by decide

theorem recipe_8c3af213e85c_kernel_certificate :
    kernelCertified recipe_8c3af213e85c = true := by decide

end LeanToCook.SourceCatalog
