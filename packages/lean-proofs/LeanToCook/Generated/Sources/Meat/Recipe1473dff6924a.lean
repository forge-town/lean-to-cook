/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 柱候牛腩 · dishes/meat_dish/柱候牛腩/柱候牛腩.md -/
def recipe_1473dff6924a : Recipe := {
  id := "1473dff6924a"
  title := "柱候牛腩"
  category := "meat"
  sourcePath := "dishes/meat_dish/柱候牛腩/柱候牛腩.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "炖煮锅，高压锅（可选，但极度推荐！）",
    "牛腩（首选坑腩，带筋的部位）",
    "柱候酱（核心酱），郫县豆瓣酱，南腐乳，叉烧酱（可选），蚝油， 老抽，生抽",
    "花雕酒，白酒",
    "香叶， 花椒，八角，干辣椒，丁香，甘草，干辣椒，小米辣（可选），姜，蒜"
  ]
  steps := [
    { index := 1, instruction := "先把辅料备好：" },
    { index := 2, instruction := "牛肉不用切，直接冷水下锅，开大火焯水，水沸腾时将牛肉捞出" },
    { index := 3, instruction := "冲洗牛肉表面的杂质后，切成 4cm\\4cm\\4cm 的大块，控干水后放入碗中备用" },
    { index := 4, instruction := "大火，热锅下油，把碗 1（姜、蒜、小米辣）倒入锅中，炒香" },
    { index := 5, instruction := "中小火，倒入碗 2（香料），翻炒均匀，大概 30 秒" },
    { index := 6, instruction := "中小火，放入碗 3（南乳），用锅铲把南乳压碎" },
    { index := 7, instruction := "中小火，放入碗 4（豆瓣酱），翻炒均匀，大概 30 秒" },
    { index := 8, instruction := "中小火，放入碗 5（冰糖），炒至融化" },
    { index := 9, instruction := "中小火，下入牛腩，炒至牛肉上色" },
    { index := 10, instruction := "大火，沿锅边淋入碗 6（酒），快速翻炒，炒至牛肉表面略微焦褐" },
    { index := 11, instruction := "倒入碗 7（酱料），快速翻炒，留意底层汁水，炒至不停冒小气泡，汤汁略微浓稠" },
    { index := 12, instruction := "将锅内全部食材转移至另一个炖煮锅或高压锅，加水淹过食材" },
    { index := 13, instruction := "根据使用的锅来选择炖肉的时间：" },
    { index := 14, instruction := "时间到后开盖调味，如果不够咸加盐或生抽（少量加，不断尝味道，直到合适），不够甜则同理加糖" },
    { index := 15, instruction := "调好味道后便可以把牛腩先捞出" },
    { index := 16, instruction := "如果要吃萝卜土豆，则削皮切成 2cm 厚片倒入锅中煮 10 - 15 分钟（或煮至想要吃的口感），如果是高压锅则在加压煮 5 分钟" },
    { index := 17, instruction := "煮好后捞出萝卜土豆和牛腩放一起" },
    { index := 18, instruction := "把汤汁过滤淋入碗中" }
  ]
}

theorem recipe_1473dff6924a_ingredients_nonempty :
    recipe_1473dff6924a.ingredients.isEmpty = false := by decide

theorem recipe_1473dff6924a_steps_nonempty :
    recipe_1473dff6924a.steps.isEmpty = false := by decide

theorem recipe_1473dff6924a_step_count :
    recipe_1473dff6924a.steps.length = 18 := by decide

theorem recipe_1473dff6924a_steps_ordered :
    orderedFrom 1 recipe_1473dff6924a.steps = true := by decide

theorem recipe_1473dff6924a_executes_to_terminal :
    executesToTerminal recipe_1473dff6924a = true := by decide

theorem recipe_1473dff6924a_kernel_certificate :
    kernelCertified recipe_1473dff6924a = true := by decide

end LeanToCook.SourceCatalog
