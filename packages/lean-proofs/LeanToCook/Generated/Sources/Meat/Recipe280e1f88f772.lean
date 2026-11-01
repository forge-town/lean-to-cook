/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 贵州辣子鸡 · dishes/meat_dish/贵州辣子鸡/贵州辣子鸡.md -/
def recipe_280e1f88f772 : Recipe := {
  id := "280e1f88f772"
  title := "贵州辣子鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/贵州辣子鸡/贵州辣子鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "农村玉米鸡",
    "土豆",
    "大蒜",
    "香叶",
    "姜",
    "老抽",
    "花椒 or 麻椒",
    "糍粑辣椒（花溪党武的辣椒，遵义的子弹头，条子椒，大方的皱椒混合之后打碎的辣椒）",
    "豆瓣酱",
    "啤酒",
    "蒜苗",
    "酒糟",
    "食用油"
  ]
  steps := [
    { index := 1, instruction := "在锅中加入和锅一半高度的油，将切成长条的土豆先炸至表面金黄然后捞出备用，等油温上至烤手时候将切好的鸡块放入锅中炸，并放入切好的生姜片和花椒" },
    { index := 2, instruction := "刚开始炸鸡的时候，油是浑浊的，因为鸡块里面有水的原因，等到油炸至清澈，鸡块就炸好了，然后捞出备用" },
    { index := 3, instruction := "现在锅里面的油可以捞三分之一出来，现在用不到这么多的油" },
    { index := 4, instruction := "将锅中剩余的油加热，加入糍粑辣椒，豆瓣酱，生姜片，炒出红油状，将炸好的鸡块翻炒均匀" },
    { index := 5, instruction := "等到鸡块都上色，加入老抽，倒入啤酒，啤酒一定要盖过鸡块，加上香叶盖上盖，闷十分钟，期间间隔翻炒" },
    { index := 6, instruction := "然后加入土豆条，大蒜（不用切，一颗一颗的最好），然后再闷 20 分钟" },
    { index := 7, instruction := "最后加入酒糟翻炒均匀再加入切好的蒜苗，就可以出锅了" }
  ]
}

theorem recipe_280e1f88f772_ingredients_nonempty :
    recipe_280e1f88f772.ingredients.isEmpty = false := by decide

theorem recipe_280e1f88f772_steps_nonempty :
    recipe_280e1f88f772.steps.isEmpty = false := by decide

theorem recipe_280e1f88f772_step_count :
    recipe_280e1f88f772.steps.length = 7 := by decide

theorem recipe_280e1f88f772_steps_ordered :
    orderedFrom 1 recipe_280e1f88f772.steps = true := by decide

theorem recipe_280e1f88f772_executes_to_terminal :
    executesToTerminal recipe_280e1f88f772 = true := by decide

theorem recipe_280e1f88f772_kernel_certificate :
    kernelCertified recipe_280e1f88f772 = true := by decide

end LeanToCook.SourceCatalog
