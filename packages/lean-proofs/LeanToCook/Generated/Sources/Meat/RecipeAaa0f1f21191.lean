/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 酱牛肉 · dishes/meat_dish/酱牛肉/酱牛肉.md -/
def recipe_aaa0f1f21191 : Recipe := {
  id := "aaa0f1f21191"
  title := "酱牛肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/酱牛肉/酱牛肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "牛腱子肉",
    "香叶",
    "姜",
    "葱",
    "老抽",
    "桂皮",
    "冰糖",
    "花椒",
    "料酒",
    "生抽",
    "盐",
    "八角",
    "黄豆酱"
  ]
  steps := [
    { index := 1, instruction := "牛腱子肉清洗干净，用清水浸泡 1 小时，去除血水" },
    { index := 2, instruction := "用牙签或者叉子在牛腱子肉表面扎孔，加料酒、花椒、姜片后，用保鲜膜紧密包裹容器，腌制 4-6 小时" },
    { index := 3, instruction := "牛腱子肉切成 8cm，不超过 10cm 的肉块" },
    { index := 4, instruction := "牛腱子肉放入锅中，加入冷水至水面没过牛肉，开锅至水沸腾开始计时，同时捞出浮沫。3 分钟后停火，捞出牛肉，用温水洗净" },
    { index := 5, instruction := "将洗净后的牛腱子肉放入砂锅或炖锅，加水没过牛腱子肉，开大火，放入除盐之外其他未使用的配料" },
    { index := 6, instruction := "水开之后，大火转为小火，持续加热 90 分钟，加盐" },
    { index := 7, instruction := "加盐后，继续小火 90 分钟（注：每 30 分钟确认水位线，要求至少达到牛肉面高度的 80%）" },
    { index := 8, instruction := "加热 180 分钟后，捞出牛腱子肉，捞出牛腱子肉，用保鲜膜紧密包裹，放入冰箱冷藏数小时" },
    { index := 9, instruction := "取出后沿牛肉纹路切片，上桌食用，其他牛腱子肉建议不切片冷藏" }
  ]
}

theorem recipe_aaa0f1f21191_ingredients_nonempty :
    recipe_aaa0f1f21191.ingredients.isEmpty = false := by decide

theorem recipe_aaa0f1f21191_steps_nonempty :
    recipe_aaa0f1f21191.steps.isEmpty = false := by decide

theorem recipe_aaa0f1f21191_step_count :
    recipe_aaa0f1f21191.steps.length = 9 := by decide

theorem recipe_aaa0f1f21191_steps_ordered :
    orderedFrom 1 recipe_aaa0f1f21191.steps = true := by decide

theorem recipe_aaa0f1f21191_executes_to_terminal :
    executesToTerminal recipe_aaa0f1f21191 = true := by decide

theorem recipe_aaa0f1f21191_kernel_certificate :
    kernelCertified recipe_aaa0f1f21191 = true := by decide

end LeanToCook.SourceCatalog
