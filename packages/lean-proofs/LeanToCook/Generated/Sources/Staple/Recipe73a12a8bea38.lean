/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 照烧鸡腿饭 · dishes/staple/照烧鸡腿饭.md -/
def recipe_73a12a8bea38 : Recipe := {
  id := "73a12a8bea38"
  title := "照烧鸡腿饭"
  category := "staple"
  sourcePath := "dishes/staple/照烧鸡腿饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡腿",
    "料酒",
    "生抽",
    "蜂蜜（可选）",
    "黑椒碎",
    "黑椒粉",
    "盐",
    "西兰花（没有就用不辣的青椒代替）",
    "胡萝卜",
    "老抽",
    "大蒜",
    "生姜",
    "食用油",
    "清水",
    "米饭"
  ]
  steps := [
    { index := 1, instruction := "取一只鸡腿，鸡皮朝下放在砧板上" },
    { index := 2, instruction := "用刀尖沿着鸡腿骨头的轮廓轻轻划开，从一端到另一端" },
    { index := 3, instruction := "用手指或刀背慢慢推开鸡肉，让骨头暴露出来。如果遇到筋膜，用刀尖切断" },
    { index := 4, instruction := "当鸡肉完全分离后，握住骨头一端，轻轻扭转并拔出" },
    { index := 5, instruction := "重复上述步骤将所有鸡腿去骨" },
    { index := 6, instruction := "去骨鸡腿加入黑胡椒粉、黑胡椒碎、盐、姜片腌制 5 分钟" },
    { index := 7, instruction := "碗里加入料酒、生抽、蜂蜜、老抽清水拌匀" },
    { index := 8, instruction := "蔬菜焯水 1-2 分钟煮熟捞起" },
    { index := 9, instruction := "热锅放油 15 ml 放入拍碎的大蒜爆香" },
    { index := 10, instruction := "放入鸡腿中小火煎至两面金黄，如果感觉锅中太干，补 5-10 ml 油" },
    { index := 11, instruction := "加入调好的酱汁，盖好盖子中小火（在燃气灶上使用小火）焖 5-10 分钟熟透，酱汁浓稠起泡即可" },
    { index := 12, instruction := "切件，和蔬菜一起摆在饭面，淋入煎鸡腿的酱汁就可以慢慢享用啦" }
  ]
}

theorem recipe_73a12a8bea38_ingredients_nonempty :
    recipe_73a12a8bea38.ingredients.isEmpty = false := by decide

theorem recipe_73a12a8bea38_steps_nonempty :
    recipe_73a12a8bea38.steps.isEmpty = false := by decide

theorem recipe_73a12a8bea38_step_count :
    recipe_73a12a8bea38.steps.length = 12 := by decide

theorem recipe_73a12a8bea38_steps_ordered :
    orderedFrom 1 recipe_73a12a8bea38.steps = true := by decide

theorem recipe_73a12a8bea38_executes_to_terminal :
    executesToTerminal recipe_73a12a8bea38 = true := by decide

theorem recipe_73a12a8bea38_kernel_certificate :
    kernelCertified recipe_73a12a8bea38 = true := by decide

end LeanToCook.SourceCatalog
