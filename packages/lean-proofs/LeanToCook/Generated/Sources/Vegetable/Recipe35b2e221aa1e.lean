/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蒜蓉炒芹菜 · dishes/vegetable_dish/蒜蓉炒芹菜/蒜蓉炒芹菜.md -/
def recipe_35b2e221aa1e : Recipe := {
  id := "35b2e221aa1e"
  title := "蒜蓉炒芹菜"
  category := "vegetable"
  sourcePath := "dishes/vegetable_dish/蒜蓉炒芹菜/蒜蓉炒芹菜.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "芹菜（香芹最佳）",
    "猪油（没有可用食用油替代，但猪油风味更佳）",
    "蒜",
    "盐"
  ]
  steps := [
    { index := 1, instruction := "芹菜摘去大部分叶子，只保留少量嫩叶。如果梗部较粗，纵向剖开一刀使其粗细一致，然后切成不超过 5 cm 的段（约大拇指长度，太长容易卡嗓子）" },
    { index := 2, instruction := "蒜切成蒜末，备用" },
    { index := 3, instruction := "芹菜段入锅前尽可能沥干水分，甩得越干越好" },
    { index := 4, instruction := "炒锅烧热，放入 15 ml 猪油，油热后先撒入 2 g 盐" },
    { index := 5, instruction := "放入蒜末，小火炒 10 秒煸香" },
    { index := 6, instruction := "转大火，倒入芹菜段，快速翻炒 30 秒，立即出锅" },
    { index := 7, instruction := "出锅标准：芹菜看起来半生不熟、颜色翠绿、没有炒软塌，这时的口感最脆" }
  ]
}

theorem recipe_35b2e221aa1e_ingredients_nonempty :
    recipe_35b2e221aa1e.ingredients.isEmpty = false := by decide

theorem recipe_35b2e221aa1e_steps_nonempty :
    recipe_35b2e221aa1e.steps.isEmpty = false := by decide

theorem recipe_35b2e221aa1e_step_count :
    recipe_35b2e221aa1e.steps.length = 7 := by decide

theorem recipe_35b2e221aa1e_steps_ordered :
    orderedFrom 1 recipe_35b2e221aa1e.steps = true := by decide

theorem recipe_35b2e221aa1e_executes_to_terminal :
    executesToTerminal recipe_35b2e221aa1e = true := by decide

theorem recipe_35b2e221aa1e_kernel_certificate :
    kernelCertified recipe_35b2e221aa1e = true := by decide

end LeanToCook.SourceCatalog
