/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 简易红烧肉 · dishes/meat_dish/红烧肉/简易红烧肉.md -/
def recipe_0eb9f4426ab5 : Recipe := {
  id := "0eb9f4426ab5"
  title := "简易红烧肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/红烧肉/简易红烧肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "注：如果有可能，请尽量把刀磨的锋利一些。",
    "主料：大肉、鸡蛋（可选）、豆皮（可选）",
    "辅料：生姜、冰糖、生抽、老抽、料酒、香叶、八角、盐、水、葱（记得要开水）"
  ]
  steps := [
    { index := 1, instruction := "猪五花肉切大块（约 4.5cm ，冷冻半小时至一小时更好切）" },
    { index := 2, instruction := "豆皮切 2cm 的宽度" },
    { index := 3, instruction := "生姜切片（每片厚度约 3mm ）" },
    { index := 4, instruction := "水烧开" },
    { index := 5, instruction := "鹌鹑蛋煮熟并用叉子/牙签扎孔（尽量多些好入味）" },
    { index := 6, instruction := "大葱大葱白色的部分葱白" },
    { index := 7, instruction := "冷水锅中放入切好的猪五花肉，加入料酒与葱姜，煮 15 分钟去掉血腥" },
    { index := 8, instruction := "锅中放入两片生姜提味" },
    { index := 9, instruction := "开中小火后直接加入五花肉，不需要放入食用油，每块五花肉六个面都煎一下，煎至出油即可" },
    { index := 10, instruction := "将煎出的油倒出备用，并将五花肉推至一边，加入 15g 冰糖，翻炒至冰糖融化；" },
    { index := 11, instruction := "融化后将五花肉与冰糖炒至融合上色，加入" },
    { index := 12, instruction := "加入烧好的开水炖煮 40 分钟（刀工差的同学切的过大请自觉延长炖煮时间），并放入" },
    { index := 13, instruction := "盖上锅盖煮至沸腾后，加入煮好扎好孔的鹌鹑蛋和豆皮，开中小火，等待 40 分钟。（中途可适当翻搅防止粘锅）；" },
    { index := 14, instruction := "打开锅盖，待汤汁快没有的时候开大火收汁（切记不可收干）；" },
    { index := 15, instruction := "加入 2-3g 盐，翻炒一下，就可以出锅了。" }
  ]
}

theorem recipe_0eb9f4426ab5_ingredients_nonempty :
    recipe_0eb9f4426ab5.ingredients.isEmpty = false := by decide

theorem recipe_0eb9f4426ab5_steps_nonempty :
    recipe_0eb9f4426ab5.steps.isEmpty = false := by decide

theorem recipe_0eb9f4426ab5_step_count :
    recipe_0eb9f4426ab5.steps.length = 15 := by decide

theorem recipe_0eb9f4426ab5_steps_ordered :
    orderedFrom 1 recipe_0eb9f4426ab5.steps = true := by decide

theorem recipe_0eb9f4426ab5_executes_to_terminal :
    executesToTerminal recipe_0eb9f4426ab5 = true := by decide

theorem recipe_0eb9f4426ab5_kernel_certificate :
    kernelCertified recipe_0eb9f4426ab5 = true := by decide

end LeanToCook.SourceCatalog
