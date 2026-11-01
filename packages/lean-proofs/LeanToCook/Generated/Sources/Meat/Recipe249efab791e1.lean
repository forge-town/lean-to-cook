/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 醉排骨 · dishes/meat_dish/醉排骨/醉排骨.md -/
def recipe_249efab791e1 : Recipe := {
  id := "249efab791e1"
  title := "醉排骨"
  category := "meat"
  sourcePath := "dishes/meat_dish/醉排骨/醉排骨.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "排骨",
    "白砂糖",
    "食用油",
    "鱼露",
    "芝麻",
    "番茄酱",
    "香醋",
    "蒜头",
    "葱",
    "地瓜粉",
    "鸡蛋黄"
  ]
  steps := [
    { index := 1, instruction := "排骨中加入 5 g 地瓜粉和水进行搅拌，清洗 2-3 遍后放入大碗备用" },
    { index := 2, instruction := "排骨中加入鱼露、地瓜粉、鸡蛋黄 充分搅拌" },
    { index := 3, instruction := "将排骨一个一个放入锅中（切记不可以整碗倒入），保证每个不要粘在一起" },
    { index := 4, instruction := "全部放入后，每 30 S 用勺子来回两面翻转瘦肉块，直至排骨表面金黄" },
    { index := 5, instruction := "取出排骨，一分钟后倒入油锅中继续炸，直至瘦肉块表面出现焦黄后，取出放入大碗备用" },
    { index := 6, instruction := "准备一个小碗，加入蒜末、香醋、白砂糖、鱼露、番茄酱、葱花、芝麻搅拌均匀，倒入 5 ml 热油" },
    { index := 7, instruction := "将汤汁浇灌入排骨，在充分搅拌后倒入盘中" }
  ]
}

theorem recipe_249efab791e1_ingredients_nonempty :
    recipe_249efab791e1.ingredients.isEmpty = false := by decide

theorem recipe_249efab791e1_steps_nonempty :
    recipe_249efab791e1.steps.isEmpty = false := by decide

theorem recipe_249efab791e1_step_count :
    recipe_249efab791e1.steps.length = 7 := by decide

theorem recipe_249efab791e1_steps_ordered :
    orderedFrom 1 recipe_249efab791e1.steps = true := by decide

theorem recipe_249efab791e1_executes_to_terminal :
    executesToTerminal recipe_249efab791e1 = true := by decide

theorem recipe_249efab791e1_kernel_certificate :
    kernelCertified recipe_249efab791e1 = true := by decide

end LeanToCook.SourceCatalog
