/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 砂糖椰子冰沙 · dishes/drink/砂糖椰子冰沙/砂糖椰子冰沙.md -/
def recipe_677f373658d2 : Recipe := {
  id := "677f373658d2"
  title := "砂糖椰子冰沙"
  category := "drink"
  sourcePath := "dishes/drink/砂糖椰子冰沙/砂糖椰子冰沙.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "瓶装椰汁（瓶口较大为佳）",
    "咖啡调糖（黄色粗粒）"
  ]
  steps := [
    { index := 1, instruction := "500ml 瓶装椰汁倒掉 200ml，立刻拧紧瓶盖。" },
    { index := 2, instruction := "将这瓶椰汁放入冰箱冷冻区并冷冻 10 小时以上。" },
    { index := 3, instruction := "将这瓶椰汁取出，若确认瓶中椰汁已彻底冻结，则在墙角、椅背、桌角等坚硬表面上用力抽打。（请务必确认表面不会因此受到损伤）" },
    { index := 4, instruction := "当抽打到冻结椰汁变成冰沙状态，打开瓶盖倒出冰沙。" },
    { index := 5, instruction := "在冰沙表面均匀撒上咖啡调糖或坚果碎。" },
    { index := 6, instruction := "完成" }
  ]
}

theorem recipe_677f373658d2_ingredients_nonempty :
    recipe_677f373658d2.ingredients.isEmpty = false := by decide

theorem recipe_677f373658d2_steps_nonempty :
    recipe_677f373658d2.steps.isEmpty = false := by decide

theorem recipe_677f373658d2_step_count :
    recipe_677f373658d2.steps.length = 6 := by decide

theorem recipe_677f373658d2_steps_ordered :
    orderedFrom 1 recipe_677f373658d2.steps = true := by decide

theorem recipe_677f373658d2_executes_to_terminal :
    executesToTerminal recipe_677f373658d2 = true := by decide

theorem recipe_677f373658d2_kernel_certificate :
    kernelCertified recipe_677f373658d2 = true := by decide

end LeanToCook.SourceCatalog
