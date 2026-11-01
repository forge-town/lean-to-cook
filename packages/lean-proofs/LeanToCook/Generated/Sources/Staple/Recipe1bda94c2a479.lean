/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 利提巧卡 · dishes/staple/利提巧卡.md -/
def recipe_1bda94c2a479 : Recipe := {
  id := "1bda94c2a479"
  title := "利提巧卡"
  category := "staple"
  sourcePath := "dishes/staple/利提巧卡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "全麦面粉(Atta)",
    "烤鹰嘴豆粉(Sattu)— 可用炒熟的鹰嘴豆磨粉替代",
    "茄子",
    "番茄",
    "土豆",
    "洋葱",
    "大蒜",
    "生姜",
    "青辣椒",
    "柠檬",
    "香菜",
    "芥末油(Mustard Oil)— 可用其他食用油替代",
    "孜然籽",
    "印度黑盐(Kala Namak)— 可用普通盐替代",
    "红辣椒粉",
    "芝麻",
    "酥油(Ghee)",
    "盐",
    "烤箱或明火"
  ]
  steps := [
    { index := 1, instruction := "在碗中混合烤鹰嘴豆粉 120g、切碎的洋葱、青辣椒、生姜" },
    { index := 2, instruction := "加入孜然籽 3g、芝麻 5g、红辣椒粉 3g、印度黑盐 3g、盐 3g" },
    { index := 3, instruction := "加入芥末油 15ml、柠檬汁 10ml、切碎的香菜叶" },
    { index := 4, instruction := "充分混合均匀，馅料应呈松散但可捏合的状态，备用" },
    { index := 5, instruction := "将全麦面粉 200g 放入大碗中" },
    { index := 6, instruction := "逐渐加入温水，边加边揉，揉成光滑柔软的面团" },
    { index := 7, instruction := "面团静置 15 分钟" },
    { index := 8, instruction := "将面团分成 8 个等大的小剂子" },
    { index := 9, instruction := "每个剂子用手压成一个直径约 8cm 的圆形面片（中间稍厚）" },
    { index := 10, instruction := "在面片中央放入约 15g 馅料" },
    { index := 11, instruction := "将面片四周收拢包住馅料，封口处捏紧，搓成圆球" },
    { index := 12, instruction := "烤箱预热至 200°C" },
    { index := 13, instruction := "将利提放在烤盘上，烤 25-30 分钟，期间翻面一次，直至表面金棕色且有裂纹" },
    { index := 14, instruction := "如果使用明火：将利提直接放在炭火或煤气灶小火上烤，不断翻转，直至均匀焦黄" },
    { index := 15, instruction := "烤好后趁热将每个利提表面涂上酥油，使其浸润吸收" },
    { index := 16, instruction := "将茄子、番茄、土豆放在明火上直接烤，或放入 200°C 烤箱烤 20-25 分钟，直至外皮焦黑、内部完全软烂" },
    { index := 17, instruction := "烤好后去皮，将茄子、番茄、土豆分别用叉子或手捣碎" },
    { index := 18, instruction := "将捣碎的蔬菜混合在一起" },
    { index := 19, instruction := "加入切碎的大蒜、青辣椒、盐 4g、芥末油 15ml" },
    { index := 20, instruction := "充分搅拌混合均匀" },
    { index := 21, instruction := "撒上香菜叶装饰" },
    { index := 22, instruction := "将利提摆盘，旁边放上巧卡蔬菜泥" },
    { index := 23, instruction := "趁热食用，用手掰开利提蘸巧卡" }
  ]
}

theorem recipe_1bda94c2a479_ingredients_nonempty :
    recipe_1bda94c2a479.ingredients.isEmpty = false := by decide

theorem recipe_1bda94c2a479_steps_nonempty :
    recipe_1bda94c2a479.steps.isEmpty = false := by decide

theorem recipe_1bda94c2a479_step_count :
    recipe_1bda94c2a479.steps.length = 23 := by decide

theorem recipe_1bda94c2a479_steps_ordered :
    orderedFrom 1 recipe_1bda94c2a479.steps = true := by decide

theorem recipe_1bda94c2a479_executes_to_terminal :
    executesToTerminal recipe_1bda94c2a479 = true := by decide

theorem recipe_1bda94c2a479_kernel_certificate :
    kernelCertified recipe_1bda94c2a479 = true := by decide

end LeanToCook.SourceCatalog
