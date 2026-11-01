/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 青椒土豆炒肉 · dishes/meat_dish/青椒土豆炒肉/青椒土豆炒肉.md -/
def recipe_bcbc233bc07c : Recipe := {
  id := "bcbc233bc07c"
  title := "青椒土豆炒肉"
  category := "meat"
  sourcePath := "dishes/meat_dish/青椒土豆炒肉/青椒土豆炒肉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "青椒",
    "土豆",
    "猪肉（五花肉）",
    "葱",
    "姜",
    "蒜",
    "盐",
    "酱油",
    "土豆淀粉"
  ]
  steps := [
    { index := 1, instruction := "青椒去除根蒂切小块，土豆去皮切 2mm 薄片，猪肉切 4mm 薄片，葱横纵切 3mm 小段，姜蒜去皮拍散剁碎末；土豆淀粉加入约 15g 水搅拌均匀至水淀粉。" },
    { index := 2, instruction := "起锅烧油，加热至 7 成热放入猪肉片，缓缓翻滚炒至去肉红色，加入约 3ml 酱油，翻炒肉片均匀上色，放入约 2g 盐。" },
    { index := 3, instruction := "转 5 成油温，加入葱姜蒜炒 5 秒，然后加入土豆片，转 7 成油温均匀翻炒，加入约 5ml 酱油和 2g 盐，炒至土豆断生，表面轻微焦黄。" },
    { index := 4, instruction := "转 8 成油温加入青椒，大火煸炒出锅气（有白烟冒出），反复均匀翻炒 1 分钟上色，最后在锅周围倒入水淀粉转 4 成火勾芡。" },
    { index := 5, instruction := "在外观呈粘稠状态后关火，盛盘" }
  ]
}

theorem recipe_bcbc233bc07c_ingredients_nonempty :
    recipe_bcbc233bc07c.ingredients.isEmpty = false := by decide

theorem recipe_bcbc233bc07c_steps_nonempty :
    recipe_bcbc233bc07c.steps.isEmpty = false := by decide

theorem recipe_bcbc233bc07c_step_count :
    recipe_bcbc233bc07c.steps.length = 5 := by decide

theorem recipe_bcbc233bc07c_steps_ordered :
    orderedFrom 1 recipe_bcbc233bc07c.steps = true := by decide

theorem recipe_bcbc233bc07c_executes_to_terminal :
    executesToTerminal recipe_bcbc233bc07c = true := by decide

theorem recipe_bcbc233bc07c_kernel_certificate :
    kernelCertified recipe_bcbc233bc07c = true := by decide

end LeanToCook.SourceCatalog
