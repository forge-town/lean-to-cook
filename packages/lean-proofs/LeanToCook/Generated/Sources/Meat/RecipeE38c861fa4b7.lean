/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 黑椒牛柳 · dishes/meat_dish/黑椒牛柳/黑椒牛柳.md -/
def recipe_e38c861fa4b7 : Recipe := {
  id := "e38c861fa4b7"
  title := "黑椒牛柳"
  category := "meat"
  sourcePath := "dishes/meat_dish/黑椒牛柳/黑椒牛柳.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛肉（可以用牛里脊肉或者牛排肉）",
    "洋葱",
    "菜椒（红/黄椒）",
    "淀粉",
    "黑胡椒（粉）",
    "黑椒（腌料）",
    "盐",
    "花生油"
  ]
  steps := [
    { index := 1, instruction := "将牛肉切条，长度最好控制在 8 厘米以下，厚度约 5-10 毫米，宽度约 1 厘米（要求不严格）" },
    { index := 2, instruction := "利用腌料腌制牛肉，混合均匀后静置，用量与时间请参照商品说明，可以延长不能缩短。" },
    { index := 3, instruction := "如果使用液态腌料，可以在腌制结束前三分钟撒一层黑胡椒粉，然后再加入淀粉，再次混合均匀后静置 20 分钟。" },
    { index := 4, instruction := "开火，热锅，加入花生油。" },
    { index := 5, instruction := "当能看到锅里的油冒出一丝烟时，放入牛肉，翻炒。" },
    { index := 6, instruction := "开中火偏大，翻炒 2 分钟至牛肉外表变色（即不出现明显血色，有血色部分说明翻炒不到位）（此处应小心油滴溅射）。" },
    { index := 7, instruction := "放入洋葱和菜椒，翻炒 2 分钟。" },
    { index := 8, instruction := "加入盐，再次撒一份黑胡椒粉，翻炒 30 秒，搅拌均匀。" },
    { index := 9, instruction := "观察洋葱已经变软即可关火，出锅，盛盘。" }
  ]
}

theorem recipe_e38c861fa4b7_ingredients_nonempty :
    recipe_e38c861fa4b7.ingredients.isEmpty = false := by decide

theorem recipe_e38c861fa4b7_steps_nonempty :
    recipe_e38c861fa4b7.steps.isEmpty = false := by decide

theorem recipe_e38c861fa4b7_step_count :
    recipe_e38c861fa4b7.steps.length = 9 := by decide

theorem recipe_e38c861fa4b7_steps_ordered :
    orderedFrom 1 recipe_e38c861fa4b7.steps = true := by decide

theorem recipe_e38c861fa4b7_executes_to_terminal :
    executesToTerminal recipe_e38c861fa4b7 = true := by decide

theorem recipe_e38c861fa4b7_kernel_certificate :
    kernelCertified recipe_e38c861fa4b7 = true := by decide

end LeanToCook.SourceCatalog
