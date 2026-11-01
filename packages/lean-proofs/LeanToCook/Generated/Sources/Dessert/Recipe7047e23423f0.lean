/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 草莓冰淇淋 · dishes/dessert/草莓冰淇淋/草莓冰淇淋.md -/
def recipe_7047e23423f0 : Recipe := {
  id := "7047e23423f0"
  title := "草莓冰淇淋"
  category := "dessert"
  sourcePath := "dishes/dessert/草莓冰淇淋/草莓冰淇淋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "加糖炼乳",
    "草莓",
    "重奶油",
    "香草精",
    "冰淇淋模具（可选）"
  ]
  steps := [
    { index := 1, instruction := "先做草莓糖浆。把草莓洗干净，去掉顶部叶子。将草莓切成 5mm 的小块。保留一半切碎的草莓，稍后折叠成冰淇淋。" },
    { index := 2, instruction := "将另一半切碎的草莓和糖一起放入酱汁锅中。用中火搅拌和烹饪，直到草莓释放液体并在锅中形成糖浆。" },
    { index := 3, instruction := "让草莓在糖浆中加热，不时搅拌，直到它们分解并变形，糖浆稍微变稠。" },
    { index := 4, instruction := "当糖浆保持分开 3秒钟 时，就已经准备好了。把糖浆从火上移开，加入香草和盐搅拌。将草莓糖浆放在一边冷却。" },
    { index := 5, instruction := "当糖浆冷却时，准备冰淇淋基料。在碗中加入甜炼乳、浓奶油、香草精和盐。使用手动搅拌器搅打混合物，直到它变得轻盈蓬松，并形成柔软的尖峰。" },
    { index := 6, instruction := "将保留的切碎的新鲜草莓折叠到冰淇淋底座中。将生过的冰淇淋底座转移到冷冻安全容器中。将冷却的草莓糖浆淋在冰淇淋上，然后轻轻地将其旋入混合物中。" },
    { index := 7, instruction := "盖上冰淇淋并冷冻 八小时 ，然后舀取和食用。" }
  ]
}

theorem recipe_7047e23423f0_ingredients_nonempty :
    recipe_7047e23423f0.ingredients.isEmpty = false := by decide

theorem recipe_7047e23423f0_steps_nonempty :
    recipe_7047e23423f0.steps.isEmpty = false := by decide

theorem recipe_7047e23423f0_step_count :
    recipe_7047e23423f0.steps.length = 7 := by decide

theorem recipe_7047e23423f0_steps_ordered :
    orderedFrom 1 recipe_7047e23423f0.steps = true := by decide

theorem recipe_7047e23423f0_executes_to_terminal :
    executesToTerminal recipe_7047e23423f0 = true := by decide

theorem recipe_7047e23423f0_kernel_certificate :
    kernelCertified recipe_7047e23423f0 = true := by decide

end LeanToCook.SourceCatalog
