/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 金枪鱼酱三明治 · dishes/breakfast/金枪鱼酱三明治.md -/
def recipe_f3b656b5a03f : Recipe := {
  id := "f3b656b5a03f"
  title := "金枪鱼酱三明治"
  category := "breakfast"
  sourcePath := "dishes/breakfast/金枪鱼酱三明治.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "水浸金枪鱼罐头（不建议用油浸，会很腻）",
    "方形吐司片",
    "蛋黄酱",
    "俄式酸黄瓜汁",
    "芝士片（可选）",
    "火腿片（可选）",
    "轻食机"
  ]
  steps := [
    { index := 1, instruction := "将金枪鱼、蛋黄酱、俄式酸黄瓜汁倒入碗中，用勺子搅拌，保证将金枪鱼块搅碎，酱整体呈糊状，并备用" },
    { index := 2, instruction := "将 1 片吐司放在轻食机上" },
    { index := 3, instruction := "将做好的金枪鱼酱涂抹到吐司上，建议 10-15ml" },
    { index := 4, instruction := "将另一片方形吐司片覆盖在上面，并按压轻食机，开机" },
    { index := 5, instruction := "待轻食机自动停止加热，即可装盘使用" }
  ]
}

theorem recipe_f3b656b5a03f_ingredients_nonempty :
    recipe_f3b656b5a03f.ingredients.isEmpty = false := by decide

theorem recipe_f3b656b5a03f_steps_nonempty :
    recipe_f3b656b5a03f.steps.isEmpty = false := by decide

theorem recipe_f3b656b5a03f_step_count :
    recipe_f3b656b5a03f.steps.length = 5 := by decide

theorem recipe_f3b656b5a03f_steps_ordered :
    orderedFrom 1 recipe_f3b656b5a03f.steps = true := by decide

theorem recipe_f3b656b5a03f_executes_to_terminal :
    executesToTerminal recipe_f3b656b5a03f = true := by decide

theorem recipe_f3b656b5a03f_kernel_certificate :
    kernelCertified recipe_f3b656b5a03f = true := by decide

end LeanToCook.SourceCatalog
