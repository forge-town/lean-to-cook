/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 金菲士 · dishes/drink/金菲士/金菲士.md -/
def recipe_efd96f40d1be : Recipe := {
  id := "efd96f40d1be"
  title := "金菲士"
  category := "drink"
  sourcePath := "dishes/drink/金菲士/金菲士.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "金酒",
    "苏打气泡水",
    "柠檬",
    "蔗糖糖浆",
    "冰块",
    "新鲜绿叶（可选，装饰用）",
    "手动压汁器",
    "雪克瓶（可选）"
  ]
  steps := [
    { index := 1, instruction := "将柠檬对半切（刀方向垂直于柠檬的头尾连线），并从其中的一半中切取一片柠檬备用" },
    { index := 2, instruction := "再次将柠檬对半切，将得到的 4 角柠檬用压汁器压出柠檬汁置于容器中备用" },
    { index := 3, instruction := "选择一个杯子，建议使用容量在 350400 毫升的透明玻璃杯" },
    { index := 4, instruction := "将 100 克冰块放置在杯底" },
    { index := 5, instruction := "倒入 3040 毫升金酒" },
    { index := 6, instruction := "倒入 20 毫升柠檬汁（如果喜酸可以加多点或全加）" },
    { index := 7, instruction := "倒入 3040 克蔗糖糖浆" },
    { index := 8, instruction := "用勺子搅拌均匀" },
    { index := 9, instruction := "将之前准备的一片柠檬放置好" },
    { index := 10, instruction := "缓慢沿杯壁注入苏打气泡水直至满杯（不要倒在冰上，避免起泡流失）" },
    { index := 11, instruction := "用勺子轻轻上下提拉将液体搅拌均匀（不要旋转搅拌，避免起泡流失）" },
    { index := 12, instruction := "在液面放置好装饰用的绿叶（可选）" },
    { index := 13, instruction := "将冰块、金酒、柠檬汁、蔗糖糖浆倒入雪克瓶，雪克均匀" },
    { index := 14, instruction := "将充分雪克的产物倒到杯子中（如果里面的冰太碎了，可以选择过滤其中的冰，重新往杯中补充冰块）" }
  ]
}

theorem recipe_efd96f40d1be_ingredients_nonempty :
    recipe_efd96f40d1be.ingredients.isEmpty = false := by decide

theorem recipe_efd96f40d1be_steps_nonempty :
    recipe_efd96f40d1be.steps.isEmpty = false := by decide

theorem recipe_efd96f40d1be_step_count :
    recipe_efd96f40d1be.steps.length = 14 := by decide

theorem recipe_efd96f40d1be_steps_ordered :
    orderedFrom 1 recipe_efd96f40d1be.steps = true := by decide

theorem recipe_efd96f40d1be_executes_to_terminal :
    executesToTerminal recipe_efd96f40d1be = true := by decide

theorem recipe_efd96f40d1be_kernel_certificate :
    kernelCertified recipe_efd96f40d1be = true := by decide

end LeanToCook.SourceCatalog
