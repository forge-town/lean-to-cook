/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 烙饼 · dishes/staple/烙饼/烙饼.md -/
def recipe_f5276d1d6821 : Recipe := {
  id := "f5276d1d6821"
  title := "烙饼"
  category := "staple"
  sourcePath := "dishes/staple/烙饼/烙饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "油",
    "面粉",
    "电饼铛"
  ]
  steps := [
    { index := 1, instruction := "将 400g 面粉倒入盆中，一半用凉水和面，一半用热水和面，搅拌成面絮，用手揉成团。用保鲜膜封起来，醒面 40 分钟" },
    { index := 2, instruction := "离醒面完成时间还有 10 分钟时，请查看小技巧中的油酥做法（热油酥效果更好）" },
    { index := 3, instruction := "醒好的面不用揉，稍微摁一下，用一横刀一竖刀将其分成四份。" },
    { index := 4, instruction := "搓圆，擀开，擀成与电饼铛大小差不多的饼，取 1/4 的油酥，将饼表面涂抹均匀" },
    { index := 5, instruction := "沿饼的半径切开，从外圈将其卷成圆锥形，然后将圆锥尾部捏好，防止油酥外漏。" },
    { index := 6, instruction := "按压面饼圆锥尖的地方，将其压扁，然后再次擀成与电饼铛大小差不多的面饼（厚度约为 3mm）" },
    { index := 7, instruction := "将电饼铛预热，涂上凉油（热锅凉油），将擀好的饼放入电饼铛中，将饼的上方也刷点油，涂抹均匀（锁住水分），盖上盖子" },
    { index := 8, instruction := "大火烙一分钟，打开盖子，将饼翻个面再烙一分钟" },
    { index := 9, instruction := "重复以上动作，完成饼的烙制" }
  ]
}

theorem recipe_f5276d1d6821_ingredients_nonempty :
    recipe_f5276d1d6821.ingredients.isEmpty = false := by decide

theorem recipe_f5276d1d6821_steps_nonempty :
    recipe_f5276d1d6821.steps.isEmpty = false := by decide

theorem recipe_f5276d1d6821_step_count :
    recipe_f5276d1d6821.steps.length = 9 := by decide

theorem recipe_f5276d1d6821_steps_ordered :
    orderedFrom 1 recipe_f5276d1d6821.steps = true := by decide

theorem recipe_f5276d1d6821_executes_to_terminal :
    executesToTerminal recipe_f5276d1d6821 = true := by decide

theorem recipe_f5276d1d6821_kernel_certificate :
    kernelCertified recipe_f5276d1d6821 = true := by decide

end LeanToCook.SourceCatalog
