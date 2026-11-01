/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 腊八粥 · dishes/soup/腊八粥.md -/
def recipe_46c174a49499 : Recipe := {
  id := "46c174a49499"
  title := "腊八粥"
  category := "soup"
  sourcePath := "dishes/soup/腊八粥.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "饮用水",
    "大米",
    "糯米",
    "花生",
    "红豆",
    "红枣",
    "粥锅（普通锅容易糊底，有条件可选择高压锅）",
    "中号玻璃碗（或其他中号不锈钢容器）",
    "小碗若干",
    "薏米",
    "黑米",
    "小米",
    "莲子",
    "绿豆",
    "黄豆",
    "豌豆",
    "红腰豆",
    "桂圆（去种龙眼干）",
    "栗子",
    "去壳核桃",
    "葡萄干",
    "冰糖（或白糖，调味用）"
  ]
  steps := [
    { index := 1, instruction := "提前洗净好绿豆、红豆、花生、黄豆、豌豆、红腰豆，并用干净的玻璃碗盛放好，注入 3/4 玻璃碗大小的饮用水，浸泡一夜（或最少 8 小时）。" },
    { index := 2, instruction := "提前洗净好大米、糯米、薏米、黑米、小米、莲子，并用干净的玻璃碗盛放好，注入 3/4 玻璃碗大小的饮用水，浸泡 3 小时。" },
    { index := 3, instruction := "将步骤 1 中准备好的盛有绿豆、红豆、花生、黄豆、豌豆、红腰豆的玻璃碗中的水分分离倒出，其余原料倒入粥锅中，加入 1 升饮用水（或漫过食材 1 拇指块），大火煮沸，煮沸后合上锅盖，小火煮 30 分钟。" },
    { index := 4, instruction := "将步骤 2 中准备好的盛有大米、糯米、薏米、黑米、小米、莲子的玻璃碗中的水分分离倒出，其余原料继续倒入粥锅中，合上锅盖，小火煮 60 分钟。" },
    { index := 5, instruction := "洗净好红枣、桂圆、栗子、核桃、葡萄干（其中红枣切成小片）、冰糖，倒入锅中，合上锅盖，小火煮 60 分钟。" },
    { index := 6, instruction := "确认煮出的粥粘稠后即可关火、盛盘、食用。" }
  ]
}

theorem recipe_46c174a49499_ingredients_nonempty :
    recipe_46c174a49499.ingredients.isEmpty = false := by decide

theorem recipe_46c174a49499_steps_nonempty :
    recipe_46c174a49499.steps.isEmpty = false := by decide

theorem recipe_46c174a49499_step_count :
    recipe_46c174a49499.steps.length = 6 := by decide

theorem recipe_46c174a49499_steps_ordered :
    orderedFrom 1 recipe_46c174a49499.steps = true := by decide

theorem recipe_46c174a49499_executes_to_terminal :
    executesToTerminal recipe_46c174a49499 = true := by decide

theorem recipe_46c174a49499_kernel_certificate :
    kernelCertified recipe_46c174a49499 = true := by decide

end LeanToCook.SourceCatalog
