/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 乾隆白菜 · dishes/vegetable_dish/乾隆白菜/乾隆白菜.md -/
def recipe_e9b1f03369e3 : Recipe := {
  id := "e9b1f03369e3"
  title := "乾隆白菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/乾隆白菜/乾隆白菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "大白菜（取黄心嫩叶，冬季黄心白菜最佳）",
    "芝麻酱",
    "陈醋（推荐镇江香醋或山西老陈醋）",
    "白糖",
    "香油",
    "熟白芝麻（可选，用于点缀）"
  ]
  steps := [
    { index := 1, instruction := "大白菜只取内部嫩叶（黄色部分），去除菜帮，用手撕成半个巴掌大的块，不要用刀切（手撕截面粗糙更易挂酱）" },
    { index := 2, instruction := "将撕好的白菜叶冲洗干净，充分控干水分，水分残留会导致酱汁无法挂附" },
    { index := 3, instruction := "碗中加入 30g 芝麻酱，先加入 45ml 陈醋，沿同一方向搅拌，将麻酱慢慢稀释开，直至成细线状滴落为止（切勿来回搅拌，会导致芝麻酱\"走油\"）" },
    { index := 4, instruction := "向麻酱汁中加入 5g 白糖，搅拌均匀；再加入 1g 食盐，搅拌均匀；最后加入 5ml 香油，搅拌均匀（各调料需分次加入并分别搅拌，边加边感受稀稠度）" },
    { index := 5, instruction := "将调好的麻酱汁均匀淋在白菜叶上，用手轻轻抓拌，使每片菜叶都裹上酱汁" },
    { index := 6, instruction := "撒上熟白芝麻，装盘即可食用；若时间充裕，可静置 5 分钟待其入味后再食用" }
  ]
}

theorem recipe_e9b1f03369e3_ingredients_nonempty :
    recipe_e9b1f03369e3.ingredients.isEmpty = false := by decide

theorem recipe_e9b1f03369e3_steps_nonempty :
    recipe_e9b1f03369e3.steps.isEmpty = false := by decide

theorem recipe_e9b1f03369e3_step_count :
    recipe_e9b1f03369e3.steps.length = 6 := by decide

theorem recipe_e9b1f03369e3_steps_ordered :
    orderedFrom 1 recipe_e9b1f03369e3.steps = true := by decide

theorem recipe_e9b1f03369e3_executes_to_terminal :
    executesToTerminal recipe_e9b1f03369e3 = true := by decide

theorem recipe_e9b1f03369e3_kernel_certificate :
    kernelCertified recipe_e9b1f03369e3 = true := by decide

end LeanToCook.SourceCatalog
