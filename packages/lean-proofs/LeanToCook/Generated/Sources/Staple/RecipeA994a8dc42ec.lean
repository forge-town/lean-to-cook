/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 炒方便面 · dishes/staple/炒方便面/炒方便面.md -/
def recipe_a994a8dc42ec : Recipe := {
  id := "a994a8dc42ec"
  title := "炒方便面"
  category := "staple"
  sourcePath := "dishes/staple/炒方便面/炒方便面.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "方便面",
    "鸡蛋",
    "火腿肠（可选）"
  ]
  steps := [
    { index := 1, instruction := "将火腿肠撕开包装，切成宽度 1cm 的小块。" },
    { index := 2, instruction := "向煮锅中加入 1200 ml 水，实际以没过面饼为准。完全煮沸，不要在未沸腾时加面。" },
    { index := 3, instruction := "加入方便面面饼，煮 45 秒。煮的过程中将其挑动，把面条打散。" },
    { index := 4, instruction := "面条打散后立刻关火。不要煮熟！" },
    { index := 5, instruction := "从锅中舀出 80ml 热面汤备用。" },
    { index := 6, instruction := "将面汤和面分离。用凉水冲一下面条。" },
    { index := 7, instruction := "沥干面条上的水分。不要长时间将面泡在水中。" },
    { index := 8, instruction := "准备一个小碗，将方便面的调料包挤进去。" },
    { index := 9, instruction := "将上一步的 80ml 热面汤全部倒入小碗，搅匀，得到调料碗。" },
    { index := 10, instruction := "取出计算好的数量的鸡蛋，打入一个小碗。不要加盐！（鸡蛋最终会混合锅里食材的盐味）" },
    { index := 11, instruction := "热锅 20s，加入份数  8ml 油。" },
    { index := 12, instruction := "加入刚刚准备好的一碗鸡蛋。翻炒大约 20s 至鸡蛋形成固态即可。" },
    { index := 13, instruction := "将煎鸡蛋取出暂存。不需要洗锅。但一般锅内不会残余太多油。" },
    { index := 14, instruction := "重新热锅 20s，向锅内加入油：份数  10ml。" },
    { index := 15, instruction := "加入第一步处理的火腿肠。翻炒 10 秒。" },
    { index := 16, instruction := "加入第二步的面。翻炒 30 秒。" },
    { index := 17, instruction := "加入第三步的调料碗。翻炒 30 秒。" },
    { index := 18, instruction := "加入第四步的煎鸡蛋。翻炒 30 秒。" },
    { index := 19, instruction := "关火盛盘即可。" }
  ]
}

theorem recipe_a994a8dc42ec_ingredients_nonempty :
    recipe_a994a8dc42ec.ingredients.isEmpty = false := by decide

theorem recipe_a994a8dc42ec_steps_nonempty :
    recipe_a994a8dc42ec.steps.isEmpty = false := by decide

theorem recipe_a994a8dc42ec_step_count :
    recipe_a994a8dc42ec.steps.length = 19 := by decide

theorem recipe_a994a8dc42ec_steps_ordered :
    orderedFrom 1 recipe_a994a8dc42ec.steps = true := by decide

theorem recipe_a994a8dc42ec_executes_to_terminal :
    executesToTerminal recipe_a994a8dc42ec = true := by decide

theorem recipe_a994a8dc42ec_kernel_certificate :
    kernelCertified recipe_a994a8dc42ec = true := by decide

end LeanToCook.SourceCatalog
