/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 速冻水饺 · dishes/semi-finished/速冻水饺.md -/
def recipe_6c8fa75dcb07 : Recipe := {
  id := "6c8fa75dcb07"
  title := "速冻水饺"
  category := "semiFinished"
  sourcePath := "dishes/semi-finished/速冻水饺.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "未过期的一袋速冻水饺"
  ]
  steps := [
    { index := 1, instruction := "中火，将水倒入锅中，静候水煮沸。" },
    { index := 2, instruction := "将饺子倒入锅中。" },
    { index := 3, instruction := "倒入锅前可以适当用水过一下。" },
    { index := 4, instruction := "倒入饺子后，可以用炒菜勺子或铲子搅水，但要注意不要铲到饺子上，以避免粘锅上撕破皮或互相粘连造成粘连处夹生。" },
    { index := 5, instruction := "频率不需要太高，平均每 30 秒摇 3 秒，饺子浮起后不需要再做此步。" },
    { index := 6, instruction := "饺子浮起及水再次煮沸后，用炒菜勺子盛起一个饺子观察，如果面皮有夹生可用炒菜勺子舀入 80ml 凉水，将水降温，然后继续煮至沸腾，此间重复此观察、搅拌操作，最多加两次水就能全熟。" },
    { index := 7, instruction := "所有饺子浮起后（下饺子后约 8 分钟）用铲子或漏勺把饺子铲入盘或碗中，装盘后即可食用。" },
    { index := 8, instruction := "吃完饺子后，等锅内水温降低，将水倒掉并用洗洁精及时刷锅，不然过段时间锅内煮过的面粉会在锅壁形成黏糊糊的物质。" }
  ]
}

theorem recipe_6c8fa75dcb07_ingredients_nonempty :
    recipe_6c8fa75dcb07.ingredients.isEmpty = false := by decide

theorem recipe_6c8fa75dcb07_steps_nonempty :
    recipe_6c8fa75dcb07.steps.isEmpty = false := by decide

theorem recipe_6c8fa75dcb07_step_count :
    recipe_6c8fa75dcb07.steps.length = 8 := by decide

theorem recipe_6c8fa75dcb07_steps_ordered :
    orderedFrom 1 recipe_6c8fa75dcb07.steps = true := by decide

theorem recipe_6c8fa75dcb07_executes_to_terminal :
    executesToTerminal recipe_6c8fa75dcb07 = true := by decide

theorem recipe_6c8fa75dcb07_kernel_certificate :
    kernelCertified recipe_6c8fa75dcb07 = true := by decide

end LeanToCook.SourceCatalog
