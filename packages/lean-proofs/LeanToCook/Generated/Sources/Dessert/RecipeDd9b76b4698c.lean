/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 无厨师机蜂蜜面包 · dishes/dessert/无厨师机蜂蜜面包/无厨师机蜂蜜面包.md -/
def recipe_dd9b76b4698c : Recipe := {
  id := "dd9b76b4698c"
  title := "无厨师机蜂蜜面包"
  category := "dessert"
  sourcePath := "dishes/dessert/无厨师机蜂蜜面包/无厨师机蜂蜜面包.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "高筋面粉：400g",
    "牛奶: 200g",
    "酵母：4g",
    "鸡蛋：1 个",
    "白砂糖：70g",
    "盐: 2g",
    "黄油: 30g",
    "蜂蜜：20g",
    "水: 20g",
    "芝麻"
  ]
  steps := [
    { index := 1, instruction := "制作面团：将面粉，牛奶（建议加热到 40°，本人使用微波炉 15 - 20s），酵母，鸡蛋，面粉，糖和盐混合起来。" },
    { index := 2, instruction := "搅拌面团，将原料混合均匀成团。" },
    { index := 3, instruction := "加入黄油混合。" },
    { index := 4, instruction := "继续搅拌 + 手揉，均匀混合。" },
    { index := 5, instruction := "开始发面，使用保鲜膜覆盖容器，普通气温(10 - 20°)放置 1 - 2 小时，稍长时间对效果影响不大。" },
    { index := 6, instruction := "明显看到面团发酵变大（2 倍）即可开始切分面团, 此时面团应该不再十分黏手。" },
    { index := 7, instruction := "切分面团：理想状态每一份 60g（美观），可根据喜好适当调整大小。" },
    { index := 8, instruction := "将每一份小面团使用擀面杖擀成舌状后卷起, 再次醒面 10。" },
    { index := 9, instruction := "再次使用擀面杖擀成舌状后卷起, 从中间切开（一个变成两个）。" },
    { index := 10, instruction := "再次使用擀面杖擀成舌状后卷起, 从中间切开（两个变成四个）。（此步骤可以按照自己的时间多擀/卷几次, 把握一份的大小就行）" },
    { index := 11, instruction := "烤盘放入油纸并倒入花生油, （每份卷好的）底部蘸水 + 面粉后放入烤盘。" },
    { index := 12, instruction := "再次醒发（盖上保鲜膜）, 这一步可以放入冰箱, 第二天再烤。" },
    { index := 13, instruction := "刷上蛋液。" },
    { index := 14, instruction := "烤箱 180°(355°F), 18 - 20 分钟。" },
    { index := 15, instruction := "出炉后, 刷上蜂蜜水, 撒上芝麻。" }
  ]
}

theorem recipe_dd9b76b4698c_ingredients_nonempty :
    recipe_dd9b76b4698c.ingredients.isEmpty = false := by decide

theorem recipe_dd9b76b4698c_steps_nonempty :
    recipe_dd9b76b4698c.steps.isEmpty = false := by decide

theorem recipe_dd9b76b4698c_step_count :
    recipe_dd9b76b4698c.steps.length = 15 := by decide

theorem recipe_dd9b76b4698c_steps_ordered :
    orderedFrom 1 recipe_dd9b76b4698c.steps = true := by decide

theorem recipe_dd9b76b4698c_executes_to_terminal :
    executesToTerminal recipe_dd9b76b4698c = true := by decide

theorem recipe_dd9b76b4698c_kernel_certificate :
    kernelCertified recipe_dd9b76b4698c = true := by decide

end LeanToCook.SourceCatalog
