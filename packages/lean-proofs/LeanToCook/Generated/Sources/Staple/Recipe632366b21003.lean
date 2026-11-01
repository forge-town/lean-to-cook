/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 日式肥牛丼饭 · dishes/staple/日式肥牛丼饭/日式肥牛丼饭.md -/
def recipe_632366b21003 : Recipe := {
  id := "632366b21003"
  title := "日式肥牛丼饭"
  category := "staple"
  sourcePath := "dishes/staple/日式肥牛丼饭/日式肥牛丼饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "洋葱（务必选用外皮为白黄色的洋葱，不要用紫色的洋葱）",
    "肥牛（火锅肥牛即可，也可选用原切肥牛片）",
    "葱（也可选用切好的葱段）",
    "白芝麻",
    "味淋（一种常用日式调料，可在各大电商平台购买，也可用料酒代替）",
    "温泉蛋",
    "出汁（使用柴鱼干和昆布熬制的汤汁，可以用于提鲜）"
  ]
  steps := [
    { index := 1, instruction := "洋葱剥去外层去芯，切成月牙状" },
    { index := 2, instruction := "葱洗净切成 0.5cm 的小段" },
    { index := 3, instruction := "热锅直接放入白芝麻，前后晃动锅体使芝麻均匀受热至略呈金黄色" },
    { index := 4, instruction := "肥牛焯水 1 分钟后捞出" },
    { index := 5, instruction := "将 40g 味淋（或 30g 料酒），30g 酱油，20g 耗油，5g 糖，5g 老抽（可选，用于调色），在碗中搅拌混合成调料（该步骤可直接将碗放在电子秤上进行）" },
    { index := 6, instruction := "热油锅放入洋葱，快速翻炒至洋葱变透明状" },
    { index := 7, instruction := "关小火，加入 250g 水（或出汁），开回大火加热等待 3 分钟" },
    { index := 8, instruction := "加入牛肉和调料" },
    { index := 9, instruction := "不断翻动所有食材 10 分钟，防止食材粘锅" },
    { index := 10, instruction := "关火" },
    { index := 11, instruction := "盛装肥牛丼至米饭上（注意要把汁水淋一些在饭上）" },
    { index := 12, instruction := "撒上葱花和白芝麻，制作完成。" },
    { index := 13, instruction := "微波炉：单人份高火 2-3 分钟" },
    { index := 14, instruction := "锅：需额外加 50ml 水，加热时需不断翻动" }
  ]
}

theorem recipe_632366b21003_ingredients_nonempty :
    recipe_632366b21003.ingredients.isEmpty = false := by decide

theorem recipe_632366b21003_steps_nonempty :
    recipe_632366b21003.steps.isEmpty = false := by decide

theorem recipe_632366b21003_step_count :
    recipe_632366b21003.steps.length = 14 := by decide

theorem recipe_632366b21003_steps_ordered :
    orderedFrom 1 recipe_632366b21003.steps = true := by decide

theorem recipe_632366b21003_executes_to_terminal :
    executesToTerminal recipe_632366b21003 = true := by decide

theorem recipe_632366b21003_kernel_certificate :
    kernelCertified recipe_632366b21003 = true := by decide

end LeanToCook.SourceCatalog
