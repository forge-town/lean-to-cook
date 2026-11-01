/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒河粉 · dishes/staple/炒河粉.md -/
def recipe_581d80efc12c : Recipe := {
  id := "581d80efc12c"
  title := "炒河粉"
  category := "staple"
  sourcePath := "dishes/staple/炒河粉.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "炒河粉、猪肉/牛肉",
    "炒料：盐、味精、老抽、生抽、孜然粉（或直接用河粉料）",
    "其他调味料：胡椒粉",
    "黄瓜、面筋块、绿豆芽、鸡蛋、蒜瓣、小葱、淀粉",
    "盆、盘子"
  ]
  steps := [
    { index := 1, instruction := "小葱切碎（葱白和葱叶分开）、蒜瓣拍碎，丢案板上备用。" },
    { index := 2, instruction := "打碎鸡蛋，捞一点蛋清到一只碗中，剩下的丢入另一只碗中备用。" },
    { index := 3, instruction := "将绿豆芽放入锅中，大火煮 60 秒。豆芽捞出，过凉水，放入盘中备用。" },
    { index := 4, instruction := "黄瓜切丝放入盘中备用，可和豆芽丢一起。" },
    { index := 5, instruction := "处理面筋，单独丢一个盘中。" },
    { index := 6, instruction := "肉切细条状，加入淀粉与刚刚碗中的鸡蛋清、胡椒粉，顺时针拌匀。" },
    { index := 7, instruction := "注：超市购买来的凉皮表面一般会有食用油，可以使用自来水清洗。面筋同样。" },
    { index := 8, instruction := "注：清洗面筋之后，请用手将面筋中的大量水分挤出（不需过于用力）。" },
    { index := 9, instruction := "加入食用油，锅热倒出。" },
    { index := 10, instruction := "倒入处理好的肉，翻炒均匀至变色，倒入碗中备用。" },
    { index := 11, instruction := "趁锅热，加入 20g 食用油（高血压人群可降低用量），倒入葱白、蒜爆炒出香。" },
    { index := 12, instruction := "加入河粉，淋入老抽提色，翻炒均匀后再加入河粉炒料，继续翻炒。" },
    { index := 13, instruction := "河粉即将透明时，放入炒制好的肉丝与面筋，并加入生抽提鲜，简单翻炒两次。" },
    { index := 14, instruction := "加入豆芽与黄瓜丝，翻炒至河粉完全透明。" },
    { index := 15, instruction := "关火！" },
    { index := 16, instruction := "撒入葱叶点缀，把锅端起。" },
    { index := 17, instruction := "倒入盘中，开始干饭。" }
  ]
}

theorem recipe_581d80efc12c_ingredients_nonempty :
    recipe_581d80efc12c.ingredients.isEmpty = false := by decide

theorem recipe_581d80efc12c_steps_nonempty :
    recipe_581d80efc12c.steps.isEmpty = false := by decide

theorem recipe_581d80efc12c_step_count :
    recipe_581d80efc12c.steps.length = 17 := by decide

theorem recipe_581d80efc12c_steps_ordered :
    orderedFrom 1 recipe_581d80efc12c.steps = true := by decide

theorem recipe_581d80efc12c_executes_to_terminal :
    executesToTerminal recipe_581d80efc12c = true := by decide

theorem recipe_581d80efc12c_kernel_certificate :
    kernelCertified recipe_581d80efc12c = true := by decide

end LeanToCook.SourceCatalog
