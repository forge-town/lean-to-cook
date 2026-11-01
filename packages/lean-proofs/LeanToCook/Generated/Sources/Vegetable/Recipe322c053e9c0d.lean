/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 虎皮青椒 · dishes/vegetable_dish/虎皮青椒/虎皮青椒.md -/
def recipe_322c053e9c0d : Recipe := {
  id := "322c053e9c0d"
  title := "虎皮青椒"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/虎皮青椒/虎皮青椒.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "青椒",
    "大蒜",
    "白糖（灵魂）",
    "醋",
    "生抽",
    "盐",
    "砵或者有一定深度的碗"
  ]
  steps := [
    { index := 1, instruction := "去掉青椒蒂，用自来水冲洗干净。" },
    { index := 2, instruction := "青椒切长片，平均一个青椒纵向切成 3-4 片即可。" },
    { index := 3, instruction := "大蒜去皮，切成碎末，体积在 2mm x 2mm x 2mm 即可。" },
    { index := 4, instruction := "调料 1：拿一个小碗倒入 20ml 油，将大蒜末放入其中。" },
    { index := 5, instruction := "调料 2：白糖、生抽、醋、盐全部倒入砵（碗）等容器，搅拌。" },
    { index := 6, instruction := "将 调料 1 倒入锅中，开火加热 5 成放入青椒，青椒片不要叠在一起，单独成片放置锅中。" },
    { index := 7, instruction := "用锅铲不停的按压青椒，合适的时候翻面。" },
    { index := 8, instruction := "翻炒约 2 分钟，待青椒表皮出现褶皱时，倒入 调料 2。" },
    { index := 9, instruction := "加大火候继续翻炒 30s 后即可出锅盛入盘中。" }
  ]
}

theorem recipe_322c053e9c0d_ingredients_nonempty :
    recipe_322c053e9c0d.ingredients.isEmpty = false := by decide

theorem recipe_322c053e9c0d_steps_nonempty :
    recipe_322c053e9c0d.steps.isEmpty = false := by decide

theorem recipe_322c053e9c0d_step_count :
    recipe_322c053e9c0d.steps.length = 9 := by decide

theorem recipe_322c053e9c0d_steps_ordered :
    orderedFrom 1 recipe_322c053e9c0d.steps = true := by decide

theorem recipe_322c053e9c0d_executes_to_terminal :
    executesToTerminal recipe_322c053e9c0d = true := by decide

theorem recipe_322c053e9c0d_kernel_certificate :
    kernelCertified recipe_322c053e9c0d = true := by decide

end LeanToCook.SourceCatalog
