/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 葱烧鸡腿 · dishes/meat_dish/葱烧鸡腿.md -/
def recipe_aed436213776 : Recipe := {
  id := "aed436213776"
  title := "葱烧鸡腿"
  category := "meat"
  sourcePath := "dishes/meat_dish/葱烧鸡腿.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡腿 2 个（约 500g）",
    "大葱 1 根",
    "小葱 3-4 根",
    "生抽（推荐海天金标）",
    "老抽（上色用，可选）",
    "蚝油（可选）",
    "白砂糖",
    "料酒或花雕酒",
    "盐",
    "白胡椒粉",
    "食用油",
    "生姜 3-4 片（可选，主要用于去腥提香）",
    "花椒 10 粒（约 1g，可选，提麻香）"
  ]
  steps := [
    { index := 1, instruction := "鸡腿去骨：用剪刀从鸡腿大的那头伸进去，贴着骨头把肉剪开，再沿骨剪两下把骨肉分离，最后把骨头整根抽出。比用刀去骨更安全。" },
    { index := 2, instruction := "去骨后的鸡腿肉切成 2-3cm 的丁。" },
    { index := 3, instruction := "大葱切厚片（约 0.5cm 厚），小葱切 1cm 长的小段。" },
    { index := 4, instruction := "鸡腿丁加入 10ml 料酒、5ml 生抽、2g 盐、1g 白胡椒粉抓匀，腌制 10 分钟。" },
    { index := 5, instruction := "取一个小碗调好料汁：10ml 生抽 + 5ml 老抽 + 10ml 蚝油 + 5g 糖，搅匀备用。" },
    { index := 6, instruction := "热锅，锅内放入 15-20ml 食用油。" },
    { index := 7, instruction := "放入姜片和花椒，保持小火炸到姜片微微焦黄、花椒颜色变深。" },
    { index := 8, instruction := "用漏勺把姜片和花椒捞出丢弃，留底油。" },
    { index := 9, instruction := "保持中大火，将腌好的鸡腿丁平铺下锅，不要急着翻动。" },
    { index := 10, instruction := "等待 2-3 分钟让鸡腿丁底部煎出焦壳，再翻炒到所有面都变色、鸡肉完全断生。" },
    { index := 11, instruction := "下入大葱片，保持中大火翻炒 1 分钟炒出葱香。" },
    { index := 12, instruction := "倒入调好的料汁，翻炒均匀后盖上锅盖。" },
    { index := 13, instruction := "等待 2 分钟让料汁和葱香完全融合到鸡肉里。" },
    { index := 14, instruction := "开盖，下入小葱段和 2g 熟白芝麻（可选），翻炒 5-10 秒即可关火出锅。" }
  ]
}

theorem recipe_aed436213776_ingredients_nonempty :
    recipe_aed436213776.ingredients.isEmpty = false := by decide

theorem recipe_aed436213776_steps_nonempty :
    recipe_aed436213776.steps.isEmpty = false := by decide

theorem recipe_aed436213776_step_count :
    recipe_aed436213776.steps.length = 14 := by decide

theorem recipe_aed436213776_steps_ordered :
    orderedFrom 1 recipe_aed436213776.steps = true := by decide

theorem recipe_aed436213776_executes_to_terminal :
    executesToTerminal recipe_aed436213776 = true := by decide

theorem recipe_aed436213776_kernel_certificate :
    kernelCertified recipe_aed436213776 = true := by decide

end LeanToCook.SourceCatalog
