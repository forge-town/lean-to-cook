/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 煎烤羊排 · dishes/meat_dish/煎烤羊排/煎烤羊排.md -/
def recipe_91b68386ebf3 : Recipe := {
  id := "91b68386ebf3"
  title := "煎烤羊排"
  category := "meat"
  sourcePath := "dishes/meat_dish/煎烤羊排/煎烤羊排.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "羊排",
    "桂皮",
    "花椒",
    "八角",
    "白芷",
    "香叶",
    "盐",
    "料酒",
    "辣椒粉",
    "孜然粒",
    "烧烤撒料",
    "孜然粉",
    "白芝麻",
    "糖",
    "高压锅",
    "炒锅 / 煎锅"
  ]
  steps := [
    { index := 1, instruction := "将羊排按照骨头分布，切成块状。" },
    { index := 2, instruction := "炒锅中加入冷水，放入全部羊排块，水沸腾后继续焯水 2 - 3 分钟，捞出备用。" },
    { index := 3, instruction := "将焯好水的羊排、桂皮、花椒、八角、白芷、香叶、料酒放入锅中（高压锅或普通锅）。" },
    { index := 4, instruction := "加入饮用水没过所有食材。如果使用高压锅，上汽后压 30 分钟。如果使用普通锅，炖煮 80 分钟。" },
    { index := 5, instruction := "将炖煮完成的羊排捞出，沥干水分，放入无油无水的炒锅 / 煎锅中。" },
    { index := 6, instruction := "中大火煎 6 - 7 分钟，直至羊排中的油脂被煎出，表面呈金黄酥脆状态。" },
    { index := 7, instruction := "锅中保留煎出的羊油，加入辣椒粉、孜然粒、烧烤撒料、孜然粉、白芝麻，翻炒均匀。" },
    { index := 8, instruction := "加入糖和盐（如果在炖煮步骤中未添加），翻炒均匀。" },
    { index := 9, instruction := "翻炒均匀后即可关火，盛盘。" }
  ]
}

theorem recipe_91b68386ebf3_ingredients_nonempty :
    recipe_91b68386ebf3.ingredients.isEmpty = false := by decide

theorem recipe_91b68386ebf3_steps_nonempty :
    recipe_91b68386ebf3.steps.isEmpty = false := by decide

theorem recipe_91b68386ebf3_step_count :
    recipe_91b68386ebf3.steps.length = 9 := by decide

theorem recipe_91b68386ebf3_steps_ordered :
    orderedFrom 1 recipe_91b68386ebf3.steps = true := by decide

theorem recipe_91b68386ebf3_executes_to_terminal :
    executesToTerminal recipe_91b68386ebf3 = true := by decide

theorem recipe_91b68386ebf3_kernel_certificate :
    kernelCertified recipe_91b68386ebf3 = true := by decide

end LeanToCook.SourceCatalog
