/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 蛋炒饭 · dishes/staple/蛋炒饭.md -/
def recipe_0e9866e5643e : Recipe := {
  id := "0e9866e5643e"
  title := "蛋炒饭"
  category := "staple"
  sourcePath := "dishes/staple/蛋炒饭.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "冷饭",
    "鸡蛋",
    "火腿",
    "黄瓜",
    "胡萝卜",
    "油",
    "盐",
    "胡椒粉",
    "生抽",
    "香葱",
    "灯影牛肉丝/午餐肉/腊肠/卤肉...等熟肉（备选）"
  ]
  steps := [
    { index := 1, instruction := "米饭提前用铲子铲成小块" },
    { index := 2, instruction := "火腿肠、胡萝卜、黄瓜等根据需求切片或者块状" },
    { index := 3, instruction := "如果家里有熟肉 准备好味道更佳" },
    { index := 4, instruction := "将蛋白，蛋黄分开，分别打入一个大碗里，各自搅匀。注意，不要在这一步加盐。" },
    { index := 5, instruction := "大火热锅，待锅里冒烟放入食用油，放入蛋白，待主体凝固后盛出备用。" },
    { index := 6, instruction := "如果油够，则直接放入蛋黄，如果油不够则放入食用油并等其升温到大火热锅" },
    { index := 7, instruction := "待主体凝固后，将火调至中小火，倒入火腿肠、熟肉，胡萝卜、黄瓜等备料、翻炒 10 秒钟（到爆香）" },
    { index := 8, instruction := "重新倒入蛋白，翻炒 5s 钟，迅速倒入米饭大火翻炒，为的就是每一粒饭都裹上鸡蛋。" },
    { index := 9, instruction := "翻炒过程中将米饭的块状捣碎、这一步过程会比较长、待米饭全部捣碎再翻炒均匀即可" },
    { index := 10, instruction := "调至小火、加盐、胡椒粉、生抽" },
    { index := 11, instruction := "进一步翻炒均匀，能看到一些米饭在锅里有“跳起来”的时候其实就已经差不多了" },
    { index := 12, instruction := "最后倒入香葱再翻炒 10s" },
    { index := 13, instruction := "关火、盛入碗中" }
  ]
}

theorem recipe_0e9866e5643e_ingredients_nonempty :
    recipe_0e9866e5643e.ingredients.isEmpty = false := by decide

theorem recipe_0e9866e5643e_steps_nonempty :
    recipe_0e9866e5643e.steps.isEmpty = false := by decide

theorem recipe_0e9866e5643e_step_count :
    recipe_0e9866e5643e.steps.length = 13 := by decide

theorem recipe_0e9866e5643e_steps_ordered :
    orderedFrom 1 recipe_0e9866e5643e.steps = true := by decide

theorem recipe_0e9866e5643e_executes_to_terminal :
    executesToTerminal recipe_0e9866e5643e = true := by decide

theorem recipe_0e9866e5643e_kernel_certificate :
    kernelCertified recipe_0e9866e5643e = true := by decide

end LeanToCook.SourceCatalog
