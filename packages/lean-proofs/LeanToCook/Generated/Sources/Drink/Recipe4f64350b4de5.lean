/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 金汤力 · dishes/drink/金汤力/金汤力.md -/
def recipe_4f64350b4de5 : Recipe := {
  id := "4f64350b4de5"
  title := "金汤力"
  category := "drink"
  sourcePath := "dishes/drink/金汤力/金汤力.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "金酒",
    "汤力水气泡水",
    "柠檬",
    "冰块",
    "新鲜绿叶（可选，装饰用）",
    "手动压汁器"
  ]
  steps := [
    { index := 1, instruction := "将柠檬对半切（刀方向垂直于柠檬的头尾连线），并从其中的一半中切取一片柠檬备用" },
    { index := 2, instruction := "再次将柠檬对半切，将得到的 4 角柠檬用压汁器压出柠檬汁置于容器中备用" },
    { index := 3, instruction := "选择一个杯子，建议使用容量在 350400 毫升的透明玻璃杯" },
    { index := 4, instruction := "将 100 克冰块放置在杯底" },
    { index := 5, instruction := "倒入 3040 毫升金酒" },
    { index := 6, instruction := "倒入 15 毫升柠檬汁（如果喜酸可以加多点或全加）" },
    { index := 7, instruction := "用勺子搅拌均匀" },
    { index := 8, instruction := "将之前准备的一片柠檬放置好" },
    { index := 9, instruction := "缓慢沿杯壁注入汤力水直至满杯（不要倒在冰上，避免起泡流失）" },
    { index := 10, instruction := "用勺子轻轻上下提拉将液体搅拌均匀（不要旋转搅拌，避免起泡流失）" },
    { index := 11, instruction := "在液面放置好装饰用的绿叶（可选）" }
  ]
}

theorem recipe_4f64350b4de5_ingredients_nonempty :
    recipe_4f64350b4de5.ingredients.isEmpty = false := by decide

theorem recipe_4f64350b4de5_steps_nonempty :
    recipe_4f64350b4de5.steps.isEmpty = false := by decide

theorem recipe_4f64350b4de5_step_count :
    recipe_4f64350b4de5.steps.length = 11 := by decide

theorem recipe_4f64350b4de5_steps_ordered :
    orderedFrom 1 recipe_4f64350b4de5.steps = true := by decide

theorem recipe_4f64350b4de5_executes_to_terminal :
    executesToTerminal recipe_4f64350b4de5 = true := by decide

theorem recipe_4f64350b4de5_kernel_certificate :
    kernelCertified recipe_4f64350b4de5 = true := by decide

end LeanToCook.SourceCatalog
