/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 口水鸡 · dishes/meat_dish/口水鸡/口水鸡.md -/
def recipe_dc93ff485c88 : Recipe := {
  id := "dc93ff485c88"
  title := "口水鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/口水鸡/口水鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "半只鸡",
    "辣椒粉",
    "花椒",
    "花生",
    "葱姜蒜",
    "花椒",
    "白糖",
    "生抽",
    "醋",
    "味精"
  ]
  steps := [
    { index := 1, instruction := "姜切片，1 颗小葱，15 颗花椒备用" },
    { index := 2, instruction := "鸡肉洗干净，放入锅中，清水没过鸡肉，放入姜片、小葱和花椒，开大火烧开。" },
    { index := 3, instruction := "大火烧开后，转中小火 20 分钟关火" },
    { index := 4, instruction := "取出鸡肉，放入冰水中，直至冰凉" },
    { index := 5, instruction := "取出鸡肉，切块摆盘子中，备用" },
    { index := 6, instruction := "小火把锅烧热，导入花生，烘烤至表皮爆裂。（注意随时翻动，不要糊了）" },
    { index := 7, instruction := "一颗葱切成段，蒜拍成末，花椒 15 颗，花生去皮切碎。" },
    { index := 8, instruction := "锅内导入油烧热后，放入葱段，花椒和一半蒜末，炒香" },
    { index := 9, instruction := "炒至油温 8 成热，关火，滤出热油" },
    { index := 10, instruction := "将热油倒入放辣椒粉的碗中，搅拌，并滤出红油" },
    { index := 11, instruction := "红油中放入剩余蒜末、生抽、醋、盐、味精、糖、香油、花椒粉。拌匀放凉" },
    { index := 12, instruction := "在鸡肉上撒上花生碎，把红油淋到切好的鸡肉上，撒上香菜。成盘" }
  ]
}

theorem recipe_dc93ff485c88_ingredients_nonempty :
    recipe_dc93ff485c88.ingredients.isEmpty = false := by decide

theorem recipe_dc93ff485c88_steps_nonempty :
    recipe_dc93ff485c88.steps.isEmpty = false := by decide

theorem recipe_dc93ff485c88_step_count :
    recipe_dc93ff485c88.steps.length = 12 := by decide

theorem recipe_dc93ff485c88_steps_ordered :
    orderedFrom 1 recipe_dc93ff485c88.steps = true := by decide

theorem recipe_dc93ff485c88_executes_to_terminal :
    executesToTerminal recipe_dc93ff485c88 = true := by decide

theorem recipe_dc93ff485c88_kernel_certificate :
    kernelCertified recipe_dc93ff485c88 = true := by decide

end LeanToCook.SourceCatalog
