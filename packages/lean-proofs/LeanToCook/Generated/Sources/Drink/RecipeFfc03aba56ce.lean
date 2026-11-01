/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 可乐桶 · dishes/drink/可乐桶.md -/
def recipe_ffc03aba56ce : Recipe := {
  id := "ffc03aba56ce"
  title := "可乐桶"
  category := "drink"
  sourcePath := "dishes/drink/可乐桶.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "波旁威士忌",
    "可口可乐",
    "冰块",
    "柠檬（可选，提升口感用）",
    "手动压汁器"
  ]
  steps := [
    { index := 1, instruction := "将柠檬对半切（刀方向垂直于柠檬的头尾连线），并从其中的一半中切取一片柠檬备用" },
    { index := 2, instruction := "再次将柠檬对半切，将得到的 4 角柠檬用压汁器压出柠檬汁置于容器中备用" },
    { index := 3, instruction := "将挤压过的柠檬置于容器中备用" },
    { index := 4, instruction := "选择一个杯子，建议使用容量在大约 1 升的大型玻璃杯或铁皮酒桶" },
    { index := 5, instruction := "将冰块和挤压过的柠檬入杯中（可根据个人喜好设计柠檬与冰块的摆放）" },
    { index := 6, instruction := "倒入 15 毫升柠檬汁（如果喜酸可以加多点或全加）" },
    { index := 7, instruction := "沿杯壁缓慢倒入可口可乐至距离杯口 3/4 处（控制可乐和威士忌的比例约在 5:1 ）" },
    { index := 8, instruction := "倒入威士忌直至满杯" }
  ]
}

theorem recipe_ffc03aba56ce_ingredients_nonempty :
    recipe_ffc03aba56ce.ingredients.isEmpty = false := by decide

theorem recipe_ffc03aba56ce_steps_nonempty :
    recipe_ffc03aba56ce.steps.isEmpty = false := by decide

theorem recipe_ffc03aba56ce_step_count :
    recipe_ffc03aba56ce.steps.length = 8 := by decide

theorem recipe_ffc03aba56ce_steps_ordered :
    orderedFrom 1 recipe_ffc03aba56ce.steps = true := by decide

theorem recipe_ffc03aba56ce_executes_to_terminal :
    executesToTerminal recipe_ffc03aba56ce = true := by decide

theorem recipe_ffc03aba56ce_kernel_certificate :
    kernelCertified recipe_ffc03aba56ce = true := by decide

end LeanToCook.SourceCatalog
