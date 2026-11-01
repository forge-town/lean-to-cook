/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炸酱面 · dishes/staple/炸酱面.md -/
def recipe_d916492c172d : Recipe := {
  id := "d916492c172d"
  title := "炸酱面"
  category := "staple"
  sourcePath := "dishes/staple/炸酱面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "肉丁/肉末",
    "面条（挂面或普通面条）",
    "蒜",
    "菜码（根据个人喜好选择，通常 4-10 种，可选择黄瓜、白菜、萝卜等）",
    "豆瓣酱",
    "甜面酱"
  ]
  steps := [
    { index := 1, instruction := "菜码切丝备用。" },
    { index := 2, instruction := "葱切碎。油锅烧热，下葱和肉，炒至肉完全熟透（无红色）" },
    { index := 3, instruction := "下豆瓣酱和甜面酱，继续炒至微微粘稠。盛出，得到炸酱。" },
    { index := 4, instruction := "取大碗，加凉水备用。" },
    { index := 5, instruction := "煮面条至断生（无白芯），盛入第 4 步装有凉水的碗中。" },
    { index := 6, instruction := "立即控水捞出，盛入干净的碗中。" },
    { index := 7, instruction := "取第 3 步炸酱，倒入碗中，拌匀。然后取第 1 步菜码，倒入碗中，拌匀。" }
  ]
}

theorem recipe_d916492c172d_ingredients_nonempty :
    recipe_d916492c172d.ingredients.isEmpty = false := by decide

theorem recipe_d916492c172d_steps_nonempty :
    recipe_d916492c172d.steps.isEmpty = false := by decide

theorem recipe_d916492c172d_step_count :
    recipe_d916492c172d.steps.length = 7 := by decide

theorem recipe_d916492c172d_steps_ordered :
    orderedFrom 1 recipe_d916492c172d.steps = true := by decide

theorem recipe_d916492c172d_executes_to_terminal :
    executesToTerminal recipe_d916492c172d = true := by decide

theorem recipe_d916492c172d_kernel_certificate :
    kernelCertified recipe_d916492c172d = true := by decide

end LeanToCook.SourceCatalog
