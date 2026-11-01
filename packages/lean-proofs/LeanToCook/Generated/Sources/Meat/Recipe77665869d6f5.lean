/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 空气炸锅脆皮现腌炸鸡 · dishes/meat_dish/空气炸锅脆皮现腌炸鸡/空气炸锅脆皮现腌炸鸡.md -/
def recipe_77665869d6f5 : Recipe := {
  id := "77665869d6f5"
  title := "空气炸锅脆皮现腌炸鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/空气炸锅脆皮现腌炸鸡/空气炸锅脆皮现腌炸鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "新鲜鸡翅中",
    "生抽",
    "蒜粉",
    "paprika（红甜椒粉）",
    "洋葱粉",
    "黑胡椒粉",
    "中筋面粉",
    "淀粉（玉米淀粉或土豆淀粉均可）",
    "食用油（用于喷涂或刷涂）",
    "空气炸锅",
    "酸奶或牛奶（可选，帮助肉质更滑嫩）",
    "鸡蛋（可选，帮助形成更饱满的外壳）",
    "泡打粉（可选，帮助形成更酥脆的外壳）"
  ]
  steps := [
    { index := 1, instruction := "鸡翅中清洗后擦干水分，每个鸡翅两面各划 2 刀，方便入味。" },
    { index := 2, instruction := "调制腌料：生抽 15ml、蒜粉 8g、红甜椒粉 5g、洋葱粉 3g、黑胡椒粉 3g，牛奶或希腊酸奶 5ml（可选，让鸡肉更滑嫩）搅拌均匀。" },
    { index := 3, instruction := "将腌料和鸡翅中一起放到大 zip 保鲜袋里充分搅拌按摩，在冰箱里静置一晚。" },
    { index := 4, instruction := "裹粉：中筋面粉 60g、淀粉 30g、蒜粉 5g、红甜椒粉 5g、洋葱粉 2g、黑胡椒粉 2g、泡打粉 1g（可选，让外壳更酥脆）搅拌均匀。" },
    { index := 5, instruction := "裹浆（可选）：鸡蛋 1 个，牛奶或水 5ml，充分打散。" },
    { index := 6, instruction := "裹粉：将鸡翅中抖干水分，放入裹粉中轻轻按压，抖落多余的粉，一旁静置 10 分钟。" },
    { index := 7, instruction := "裹浆（可选）：如想要更饱满的外壳，可以再裹一层浆，然后重复裹粉步骤。" },
    { index := 8, instruction := "空气炸锅预热到 180°C，预热 5 分钟。" },
    { index := 9, instruction := "炸篮内刷薄油，鸡皮面朝下，鸡翅上喷或者刷薄油。" },
    { index := 10, instruction := "设定空气炸锅 180°C，先炸 10 分钟。" },
    { index := 11, instruction := "打开炸篮翻面，在鸡翅表面补喷或者刷薄油，再以 180°C 炸 6 分钟。" },
    { index := 12, instruction := "观察鸡皮颜色，并用牙签扎一下最厚的部分，看是否有血水流出。" },
    { index := 13, instruction := "如需要再以 200°C 炸 1-2 分钟补脆上色（可迭代进行，先炸 1 分钟观察再决定是否继续）。" }
  ]
}

theorem recipe_77665869d6f5_ingredients_nonempty :
    recipe_77665869d6f5.ingredients.isEmpty = false := by decide

theorem recipe_77665869d6f5_steps_nonempty :
    recipe_77665869d6f5.steps.isEmpty = false := by decide

theorem recipe_77665869d6f5_step_count :
    recipe_77665869d6f5.steps.length = 13 := by decide

theorem recipe_77665869d6f5_steps_ordered :
    orderedFrom 1 recipe_77665869d6f5.steps = true := by decide

theorem recipe_77665869d6f5_executes_to_terminal :
    executesToTerminal recipe_77665869d6f5 = true := by decide

theorem recipe_77665869d6f5_kernel_certificate :
    kernelCertified recipe_77665869d6f5 = true := by decide

end LeanToCook.SourceCatalog
