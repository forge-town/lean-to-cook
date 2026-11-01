/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 奥利奥冰淇淋 · dishes/dessert/奥利奥冰淇淋/奥利奥冰淇淋.md -/
def recipe_12a0f2535a3d : Recipe := {
  id := "12a0f2535a3d"
  title := "奥利奥冰淇淋"
  category := "dessert"
  sourcePath := "dishes/dessert/奥利奥冰淇淋/奥利奥冰淇淋.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "淡奶油（推荐品牌 安佳动物淡奶油）",
    "原味奥利奥",
    "电动打蛋器",
    "一个容量在 600 毫升以上且直径小（PS: 需要注意能放得下电动打蛋仪）深度深的容器（如准备了冰淇淋模具 容器需要有尖嘴方便转移）",
    "小刀（或者可以去除夹心的工具）",
    "冰淇淋模具（可选）"
  ]
  steps := [
    { index := 1, instruction := "将奥利奥拧开后去除利利（夹心），备用" },
    { index := 2, instruction := "用筷子将奥奥剁碎，需要有一半奥奥变成粉状，另一半的奥奥最大长度小于 0.5 厘米，备用（某宝可搜“奥利奥饼干碎”，节省时间精力^-^）" },
    { index := 3, instruction := "将奶油全部倒置于深容器中，并加入准备好的糖" },
    { index := 4, instruction := "开始用电动打蛋器高速挡 搅打至 电动打蛋器提起后下方会出现悬挂住的奶油（ 0.5 厘米 - 1 厘米），而不是全部像液体一样滴下（部分滴下是正常现象）。" },
    { index := 5, instruction := "搅打完成后将奥奥放入奶油中，搅拌均匀直至底部有奥奥。" },
    { index := 6, instruction := "可选：将混合物倒入冰淇淋模具中" },
    { index := 7, instruction := "放置冰箱冷冻室（ -18 度） 4 小时以上可取出" }
  ]
}

theorem recipe_12a0f2535a3d_ingredients_nonempty :
    recipe_12a0f2535a3d.ingredients.isEmpty = false := by decide

theorem recipe_12a0f2535a3d_steps_nonempty :
    recipe_12a0f2535a3d.steps.isEmpty = false := by decide

theorem recipe_12a0f2535a3d_step_count :
    recipe_12a0f2535a3d.steps.length = 7 := by decide

theorem recipe_12a0f2535a3d_steps_ordered :
    orderedFrom 1 recipe_12a0f2535a3d.steps = true := by decide

theorem recipe_12a0f2535a3d_executes_to_terminal :
    executesToTerminal recipe_12a0f2535a3d = true := by decide

theorem recipe_12a0f2535a3d_kernel_certificate :
    kernelCertified recipe_12a0f2535a3d = true := by decide

end LeanToCook.SourceCatalog
