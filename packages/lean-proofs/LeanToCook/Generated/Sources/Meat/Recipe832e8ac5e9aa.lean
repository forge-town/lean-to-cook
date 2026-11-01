/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 黄焖鸡 · dishes/meat_dish/黄焖鸡.md -/
def recipe_832e8ac5e9aa : Recipe := {
  id := "832e8ac5e9aa"
  title := "黄焖鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/黄焖鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡腿",
    "香菇（干香菇最佳）",
    "青椒",
    "生姜片",
    "干辣椒",
    "盐",
    "料酒",
    "白胡椒粉",
    "白糖",
    "酱油",
    "味精",
    "土豆（可选）"
  ]
  steps := [
    { index := 1, instruction := "鸡腿洗净，剁成4cm大小的块" },
    { index := 2, instruction := "生姜切片、干辣椒切成小圈" },
    { index := 3, instruction := "香菇切片，青椒切成细长的马蹄状，若为干香菇，洗净灰尘后泡一晚上并留香菇水备用" },
    { index := 4, instruction := "若有土豆，切为与鸡肉大小类似的滚刀块" },
    { index := 5, instruction := "炒糖色：锅里倒入底油，冷油时放入白糖（有一定难度，新手可跳至鸡肉炒制并使用老抽替代）" },
    { index := 6, instruction := "小火慢慢加热，待油温逐渐升高，白糖开始融化并变成较深的棕色（期间要不断搅拌，防止糊锅）" },
    { index := 7, instruction := "迅速倒入鸡块，转大火，快速翻炒！烹入料酒，继续翻炒片刻" },
    { index := 8, instruction := "将生姜片和干辣椒倒入" },
    { index := 9, instruction := "放入酱油，炒匀" },
    { index := 10, instruction := "倒入香菇水或清水，以能淹住鸡肉为准" },
    { index := 11, instruction := "倒入香菇片，白胡椒粉，盐，土豆" },
    { index := 12, instruction := "翻炒均匀后，盖上锅盖焖煮，转中小火15——20分钟，有条件可以转至砂锅" },
    { index := 13, instruction := "待鸡肉软烂，汤汁浓稠后（汤汁不要收的太干），最后放入青椒" },
    { index := 14, instruction := "放入味精，兜炒均匀后，关火！青椒基本断生即可，不要炒时间久了" }
  ]
}

theorem recipe_832e8ac5e9aa_ingredients_nonempty :
    recipe_832e8ac5e9aa.ingredients.isEmpty = false := by decide

theorem recipe_832e8ac5e9aa_steps_nonempty :
    recipe_832e8ac5e9aa.steps.isEmpty = false := by decide

theorem recipe_832e8ac5e9aa_step_count :
    recipe_832e8ac5e9aa.steps.length = 14 := by decide

theorem recipe_832e8ac5e9aa_steps_ordered :
    orderedFrom 1 recipe_832e8ac5e9aa.steps = true := by decide

theorem recipe_832e8ac5e9aa_executes_to_terminal :
    executesToTerminal recipe_832e8ac5e9aa = true := by decide

theorem recipe_832e8ac5e9aa_kernel_certificate :
    kernelCertified recipe_832e8ac5e9aa = true := by decide

end LeanToCook.SourceCatalog
