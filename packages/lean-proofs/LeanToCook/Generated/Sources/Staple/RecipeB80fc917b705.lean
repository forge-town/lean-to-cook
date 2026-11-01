/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 扬州炒饭 · dishes/staple/扬州炒饭/扬州炒饭.md -/
def recipe_b80fc917b705 : Recipe := {
  id := "b80fc917b705"
  title := "扬州炒饭"
  category := "staple"
  sourcePath := "dishes/staple/扬州炒饭/扬州炒饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "冷饭（干一点的为佳）",
    "鸡蛋",
    "冷冻去皮基围虾",
    "午餐肉罐头",
    "青豆",
    "胡萝卜",
    "玉米粒（可选）",
    "葱",
    "油",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "胡萝卜切丁 0.2cm0.2cm0.2cm，备用" },
    { index := 2, instruction := "午餐肉切丁 0.2cm0.2cm0.2cm，备用" },
    { index := 3, instruction := "葱分别取葱白和葱绿，各切成 0.25-0.5cm 的小段，分开备用" },
    { index := 4, instruction := "在碗中打入鸡蛋液，均匀搅拌，备用" },
    { index := 5, instruction := "将胡萝卜，青豆，玉米粒煮熟捞出，备用（水别倒）" },
    { index := 6, instruction := "将虾煮熟，捞出备用（水可以倒了）" },
    { index := 7, instruction := "热锅热油，可以参考学习炒与煎中的热锅双油" },
    { index := 8, instruction := "鸡蛋凝固后立刻捞出，备用" },
    { index := 9, instruction := "将午餐肉，青豆，胡萝卜，玉米粒，虾倒入锅中翻炒 1-2 分钟，装盘备用" },
    { index := 10, instruction := "水冲一下锅，将杂物冲干净，保证锅内干净（可以有油但是不能有杂质）" },
    { index := 11, instruction := "热锅热油(10ml)，将葱白放入爆香" },
    { index := 12, instruction := "调至小火（如果油温过高可以关火 1-2 分钟），放入米饭，用铲子快速砸击米饭并翻炒，保证米饭均匀沾到油且粒粒分明" },
    { index := 13, instruction := "倒入鸡蛋，继续砸击，使鸡蛋碎开并与米饭充分混合" },
    { index := 14, instruction := "转大火，倒入其他所有备用配料，快速翻炒 1-2 分钟" },
    { index := 15, instruction := "撒入盐，并翻炒至充分混合" },
    { index := 16, instruction := "撒入葱绿，翻炒 1 分钟" },
    { index := 17, instruction := "关火，装盘" }
  ]
}

theorem recipe_b80fc917b705_ingredients_nonempty :
    recipe_b80fc917b705.ingredients.isEmpty = false := by decide

theorem recipe_b80fc917b705_steps_nonempty :
    recipe_b80fc917b705.steps.isEmpty = false := by decide

theorem recipe_b80fc917b705_step_count :
    recipe_b80fc917b705.steps.length = 17 := by decide

theorem recipe_b80fc917b705_steps_ordered :
    orderedFrom 1 recipe_b80fc917b705.steps = true := by decide

theorem recipe_b80fc917b705_executes_to_terminal :
    executesToTerminal recipe_b80fc917b705 = true := by decide

theorem recipe_b80fc917b705_kernel_certificate :
    kernelCertified recipe_b80fc917b705 = true := by decide

end LeanToCook.SourceCatalog
