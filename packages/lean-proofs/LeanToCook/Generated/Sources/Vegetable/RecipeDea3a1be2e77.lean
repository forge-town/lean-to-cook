/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 椒盐玉米 · dishes/vegetable_dish/椒盐玉米/椒盐玉米.md -/
def recipe_dea3a1be2e77 : Recipe := {
  id := "dea3a1be2e77"
  title := "椒盐玉米"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/椒盐玉米/椒盐玉米.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "玉米粒",
    "椒盐",
    "芝麻粒",
    "油",
    "淀粉",
    "两个塑料簸箕",
    "若干吸油纸"
  ]
  steps := [
    { index := 1, instruction := "玉米粒都是剥好的，直接解冻即可，温水泡 15 分钟或者灶上开水煮 5 分钟。" },
    { index := 2, instruction := "拿出一个簸箕，将其假设为 BoxA，垫上吸油纸，倒进解冻好的玉米粒。" },
    { index := 3, instruction := "shaking shaking shaking! - 直到吸油纸全部变湿为止。" },
    { index := 4, instruction := "拿出第二个簸箕 BoxB，垫上吸油纸，将 BoxA 的玉米粒全部倒入 BoxB 中。" },
    { index := 5, instruction := "shaking shaking shaking! - 直到吸油纸全部变湿为止。" },
    { index := 6, instruction := "重复上述操作多次，直到玉米表面没有明显可见的水滴但保持湿润的状态。" },
    { index := 7, instruction := "倒入大量淀粉，能够完全盖住玉米粒。" },
    { index := 8, instruction := "shaking shaking shaking! - 直到淀粉裹住了玉米粒" },
    { index := 9, instruction := "开灶 - 放锅 - 倒入油 尽量铺满锅底 但不要太多。" },
    { index := 10, instruction := "油热 8 成，倒入裹上了淀粉的玉米粒。" },
    { index := 11, instruction := "中火先煎 30s，不要翻炒，不然淀粉会掉。" },
    { index := 12, instruction := "轻微翻炒 3 分钟即可出锅。" },
    { index := 13, instruction := "最重要的一步：撒上 3g 椒盐，撒上芝麻粒！" },
    { index := 14, instruction := "香喷喷的”椒盐玉米“就做好了" }
  ]
}

theorem recipe_dea3a1be2e77_ingredients_nonempty :
    recipe_dea3a1be2e77.ingredients.isEmpty = false := by decide

theorem recipe_dea3a1be2e77_steps_nonempty :
    recipe_dea3a1be2e77.steps.isEmpty = false := by decide

theorem recipe_dea3a1be2e77_step_count :
    recipe_dea3a1be2e77.steps.length = 14 := by decide

theorem recipe_dea3a1be2e77_steps_ordered :
    orderedFrom 1 recipe_dea3a1be2e77.steps = true := by decide

theorem recipe_dea3a1be2e77_executes_to_terminal :
    executesToTerminal recipe_dea3a1be2e77 = true := by decide

theorem recipe_dea3a1be2e77_kernel_certificate :
    kernelCertified recipe_dea3a1be2e77 = true := by decide

end LeanToCook.SourceCatalog
