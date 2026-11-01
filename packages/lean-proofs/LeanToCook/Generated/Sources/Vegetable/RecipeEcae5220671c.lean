/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 微波炉鸡蛋羹 · dishes/vegetable_dish/鸡蛋羹/微波炉鸡蛋羹.md -/
def recipe_ecae5220671c : Recipe := {
  id := "ecae5220671c"
  title := "微波炉鸡蛋羹"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/鸡蛋羹/微波炉鸡蛋羹.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋",
    "水"
  ]
  steps := [
    { index := 1, instruction := "将鸡蛋打入可使用微波炉加热的陶瓷碗中，使用筷子将其打散。" },
    { index := 2, instruction := "加入水和盐，搅拌均匀。" },
    { index := 3, instruction := "将虾皮放入碗中，搅拌均匀，保证所有虾皮不会堆积在一起。" },
    { index := 4, instruction := "葱切碎至边长 0.6±3mm 状，放入碗中搅拌均匀。" },
    { index := 5, instruction := "将此碗及内容物放入微波炉中，容器表面覆盖保鲜膜或以可微波瓷盘加盖（注意：不得密封，必须留有涨缩量）加热 2 分钟(500W)。" },
    { index := 6, instruction := "小心地取下保鲜膜或其他覆盖物，然后继续加热 2 分钟。" },
    { index := 7, instruction := "若微波炉不带旋转式加热盘，将碗缓慢的水平旋转 180 度，以确保内容物加热均匀。" },
    { index := 8, instruction := "放入芝麻油。" },
    { index := 9, instruction := "小心地从微波炉中拿出碗（真的很烫）。" },
    { index := 10, instruction := "如果选择放入酱油，则确保酱油在鸡蛋羹表面流动后能以最薄的形式沾满鸡蛋羹表面即可。" },
    { index := 11, instruction := "开心的享受鸡蛋羹" }
  ]
}

theorem recipe_ecae5220671c_ingredients_nonempty :
    recipe_ecae5220671c.ingredients.isEmpty = false := by decide

theorem recipe_ecae5220671c_steps_nonempty :
    recipe_ecae5220671c.steps.isEmpty = false := by decide

theorem recipe_ecae5220671c_step_count :
    recipe_ecae5220671c.steps.length = 11 := by decide

theorem recipe_ecae5220671c_steps_ordered :
    orderedFrom 1 recipe_ecae5220671c.steps = true := by decide

theorem recipe_ecae5220671c_executes_to_terminal :
    executesToTerminal recipe_ecae5220671c = true := by decide

theorem recipe_ecae5220671c_kernel_certificate :
    kernelCertified recipe_ecae5220671c = true := by decide

end LeanToCook.SourceCatalog
