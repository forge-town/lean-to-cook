/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 麻辣减脂荞麦面 · dishes/staple/麻辣减脂荞麦面.md -/
def recipe_163edd1cb5ff : Recipe := {
  id := "163edd1cb5ff"
  title := "麻辣减脂荞麦面"
  category := "staple"
  sourcePath := "dishes/staple/麻辣减脂荞麦面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "调味料：火锅底料、花生酱、全脂牛奶、生抽、辣椒油、醋、花椒油",
    "原料：半干荞麦面、娃娃菜、生菜",
    "洗菜盆、直径 18cm 的小锅"
  ]
  steps := [
    { index := 1, instruction := "娃娃菜、生菜洗好，备用" },
    { index := 2, instruction := "锅内倒入 500ml 水，开大火，将荞麦面和娃娃菜放进去，等待水沸腾" },
    { index := 3, instruction := "水沸腾后，转小火，加入火锅底料、花生酱、牛奶、生抽、辣椒油，水开后煮 5 分钟" },
    { index := 4, instruction := "加入生菜，再煮 2 分钟" },
    { index := 5, instruction := "加入醋、花椒油，关火，直接端着小锅开吃。" }
  ]
}

theorem recipe_163edd1cb5ff_ingredients_nonempty :
    recipe_163edd1cb5ff.ingredients.isEmpty = false := by decide

theorem recipe_163edd1cb5ff_steps_nonempty :
    recipe_163edd1cb5ff.steps.isEmpty = false := by decide

theorem recipe_163edd1cb5ff_step_count :
    recipe_163edd1cb5ff.steps.length = 5 := by decide

theorem recipe_163edd1cb5ff_steps_ordered :
    orderedFrom 1 recipe_163edd1cb5ff.steps = true := by decide

theorem recipe_163edd1cb5ff_executes_to_terminal :
    executesToTerminal recipe_163edd1cb5ff = true := by decide

theorem recipe_163edd1cb5ff_kernel_certificate :
    kernelCertified recipe_163edd1cb5ff = true := by decide

end LeanToCook.SourceCatalog
