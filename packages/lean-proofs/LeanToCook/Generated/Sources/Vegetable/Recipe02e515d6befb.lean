/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 印度土豆花菜 · dishes/vegetable_dish/印度土豆花菜.md -/
def recipe_02e515d6befb : Recipe := {
  id := "02e515d6befb"
  title := "印度土豆花菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/印度土豆花菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "土豆",
    "花菜（菜花）",
    "洋葱",
    "番茄",
    "生姜",
    "大蒜",
    "青辣椒",
    "香菜",
    "食用油",
    "孜然籽",
    "姜黄粉",
    "红辣椒粉",
    "香菜粉",
    "印度综合香料粉(Garam Masala)",
    "盐",
    "炒锅（带盖）"
  ]
  steps := [
    { index := 1, instruction := "将土豆去皮切成约 2cm 的块状" },
    { index := 2, instruction := "将花菜掰成均匀的小朵，大朵可用刀切小" },
    { index := 3, instruction := "在炒锅中倒入 30ml 食用油，中火加热" },
    { index := 4, instruction := "油热后放入孜然籽 3g，炸至孜然籽变深色且散发香味（约 10 秒，注意不要炸糊）" },
    { index := 5, instruction := "放入切碎的洋葱，翻炒至洋葱变透明微黄（约 3-4 分钟）" },
    { index := 6, instruction := "加入生姜、大蒜和青辣椒，翻炒 1 分钟" },
    { index := 7, instruction := "加入切碎的番茄，翻炒至番茄软烂（约 2-3 分钟）" },
    { index := 8, instruction := "加入姜黄粉 3g、红辣椒粉 3g、香菜粉 5g、盐 5g" },
    { index := 9, instruction := "翻炒 1 分钟，使香料与蔬菜融合" },
    { index := 10, instruction := "放入土豆块，翻炒 2 分钟使土豆表面裹上香料" },
    { index := 11, instruction := "放入花菜朵，轻轻翻拌均匀" },
    { index := 12, instruction := "盖上锅盖，转中小火，焖 12-15 分钟，期间每 3-4 分钟打开翻炒一次防止粘锅" },
    { index := 13, instruction := "当土豆用筷子可轻松戳透、花菜略有焦边时，撒入印度综合香料粉 3g" },
    { index := 14, instruction := "翻炒 1 分钟" },
    { index := 15, instruction := "关火，撒上香菜叶，盛盘" }
  ]
}

theorem recipe_02e515d6befb_ingredients_nonempty :
    recipe_02e515d6befb.ingredients.isEmpty = false := by decide

theorem recipe_02e515d6befb_steps_nonempty :
    recipe_02e515d6befb.steps.isEmpty = false := by decide

theorem recipe_02e515d6befb_step_count :
    recipe_02e515d6befb.steps.length = 15 := by decide

theorem recipe_02e515d6befb_steps_ordered :
    orderedFrom 1 recipe_02e515d6befb.steps = true := by decide

theorem recipe_02e515d6befb_executes_to_terminal :
    executesToTerminal recipe_02e515d6befb = true := by decide

theorem recipe_02e515d6befb_kernel_certificate :
    kernelCertified recipe_02e515d6befb = true := by decide

end LeanToCook.SourceCatalog
