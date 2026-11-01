/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 南派红烧肉 · dishes/meat_dish/红烧肉/南派红烧肉.md -/
def recipe_373d56f2f32a : Recipe := {
  id := "373d56f2f32a"
  title := "南派红烧肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/红烧肉/南派红烧肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "注：如果有可能，请尽量把刀磨的锋利一些。",
    "工具：锅（砂锅为宜，铝锅其次，高压锅也可以，最好不要铁锅、铜锅）",
    "主料：五花肉",
    "辅料：油、冰糖、老抽、料酒、香叶、八角、生姜、盐、葱、开水、凉水、蒜、花椒"
  ]
  steps := [
    { index := 1, instruction := "猪五花肉先不切小块，切成能放入锅中的大块（约 5–6cm 宽）即可" },
    { index := 2, instruction := "生姜切片（每片厚度约 3mm ）" },
    { index := 3, instruction := "开水烧开" },
    { index := 4, instruction := "凉水自来水即可" },
    { index := 5, instruction := "小葱小葱白色的部分葱白切成小段（小葱最佳，大葱也可以）" },
    { index := 6, instruction := "蒜中间切开，不要拍扁，否则难以捞出以至最后收汁时影响味道" },
    { index := 7, instruction := "请将辅料分为两个\"预备包\"：" },
    { index := 8, instruction := "凉水锅中放入五花肉大块，加入 20ml 料酒 与 A包（2 片姜、2 段葱段），煮 15 分钟去掉血腥，捞出来后洗干净；" },
    { index := 9, instruction := "将焯过水的五花肉捞出，稍微放凉（不烫手即可），切成边长约 3cm × 3cm × 3cm 的正方体块（焯水后肉质收紧，此时切块比生肉时更容易且成品大小更均匀。3cm 切块最终成品约为 2.5cm，是最适宜入口且容易烧透的尺寸）" },
    { index := 10, instruction := "另起锅炒糖色，注意：在此菜谱中，请采用其中提到的\"操作 2\"来制作，即在糖液起密集小泡时，迅速将 B包（生姜、葱白、蒜、花椒、八角、香叶）倒入锅中爆香。" },
    { index := 11, instruction := "爆出香味后（约 5-10 秒内），先不要加开水，而是立刻将焯过水的五花肉倒入锅中大火翻炒，让肉块均匀裹上糖色并煸炒出油脂。待闻到肉香后，再倒入开水至没过全部肉，盖上锅盖，转中小火炖煮 50 分钟-60 分钟（高压锅则为 40 分钟）；" },
    { index := 12, instruction := "加入 10ml 料酒；" },
    { index := 13, instruction := "盖上锅盖煮至沸腾后，每隔 25 分钟打开盖子将浮在表面的油和沫捞出；" },
    { index := 14, instruction := "当水的高度减至肉最高的高度与锅底高度的 3/5 时，转中火，并捞出除肉和水以外的所有辅料，开始收汁；" },
    { index := 15, instruction := "打开锅盖，待汤汁快没有的时粘稠状出锅（切记不可收干）；" }
  ]
}

theorem recipe_373d56f2f32a_ingredients_nonempty :
    recipe_373d56f2f32a.ingredients.isEmpty = false := by decide

theorem recipe_373d56f2f32a_steps_nonempty :
    recipe_373d56f2f32a.steps.isEmpty = false := by decide

theorem recipe_373d56f2f32a_step_count :
    recipe_373d56f2f32a.steps.length = 15 := by decide

theorem recipe_373d56f2f32a_steps_ordered :
    orderedFrom 1 recipe_373d56f2f32a.steps = true := by decide

theorem recipe_373d56f2f32a_executes_to_terminal :
    executesToTerminal recipe_373d56f2f32a = true := by decide

theorem recipe_373d56f2f32a_kernel_certificate :
    kernelCertified recipe_373d56f2f32a = true := by decide

end LeanToCook.SourceCatalog
