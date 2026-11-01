/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 红烧鱼 · dishes/aquatic/红烧鱼.md -/
def recipe_a5ad40355b76 : Recipe := {
  id := "a5ad40355b76"
  title := "红烧鱼"
  category := "aquatic"
  sourcePath := "dishes/aquatic/红烧鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "姜、蒜瓣、干辣椒",
    "油、盐、料酒、醋、酱油、白砂糖",
    "鱼",
    "蚝油",
    "葱",
    "香菜",
    "小米椒",
    "味精（鸡精）"
  ]
  steps := [
    { index := 1, instruction := "姜蒜准备好，切碎" },
    { index := 2, instruction := "干辣椒切碎，和姜蒜一起" },
    { index := 3, instruction := "加入 30-50ml 油，等待锅热..." },
    { index := 4, instruction := "放入擦干水分的鱼（不想被热油溅一身的话），然后晃动锅，用热油煎鱼，注意这过程一定要小火" },
    { index := 5, instruction := "将鱼翻面，重复上面油煎过程" },
    { index := 6, instruction := "放入姜蒜辣椒，翻炒出香味" },
    { index := 7, instruction := "倒入料酒，稍微多一点，此过程注意安全，会起大量油烟" },
    { index := 8, instruction := "倒入醋（喜欢醋可以多放一点）" },
    { index := 9, instruction := "然后放入白砂糖，酱油（老抽)" },
    { index := 10, instruction := "加入冷水，以刚好淹没鱼身为宜，然后调成中火，盖上锅盖，大概 1 分钟后将鱼翻身，继续盖上锅盖" },
    { index := 11, instruction := "3-4 分钟后，加入盐、小米椒、蚝油（味精、鸡精等），然后继续盖上锅盖，后续继续要翻身" },
    { index := 12, instruction := "当锅内汤汁收汁到鱼的脊背线上的鱼鳍下面一点点的时候（或者汤汁不多的时候），转小火，加入香菜，葱花，然后盖上锅盖 20 秒，关火" },
    { index := 13, instruction := "起锅" }
  ]
}

theorem recipe_a5ad40355b76_ingredients_nonempty :
    recipe_a5ad40355b76.ingredients.isEmpty = false := by decide

theorem recipe_a5ad40355b76_steps_nonempty :
    recipe_a5ad40355b76.steps.isEmpty = false := by decide

theorem recipe_a5ad40355b76_step_count :
    recipe_a5ad40355b76.steps.length = 13 := by decide

theorem recipe_a5ad40355b76_steps_ordered :
    orderedFrom 1 recipe_a5ad40355b76.steps = true := by decide

theorem recipe_a5ad40355b76_executes_to_terminal :
    executesToTerminal recipe_a5ad40355b76 = true := by decide

theorem recipe_a5ad40355b76_kernel_certificate :
    kernelCertified recipe_a5ad40355b76 = true := by decide

end LeanToCook.SourceCatalog
