/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 魔芋蛋糕 · dishes/dessert/魔芋蛋糕/魔芋蛋糕.md -/
def recipe_1282bbd3a9c9 : Recipe := {
  id := "1282bbd3a9c9"
  title := "魔芋蛋糕"
  category := "dessert"
  sourcePath := "dishes/dessert/魔芋蛋糕/魔芋蛋糕.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "烤箱",
    "电动打蛋器",
    "金属蛋糕模具（形状任意）",
    "烘焙纸",
    "餐刀（用于翻拌和抹平蛋糕糊）",
    "隔热手套",
    "[可选] 分蛋器",
    "鸡蛋",
    "赤藓糖醇",
    "可可粉",
    "魔芋粉",
    "塔塔粉"
  ]
  steps := [
    { index := 1, instruction := "在准备蛋糕糊之前，可以开始预热烤箱至 350 ℉( 150 ℃)以节省时间" },
    { index := 2, instruction := "从冰箱中取出新鲜的鸡蛋" },
    { index := 3, instruction := "准备两个容器并擦干，分别盛放蛋清与蛋黄" },
    { index := 4, instruction := "对盛放蛋清的容器，可稍有水珠，但不能有任何油；盛放蛋黄的容器不能有水珠" },
    { index := 5, instruction := "打蛋，手工或利用分蛋器，将蛋清与蛋黄分离到两个容器中。" },
    { index := 6, instruction := "分离过程中蛋黄不能破碎，蛋清中不能混有任何蛋黄，否则会严重影响打发。（白色系带可进入蛋清，不影响）" },
    { index := 7, instruction := "（注意，不使用厨房机的情况下，盛放蛋清的容器也是打蛋的容器，为避免溢出，加入全部蛋清后不要超过容器的 1/8）" },
    { index := 8, instruction := "蛋清中加入 1g 塔塔粉" },
    { index := 9, instruction := "打蛋器高速，打发蛋白至粗大气泡的状态，加入 50g 赤藓糖醇" },
    { index := 10, instruction := "打蛋器中低速，打发蛋白至干性发泡的状态（提起打蛋器头，有短小直立的尖角；倒扣容器，蛋白可粘住容器不掉下来）" },
    { index := 11, instruction := "此时蛋白打发程度已符合要求" },
    { index := 12, instruction := "把分离的蛋黄加入打发的蛋清中，打蛋器中低速搅拌均匀" },
    { index := 13, instruction := "蛋清中加入 10g 可可粉和 10g 魔芋粉，先用餐刀翻拌，这是由于如果直接用打蛋器搅拌会造成粉末飞溅" },
    { index := 14, instruction := "翻拌手法是" },
    { index := 15, instruction := "翻拌结束后，打蛋器低速搅拌均匀" },
    { index := 16, instruction := "模具铺好烘焙纸，贴合底部与内壁" },
    { index := 17, instruction := "将蛋糕糊倒入模具，然后用餐刀抹平，再然后震荡几下避免大气泡" },
    { index := 18, instruction := "烘烤 25 分钟" },
    { index := 19, instruction := "烤好后，戴好隔热手套取出" },
    { index := 20, instruction := "（可选） 将模具从高处落下，震出其中的热气" },
    { index := 21, instruction := "模具倒扣 10 分钟，使蛋糕冷却" },
    { index := 22, instruction := "脱模，餐刀切块食用" }
  ]
}

theorem recipe_1282bbd3a9c9_ingredients_nonempty :
    recipe_1282bbd3a9c9.ingredients.isEmpty = false := by decide

theorem recipe_1282bbd3a9c9_steps_nonempty :
    recipe_1282bbd3a9c9.steps.isEmpty = false := by decide

theorem recipe_1282bbd3a9c9_step_count :
    recipe_1282bbd3a9c9.steps.length = 22 := by decide

theorem recipe_1282bbd3a9c9_steps_ordered :
    orderedFrom 1 recipe_1282bbd3a9c9.steps = true := by decide

theorem recipe_1282bbd3a9c9_executes_to_terminal :
    executesToTerminal recipe_1282bbd3a9c9 = true := by decide

theorem recipe_1282bbd3a9c9_kernel_certificate :
    kernelCertified recipe_1282bbd3a9c9 = true := by decide

end LeanToCook.SourceCatalog
