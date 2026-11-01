/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 生汆丸子汤 · dishes/soup/生汆丸子汤.md -/
def recipe_0840396cb272 : Recipe := {
  id := "0840396cb272"
  title := "生汆丸子汤"
  category := "soup"
  sourcePath := "dishes/soup/生汆丸子汤.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "前腿肉",
    "盐",
    "胡椒粉",
    "葱姜花椒水",
    "一个鸡蛋的鸡蛋清",
    "土豆淀粉",
    "熟豆油",
    "木耳",
    "黄花",
    "小香葱",
    "泡好的粉丝（放碗底）",
    "盐",
    "鸡粉",
    "胡椒粉",
    "香油",
    "香菜"
  ]
  steps := [
    { index := 1, instruction := "肉改刀切开，肥瘦三七分" },
    { index := 2, instruction := "上刀剁一剁，用刀背砸一砸，把肉筋打开打松疏" },
    { index := 3, instruction := "剁一剁，砸一砸，剁成肉末，要想好吃得自己剁，机器打的太黏糊了" },
    { index := 4, instruction := "每斤肉，6 克盐，1 克胡椒粉" },
    { index := 5, instruction := "上手抓匀" },
    { index := 6, instruction := "葱姜花椒水分次加，边加边搅，用手揉匀，让肉吸饱水。每斤肉末 80 克葱姜花椒水" },
    { index := 7, instruction := "放入鸡蛋清，继续顺着一个方向搅" },
    { index := 8, instruction := "加入 40 克土豆淀粉，搅匀" },
    { index := 9, instruction := "加入熟豆油，这是为了保持其嫩滑弹的状态" },
    { index := 10, instruction := "起锅烧水，烧开，改小火，似开非开的样子" },
    { index := 11, instruction := "上手，挤丸子，" },
    { index := 12, instruction := "全部漂起来，用小火煮 1 分钟" },
    { index := 13, instruction := "粉丝放碗底" },
    { index := 14, instruction := "加木耳，黄花，小香葱并用盐、胡椒粉、鸡粉打底调味" },
    { index := 15, instruction := "连汤带丸子冲如碗中" },
    { index := 16, instruction := "淋 3-5 滴香油" },
    { index := 17, instruction := "加一小颗香菜" }
  ]
}

theorem recipe_0840396cb272_ingredients_nonempty :
    recipe_0840396cb272.ingredients.isEmpty = false := by decide

theorem recipe_0840396cb272_steps_nonempty :
    recipe_0840396cb272.steps.isEmpty = false := by decide

theorem recipe_0840396cb272_step_count :
    recipe_0840396cb272.steps.length = 17 := by decide

theorem recipe_0840396cb272_steps_ordered :
    orderedFrom 1 recipe_0840396cb272.steps = true := by decide

theorem recipe_0840396cb272_executes_to_terminal :
    executesToTerminal recipe_0840396cb272 = true := by decide

theorem recipe_0840396cb272_kernel_certificate :
    kernelCertified recipe_0840396cb272 = true := by decide

end LeanToCook.SourceCatalog
