/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 印度奶茶 · dishes/drink/印度奶茶.md -/
def recipe_b48ca1e354ea : Recipe := {
  id := "b48ca1e354ea"
  title := "印度奶茶"
  category := "drink"
  sourcePath := "dishes/drink/印度奶茶.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "红茶（CTC 红茶最佳，或阿萨姆红茶）",
    "全脂牛奶",
    "生姜",
    "小豆蔻（绿色）",
    "肉桂棒",
    "丁香",
    "黑胡椒粒",
    "糖",
    "小奶锅"
  ]
  steps := [
    { index := 1, instruction := "将生姜拍碎（不用切太碎，拍开即可释放姜汁）" },
    { index := 2, instruction := "将小豆蔻用刀背拍开，露出里面的籽" },
    { index := 3, instruction := "将黑胡椒粒拍碎" },
    { index := 4, instruction := "在小奶锅中倒入 120ml 水" },
    { index := 5, instruction := "放入拍碎的生姜、小豆蔻、肉桂棒、丁香、黑胡椒粒" },
    { index := 6, instruction := "大火煮沸后转小火，煮 2 分钟，让香料的味道充分释出" },
    { index := 7, instruction := "加入红茶 8g，继续小火煮 2 分钟，直至茶汤颜色变深" },
    { index := 8, instruction := "倒入全脂牛奶 120ml" },
    { index := 9, instruction := "中火加热，注意观察，当奶茶开始冒泡上升时立即转小火（牛奶极易溢出）" },
    { index := 10, instruction := "小火煮 2-3 分钟，期间可以将锅提起倒回（反复提拉 3-4 次），使茶汤与牛奶充分融合" },
    { index := 11, instruction := "加入糖，搅拌溶解" },
    { index := 12, instruction := "关火" },
    { index := 13, instruction := "用滤网过滤到茶盏中，去除茶叶和香料残渣" },
    { index := 14, instruction := "趁热饮用" }
  ]
}

theorem recipe_b48ca1e354ea_ingredients_nonempty :
    recipe_b48ca1e354ea.ingredients.isEmpty = false := by decide

theorem recipe_b48ca1e354ea_steps_nonempty :
    recipe_b48ca1e354ea.steps.isEmpty = false := by decide

theorem recipe_b48ca1e354ea_step_count :
    recipe_b48ca1e354ea.steps.length = 14 := by decide

theorem recipe_b48ca1e354ea_steps_ordered :
    orderedFrom 1 recipe_b48ca1e354ea.steps = true := by decide

theorem recipe_b48ca1e354ea_executes_to_terminal :
    executesToTerminal recipe_b48ca1e354ea = true := by decide

theorem recipe_b48ca1e354ea_kernel_certificate :
    kernelCertified recipe_b48ca1e354ea = true := by decide

end LeanToCook.SourceCatalog
