/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 农家一碗香 · dishes/meat_dish/农家一碗香/农家一碗香.md -/
def recipe_cd64270612fa : Recipe := {
  id := "cd64270612fa"
  title := "农家一碗香"
  category := "meat"
  sourcePath := "dishes/meat_dish/农家一碗香/农家一碗香.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "猪肉（推荐五花肉）",
    "青椒",
    "蒜片",
    "豆瓣酱",
    "酱油",
    "小米椒",
    "白糖",
    "姜片"
  ]
  steps := [
    { index := 1, instruction := "备菜阶段：将猪肉切片，最好把肥瘦分开放。同时要把青椒和小米辣切成段，蒜片用刀背拍成末，姜切成丝。鸡蛋打到小碗中，用筷子打散。" },
    { index := 2, instruction := "备好菜，就可正式煮菜了。先将油倒入锅中，锅中开小火，油热后将蛋液倒入锅中，将鸡蛋炒散，炒至断生即可，放回小碗中备用。" },
    { index := 3, instruction := "将锅中继续加一点油，开小火，锅热后将之前切的肥猪肉倒入锅中逼出猪油。" },
    { index := 4, instruction := "肥肉出现金黄色的时候，加大火力到中火，将瘦肉一起放入锅中翻炒。" },
    { index := 5, instruction := "瘦肉全部炒至变色的时候加入备好的姜丝、蒜末和豆瓣酱翻炒均匀给猪肉上色。" },
    { index := 6, instruction := "放入青红椒、炒至断生的鸡蛋后加入酱油和白糖，继续将它们翻炒到青椒微微断生，保持青椒清脆口感。" },
    { index := 7, instruction := "出锅上菜！" }
  ]
}

theorem recipe_cd64270612fa_ingredients_nonempty :
    recipe_cd64270612fa.ingredients.isEmpty = false := by decide

theorem recipe_cd64270612fa_steps_nonempty :
    recipe_cd64270612fa.steps.isEmpty = false := by decide

theorem recipe_cd64270612fa_step_count :
    recipe_cd64270612fa.steps.length = 7 := by decide

theorem recipe_cd64270612fa_steps_ordered :
    orderedFrom 1 recipe_cd64270612fa.steps = true := by decide

theorem recipe_cd64270612fa_executes_to_terminal :
    executesToTerminal recipe_cd64270612fa = true := by decide

theorem recipe_cd64270612fa_kernel_certificate :
    kernelCertified recipe_cd64270612fa = true := by decide

end LeanToCook.SourceCatalog
