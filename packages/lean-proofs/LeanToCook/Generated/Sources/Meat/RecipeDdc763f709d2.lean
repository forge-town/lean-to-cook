/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 猪皮冻 · dishes/meat_dish/猪皮冻/猪皮冻.md -/
def recipe_ddc763f709d2 : Recipe := {
  id := "ddc763f709d2"
  title := "猪皮冻"
  category := "meat"
  sourcePath := "dishes/meat_dish/猪皮冻/猪皮冻.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪皮",
    "大料、花椒、白芷、桂皮、丁香、香叶、小茴香"
  ]
  steps := [
    { index := 1, instruction := "将猪皮，剁成不超过 10cm 小块，用清水浸泡 12 小时，然后冷水下锅，加入姜 10g、料酒 50ml 后，汆烫 5-10 分钟，捞出放入冷水中" },
    { index := 2, instruction := "将焯过水的猪皮，放到案板上，将里面的白肉部分全部剔除，然后再切成成不超过 3mm 的长条，放入盆中" },
    { index := 3, instruction := "加入白醋 20g，盐 5g，用力搓洗 3 分钟，再用清水洗净，这时的猪皮已经基本没什么腥味" },
    { index := 4, instruction := "锅内加入 4kg 水，放入猪皮，葱 10g，姜片 10g，八角 10g，花椒 5g，大火烧开后，小火煲煮 90 分钟至猪皮软烂" },
    { index := 5, instruction := "再加入盐 8g、味精 10g、鸡精 15g、生抽 50ml、老抽 20ml 调味后，倒入盘中，将葱姜，八角拣出，晾凉至果冻状" },
    { index := 6, instruction := "放冰箱冷藏即可，食用时，切成小块或者厚片" }
  ]
}

theorem recipe_ddc763f709d2_ingredients_nonempty :
    recipe_ddc763f709d2.ingredients.isEmpty = false := by decide

theorem recipe_ddc763f709d2_steps_nonempty :
    recipe_ddc763f709d2.steps.isEmpty = false := by decide

theorem recipe_ddc763f709d2_step_count :
    recipe_ddc763f709d2.steps.length = 6 := by decide

theorem recipe_ddc763f709d2_steps_ordered :
    orderedFrom 1 recipe_ddc763f709d2.steps = true := by decide

theorem recipe_ddc763f709d2_executes_to_terminal :
    executesToTerminal recipe_ddc763f709d2 = true := by decide

theorem recipe_ddc763f709d2_kernel_certificate :
    kernelCertified recipe_ddc763f709d2 = true := by decide

end LeanToCook.SourceCatalog
