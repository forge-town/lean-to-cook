/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 英式司康 · dishes/dessert/英式司康/英式司康.md -/
def recipe_91bc15e9352d : Recipe := {
  id := "91bc15e9352d"
  title := "英式司康"
  category := "dessert"
  sourcePath := "dishes/dessert/英式司康/英式司康.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "无盐黄油（推荐品牌总统）",
    "低筋面粉",
    "糖",
    "盐",
    "泡打粉",
    "鸡蛋",
    "淡奶油",
    "奶油奶酪（可选）"
  ]
  steps := [
    { index := 1, instruction := "鸡蛋打散，称量出 30g 蛋液放入干净容器中，放入全量淡奶油和奶油奶酪混合均匀。如果奶酪太硬可以水浴加热至大约 40 度再混合。" },
    { index := 2, instruction := "将低筋面粉，盐，糖，泡打粉放入干净容器中混合均匀" },
    { index := 3, instruction := "黄油切成小块，放入上一步的混合物中，用手将黄油捏入混合物中，呈粗玉米粉质地" },
    { index := 4, instruction := "将第一步的蛋奶混合液倒入上一步得到的粉油混合物种，搅拌均接近。叠压成均匀面团" },
    { index := 5, instruction := "面团放到案板上，擀成 1.5cm 厚的面片，用刀或者模具分切成合适的形状" },
    { index := 6, instruction := "用刷子蘸取剩余的 20g 鸡蛋液，刷在司康表面" },
    { index := 7, instruction := "烤箱预热 180 度，烤制 27 分钟" }
  ]
}

theorem recipe_91bc15e9352d_ingredients_nonempty :
    recipe_91bc15e9352d.ingredients.isEmpty = false := by decide

theorem recipe_91bc15e9352d_steps_nonempty :
    recipe_91bc15e9352d.steps.isEmpty = false := by decide

theorem recipe_91bc15e9352d_step_count :
    recipe_91bc15e9352d.steps.length = 7 := by decide

theorem recipe_91bc15e9352d_steps_ordered :
    orderedFrom 1 recipe_91bc15e9352d.steps = true := by decide

theorem recipe_91bc15e9352d_executes_to_terminal :
    executesToTerminal recipe_91bc15e9352d = true := by decide

theorem recipe_91bc15e9352d_kernel_certificate :
    kernelCertified recipe_91bc15e9352d = true := by decide

end LeanToCook.SourceCatalog
