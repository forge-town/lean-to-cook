/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 啤酒鸭 · dishes/meat_dish/啤酒鸭/啤酒鸭.md -/
def recipe_fce469feac21 : Recipe := {
  id := "fce469feac21"
  title := "啤酒鸭"
  category := "meat"
  sourcePath := "dishes/meat_dish/啤酒鸭/啤酒鸭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸭肉",
    "啤酒",
    "生抽酱油",
    "老抽酱油",
    "姜",
    "蒜",
    "冰糖",
    "干辣椒",
    "料酒",
    "盐",
    "鸡精",
    "丁香",
    "八角",
    "香叶",
    "豆瓣酱"
  ]
  steps := [
    { index := 1, instruction := "把鸭子切成 3 cm 小块，鸭肉冷水下锅，加姜片、料酒，焯一遍水，盛出沥干水分，备用。" },
    { index := 2, instruction := "炒锅烧热，放入约 100ml 食用油，大火待油烧开，鸭肉入锅翻炒至上色。" },
    { index := 3, instruction := "待鸭肉完全变色（肉眼可见泛白），将鸭肉拨到锅的一边，倒入豆瓣酱和糖，小火翻炒出香味和糖色。" },
    { index := 4, instruction := "加入丁香、八角、香叶、干辣椒、生抽、老抽、蒜，翻炒出香味。" },
    { index := 5, instruction := "倒入啤酒，没过鸭肉，加入盐、鸡精，然后中火将鸭子烧 30 分钟（牙口不好的话可以再多烧 5 分钟）。" },
    { index := 6, instruction := "出锅盛盘，上桌食用。" }
  ]
}

theorem recipe_fce469feac21_ingredients_nonempty :
    recipe_fce469feac21.ingredients.isEmpty = false := by decide

theorem recipe_fce469feac21_steps_nonempty :
    recipe_fce469feac21.steps.isEmpty = false := by decide

theorem recipe_fce469feac21_step_count :
    recipe_fce469feac21.steps.length = 6 := by decide

theorem recipe_fce469feac21_steps_ordered :
    orderedFrom 1 recipe_fce469feac21.steps = true := by decide

theorem recipe_fce469feac21_executes_to_terminal :
    executesToTerminal recipe_fce469feac21 = true := by decide

theorem recipe_fce469feac21_kernel_certificate :
    kernelCertified recipe_fce469feac21 = true := by decide

end LeanToCook.SourceCatalog
