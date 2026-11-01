/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 西红柿鸡蛋挂面 · dishes/staple/西红柿鸡蛋挂面/西红柿鸡蛋挂面.md -/
def recipe_49e4e1e85bbf : Recipe := {
  id := "49e4e1e85bbf"
  title := "西红柿鸡蛋挂面"
  category := "staple"
  sourcePath := "dishes/staple/西红柿鸡蛋挂面/西红柿鸡蛋挂面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "挂面或者鲜面条也行",
    "西红柿一个",
    "盐",
    "鸡蛋",
    "葱",
    "酱油、蚝油或者鸡精",
    "白砂糖（中和西红柿的酸味，西红柿如果不酸就不用加）",
    "青椒（非线椒）",
    "香油"
  ]
  steps := [
    { index := 1, instruction := "小葱洗净并切成葱花" },
    { index := 2, instruction := "西红柿切块儿，如果不太会切建议先百度一下" },
    { index := 3, instruction := "青椒切成菱形块" },
    { index := 4, instruction := "生鸡蛋打入一个小碗并打散，如果鸡蛋有点腥味可以加 2g 白醋去腥" },
    { index := 5, instruction := "起锅烧热，倒入 1520g 食用油，鸡蛋炒嫩滑就得多一点油，同时为后面煸炒西红柿留一些底油" },
    { index := 6, instruction := "待油温到七成热时（手掌隔大概 10cm，能感觉到热），倒入蛋液快速划散" },
    { index := 7, instruction := "鸡蛋滑到凝固后，一点不会有蛋液了后倒入小碗备用，此处留一些底油" },
    { index := 8, instruction := "锅中留底油后先加入葱白、蒜末炒香" },
    { index := 9, instruction := "加入西红柿块、青椒，待西红柿炒出一点汁水" },
    { index := 10, instruction := "此时速速加入 5g 酱油和 2g 白砂糖" },
    { index := 11, instruction := "翻炒十几秒后加入一碗清水（刚刚好即将没过西红柿即可）" },
    { index := 12, instruction := "煮沸后加入炒好的鸡蛋，加入蚝油 5g 或者 2g 鸡精用于提鲜" },
    { index := 13, instruction := "中小火收汁，期间要搅拌防止粘锅，收汁到下图后加一点葱花（剩下的葱绿部分）和香油（不加也可以），臊子制作完成" },
    { index := 14, instruction := "可以不用洗锅，直接加清水 500ml" },
    { index := 15, instruction := "煮沸加入挂面，挂面煮软后加入 100ml 清水" },
    { index := 16, instruction := "再次煮沸后，若面条飘起来了，再加入 100ml 清水" },
    { index := 17, instruction := "煮沸后看面条两侧是否呈透明状，透明状则熟了" },
    { index := 18, instruction := "捞面到臊子碗中，拌面即可啦" }
  ]
}

theorem recipe_49e4e1e85bbf_ingredients_nonempty :
    recipe_49e4e1e85bbf.ingredients.isEmpty = false := by decide

theorem recipe_49e4e1e85bbf_steps_nonempty :
    recipe_49e4e1e85bbf.steps.isEmpty = false := by decide

theorem recipe_49e4e1e85bbf_step_count :
    recipe_49e4e1e85bbf.steps.length = 18 := by decide

theorem recipe_49e4e1e85bbf_steps_ordered :
    orderedFrom 1 recipe_49e4e1e85bbf.steps = true := by decide

theorem recipe_49e4e1e85bbf_executes_to_terminal :
    executesToTerminal recipe_49e4e1e85bbf = true := by decide

theorem recipe_49e4e1e85bbf_kernel_certificate :
    kernelCertified recipe_49e4e1e85bbf = true := by decide

end LeanToCook.SourceCatalog
