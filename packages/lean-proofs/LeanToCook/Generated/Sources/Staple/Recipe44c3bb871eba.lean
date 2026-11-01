/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 芝麻烧饼 · dishes/staple/烧饼/芝麻烧饼.md -/
def recipe_44c3bb871eba : Recipe := {
  id := "44c3bb871eba"
  title := "芝麻烧饼"
  category := "staple"
  sourcePath := "dishes/staple/烧饼/芝麻烧饼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "面粉",
    "酵母粉",
    "白糖",
    "十三香",
    "食用油",
    "温水( 40℃ )"
  ]
  steps := [
    { index := 1, instruction := "面团：300 克面粉，3 克酵母粉，3 克白糖，180 克温水，20 克食用油，醒面 10 分钟" },
    { index := 2, instruction := "油酥：小碗放 30 克面粉，2 克盐，4 克十三香，20 克食用油，拌匀后，静置" },
    { index := 3, instruction := "做饼：面擀成长方形，抹上调好的油酥，从一头卷起，切成 7 个面剂子，对折，用虎口收拢即可，先沾水再沾白芝麻，擀成小圆饼" },
    { index := 4, instruction := "烙饼：将电饼铛预热，倒入凉油（锅底铺满油），将擀好的饼放入电饼铛中，将饼的上方也刷点油，涂抹均匀盖上盖子，选大饼档,听到叮的一声出锅即可" }
  ]
}

theorem recipe_44c3bb871eba_ingredients_nonempty :
    recipe_44c3bb871eba.ingredients.isEmpty = false := by decide

theorem recipe_44c3bb871eba_steps_nonempty :
    recipe_44c3bb871eba.steps.isEmpty = false := by decide

theorem recipe_44c3bb871eba_step_count :
    recipe_44c3bb871eba.steps.length = 4 := by decide

theorem recipe_44c3bb871eba_steps_ordered :
    orderedFrom 1 recipe_44c3bb871eba.steps = true := by decide

theorem recipe_44c3bb871eba_executes_to_terminal :
    executesToTerminal recipe_44c3bb871eba = true := by decide

theorem recipe_44c3bb871eba_kernel_certificate :
    kernelCertified recipe_44c3bb871eba = true := by decide

end LeanToCook.SourceCatalog
