/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 鱼香肉丝 · dishes/meat_dish/鱼香肉丝.md -/
def recipe_5f3a3719b0e0 : Recipe := {
  id := "5f3a3719b0e0"
  title := "鱼香肉丝"
  category := "meat"
  sourcePath := "dishes/meat_dish/鱼香肉丝.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "里脊肉 200g",
    "胡萝卜 100g",
    "青椒 100g",
    "木耳（干） 5g",
    "生抽 10ml",
    "料酒 5ml",
    "蛋清 1 个",
    "淀粉 10g",
    "醋 15ml",
    "白糖 10g",
    "盐 5g",
    "姜 20g",
    "葱 20g",
    "蒜 2 瓣",
    "豆瓣酱 15g"
  ]
  steps := [
    { index := 1, instruction := "制作腌料：将下列原料混合：" },
    { index := 2, instruction := "制作香汁：将下列原料混合：" },
    { index := 3, instruction := "用腌料腌制里脊肉 15-30 分钟。注意将肉抓匀。" },
    { index := 4, instruction := "干木耳泡 4 个小时，洗净，切成小块。" },
    { index := 5, instruction := "青椒洗净，去蒂，切成丝。" },
    { index := 6, instruction := "胡萝卜洗净，切成丝，将胡萝卜丝焯水。" },
    { index := 7, instruction := "姜、蒜切沫。" },
    { index := 8, instruction := "葱切成 5mm 的小段。" },
    { index := 9, instruction := "将锅烧热，加入 15ml 油。" },
    { index := 10, instruction := "向锅内倒入准备好的腌肉，快速滑散至变白，盛出备用。" },
    { index := 11, instruction := "将锅烧热，加入 5ml 油。" },
    { index := 12, instruction := "倒入全部葱、姜、蒜、豆瓣酱。" },
    { index := 13, instruction := "倒入全部胡萝卜，翻炒 20s 后，放入青椒和木耳，翻炒 2 分钟。" },
    { index := 14, instruction := "倒入炒过的肉。快速翻炒均匀。注意不要炒超过 20 秒。" },
    { index := 15, instruction := "倒入香汁。快速翻炒均匀。注意不要炒超过 15 秒。" },
    { index := 16, instruction := "关火，盛盘。" }
  ]
}

theorem recipe_5f3a3719b0e0_ingredients_nonempty :
    recipe_5f3a3719b0e0.ingredients.isEmpty = false := by decide

theorem recipe_5f3a3719b0e0_steps_nonempty :
    recipe_5f3a3719b0e0.steps.isEmpty = false := by decide

theorem recipe_5f3a3719b0e0_step_count :
    recipe_5f3a3719b0e0.steps.length = 16 := by decide

theorem recipe_5f3a3719b0e0_steps_ordered :
    orderedFrom 1 recipe_5f3a3719b0e0.steps = true := by decide

theorem recipe_5f3a3719b0e0_executes_to_terminal :
    executesToTerminal recipe_5f3a3719b0e0 = true := by decide

theorem recipe_5f3a3719b0e0_kernel_certificate :
    kernelCertified recipe_5f3a3719b0e0 = true := by decide

end LeanToCook.SourceCatalog
