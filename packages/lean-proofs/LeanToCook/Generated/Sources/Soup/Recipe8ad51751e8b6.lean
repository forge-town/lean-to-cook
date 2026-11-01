/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 小米粥 · dishes/soup/小米粥.md -/
def recipe_8ad51751e8b6 : Recipe := {
  id := "8ad51751e8b6"
  title := "小米粥"
  category := "soup"
  sourcePath := "dishes/soup/小米粥.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "小米",
    "水（山泉水最佳）"
  ]
  steps := [
    { index := 1, instruction := "小米 100 克，放入碗中，用水轻淘一遍（用手搅拌一下，将水倒掉，只是去掉外面的浮灰，不可搓洗！！！）" },
    { index := 2, instruction := "水烧开，务必烧开！！！" },
    { index := 3, instruction := "水烧开沸腾时，将小米倒入锅内。（很容易被忽视的一个很重要的环节）" },
    { index := 4, instruction := "搅拌使得小米不会粘连锅底，继续用大火熬 6-10 分钟，注意用中间穿插搅拌几次。" },
    { index := 5, instruction := "改中火、文火熬 15-20 分钟，锅盖要错开一条缝，千万不能让小米油溜掉哟，中间继续搅拌几次，不要糊锅底" }
  ]
}

theorem recipe_8ad51751e8b6_ingredients_nonempty :
    recipe_8ad51751e8b6.ingredients.isEmpty = false := by decide

theorem recipe_8ad51751e8b6_steps_nonempty :
    recipe_8ad51751e8b6.steps.isEmpty = false := by decide

theorem recipe_8ad51751e8b6_step_count :
    recipe_8ad51751e8b6.steps.length = 5 := by decide

theorem recipe_8ad51751e8b6_steps_ordered :
    orderedFrom 1 recipe_8ad51751e8b6.steps = true := by decide

theorem recipe_8ad51751e8b6_executes_to_terminal :
    executesToTerminal recipe_8ad51751e8b6 = true := by decide

theorem recipe_8ad51751e8b6_kernel_certificate :
    kernelCertified recipe_8ad51751e8b6 = true := by decide

end LeanToCook.SourceCatalog
