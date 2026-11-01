/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蛋包饭 · dishes/staple/蛋包饭.md -/
def recipe_d36c1927c74c : Recipe := {
  id := "d36c1927c74c"
  title := "蛋包饭"
  category := "staple"
  sourcePath := "dishes/staple/蛋包饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡蛋（建议使用土鸡蛋，口感更香）",
    "洋葱",
    "胡萝卜",
    "玉米粒",
    "青豆（可选）",
    "火腿肠或鸡胸肉",
    "米饭",
    "番茄酱",
    "食用油（建议使用植物油）",
    "牛奶（可选，让蛋皮更嫩）"
  ]
  steps := [
    { index := 1, instruction := "洋葱、胡萝卜、火腿肠或鸡胸肉切成小丁，备用" },
    { index := 2, instruction := "热锅，锅中倒入 10ml 食用油，等待 10 秒加热" },
    { index := 3, instruction := "先放入洋葱丁翻炒 1 分钟，出香味后加入胡萝卜、玉米粒、青豆继续翻炒 2 分钟" },
    { index := 4, instruction := "加入火腿肠或鸡胸肉丁，炒至变色" },
    { index := 5, instruction := "加入米饭炒散后，加入番茄酱 20ml，翻炒均匀，炒饭完成，盛出备用" },
    { index := 6, instruction := "鸡蛋打散，加入 10ml 牛奶搅匀" },
    { index := 7, instruction := "锅中放入 5ml 食用油，倒入蛋液，轻晃锅底让蛋液均匀铺满锅面" },
    { index := 8, instruction := "用小火加热，待蛋液表面半熟状态时，将炒饭放入蛋液中央" },
    { index := 9, instruction := "用铲子将蛋皮折叠包住米饭，形成椭圆形状" },
    { index := 10, instruction := "用锅铲轻轻推至盘中，整理外形，可在表面挤上少量番茄酱装饰" }
  ]
}

theorem recipe_d36c1927c74c_ingredients_nonempty :
    recipe_d36c1927c74c.ingredients.isEmpty = false := by decide

theorem recipe_d36c1927c74c_steps_nonempty :
    recipe_d36c1927c74c.steps.isEmpty = false := by decide

theorem recipe_d36c1927c74c_step_count :
    recipe_d36c1927c74c.steps.length = 10 := by decide

theorem recipe_d36c1927c74c_steps_ordered :
    orderedFrom 1 recipe_d36c1927c74c.steps = true := by decide

theorem recipe_d36c1927c74c_executes_to_terminal :
    executesToTerminal recipe_d36c1927c74c = true := by decide

theorem recipe_d36c1927c74c_kernel_certificate :
    kernelCertified recipe_d36c1927c74c = true := by decide

end LeanToCook.SourceCatalog
