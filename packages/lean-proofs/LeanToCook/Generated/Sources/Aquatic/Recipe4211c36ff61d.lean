/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鳊鱼炖豆腐 · dishes/aquatic/鳊鱼炖豆腐/鳊鱼炖豆腐.md -/
def recipe_4211c36ff61d : Recipe := {
  id := "4211c36ff61d"
  title := "鳊鱼炖豆腐"
  category := "aquatic"
  sourcePath := "dishes/aquatic/鳊鱼炖豆腐/鳊鱼炖豆腐.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鳊鱼（鱼可以让摊主帮忙处理好）",
    "老豆腐",
    "姜",
    "葱",
    "蒜",
    "老抽",
    "桂皮（可选）",
    "冰糖",
    "干辣椒（不吃辣可以不放）",
    "料酒",
    "生抽",
    "盐",
    "八角（可选）",
    "香叶（可选）",
    "热水"
  ]
  steps := [
    { index := 1, instruction := "鳊鱼改刀，放上姜片和料酒腌制 5-10 分钟" },
    { index := 2, instruction := "老豆腐切块后放入水中备用" },
    { index := 3, instruction := "锅中加油，可以放点盐在锅里，防止煎鱼的时候粘锅，把腌制的鱼用厨房纸擦干水分，把鱼放到锅中，两面都煎一下" },
    { index := 4, instruction := "等两面都煎好时，把鱼推向锅边一点，留点空间放入葱姜蒜，干辣椒，香叶，八角炒出味道" },
    { index := 5, instruction := "炒出佐料香味后，加入料酒，生抽，老抽，冰糖，桂皮，倒入热水，水量和鱼平齐或者少点" },
    { index := 6, instruction := "大火烧开后，放入老豆腐，豆腐贴在锅边，加入食盐，转小火" },
    { index := 7, instruction := "小火烧 10-15 分钟，然后大火收点汁，即可出锅" }
  ]
}

theorem recipe_4211c36ff61d_ingredients_nonempty :
    recipe_4211c36ff61d.ingredients.isEmpty = false := by decide

theorem recipe_4211c36ff61d_steps_nonempty :
    recipe_4211c36ff61d.steps.isEmpty = false := by decide

theorem recipe_4211c36ff61d_step_count :
    recipe_4211c36ff61d.steps.length = 7 := by decide

theorem recipe_4211c36ff61d_steps_ordered :
    orderedFrom 1 recipe_4211c36ff61d.steps = true := by decide

theorem recipe_4211c36ff61d_executes_to_terminal :
    executesToTerminal recipe_4211c36ff61d = true := by decide

theorem recipe_4211c36ff61d_kernel_certificate :
    kernelCertified recipe_4211c36ff61d = true := by decide

end LeanToCook.SourceCatalog
