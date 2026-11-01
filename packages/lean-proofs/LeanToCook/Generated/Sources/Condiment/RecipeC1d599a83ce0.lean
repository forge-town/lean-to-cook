/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 油泼辣子 · dishes/condiment/油泼辣子/油泼辣子.md -/
def recipe_c1d599a83ce0 : Recipe := {
  id := "c1d599a83ce0"
  title := "油泼辣子"
  category := "condiment"
  sourcePath := "dishes/condiment/油泼辣子/油泼辣子.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "蒜头",
    "干辣椒面",
    "盐",
    "熟白芝麻",
    "小米椒",
    "花生油（可用菜籽油替换）",
    "家庭小陶瓷碗",
    "家庭铁勺子",
    "五香粉 （可选）",
    "草寇（可选）",
    "小葱 （可选）",
    "八角",
    "花椒",
    "香叶",
    "白芷",
    "姜片（可选）",
    "糖",
    "白醋"
  ]
  steps := [
    { index := 1, instruction := "拿出蒜头掰 2 个小蒜头去皮" },
    { index := 2, instruction := "拿出砧板剁碎小蒜头、小米椒" },
    { index := 3, instruction := "拿出碗倒入花生油" },
    { index := 4, instruction := "油热放入其他配料和小葱,等到香料变焦，捞出扔掉" },
    { index := 5, instruction := "拿出铁锅将碗内的油放入加热 2 分钟（菜籽油烧至冒烟）" },
    { index := 6, instruction := "此时是空碗" },
    { index := 7, instruction := "往空碗加入干辣椒面、白芝麻、蒜末、小米椒、盐、五香粉、草寇作为\"调料\"" },
    { index := 8, instruction := "关火将油温冷却至 210 摄氏度" },
    { index := 9, instruction := "将锅内热油倒入碗内并用勺子搅拌即可（可以在 165 摄氏度时加入同样\"调料\"的碗最后进行混合进行增辣）" },
    { index := 10, instruction := "倒入热油稍微搅拌后放入白醋，此时会重新沸腾。继续进行搅拌，白醋增香。" },
    { index := 11, instruction := "油泼辣子冷却到温热放白糖和味精，白糖可以使辣味柔和，不会那么地呛口" }
  ]
}

theorem recipe_c1d599a83ce0_ingredients_nonempty :
    recipe_c1d599a83ce0.ingredients.isEmpty = false := by decide

theorem recipe_c1d599a83ce0_steps_nonempty :
    recipe_c1d599a83ce0.steps.isEmpty = false := by decide

theorem recipe_c1d599a83ce0_step_count :
    recipe_c1d599a83ce0.steps.length = 11 := by decide

theorem recipe_c1d599a83ce0_steps_ordered :
    orderedFrom 1 recipe_c1d599a83ce0.steps = true := by decide

theorem recipe_c1d599a83ce0_executes_to_terminal :
    executesToTerminal recipe_c1d599a83ce0 = true := by decide

theorem recipe_c1d599a83ce0_kernel_certificate :
    kernelCertified recipe_c1d599a83ce0 = true := by decide

end LeanToCook.SourceCatalog
