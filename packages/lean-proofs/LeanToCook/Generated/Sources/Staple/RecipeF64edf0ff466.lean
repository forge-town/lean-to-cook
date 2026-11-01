/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 河南蒸面条 · dishes/staple/河南蒸面条/河南蒸面条.md -/
def recipe_f64edf0ff466 : Recipe := {
  id := "f64edf0ff466"
  title := "河南蒸面条"
  category := "staple"
  sourcePath := "dishes/staple/河南蒸面条/河南蒸面条.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "挂面 （推荐圆的）",
    "五花肉",
    "蒜薹",
    "葱 + 姜 + 蒜 + 料酒",
    "盐 + 鸡精 + 十三香",
    "生抽 + 老抽 + 蚝油",
    "麻油",
    "油 + 锅 + 菜刀 + 铲子",
    "蒸篦子",
    "额外的盆"
  ]
  steps := [
    { index := 1, instruction := "起锅加 7 成水，水开，上蒸篦子" },
    { index := 2, instruction := "将挂面，均匀铺开放置，淋 5ml 油并抹匀，蒸 15 分钟" },
    { index := 3, instruction := "将挂面和蒸篦子取出，放置一边，并倒掉锅中的水" },
    { index := 4, instruction := "五花肉，切成 2mm 厚度的肉片" },
    { index := 5, instruction := "蒜薹，切成 3cm 段" },
    { index := 6, instruction := "葱，切成 0.2cm 薄片" },
    { index := 7, instruction := "姜，切成 1mm x 1mm x 3cm 的细丝" },
    { index := 8, instruction := "蒜，放在砧板上拍碎，切成 1mm 的粒度" },
    { index := 9, instruction := "起锅，烧干水分，加 3ml 食用油" },
    { index := 10, instruction := "手持锅柄，摇晃锅，使食用油充分挂满锅的 2/3" },
    { index := 11, instruction := "中火，加入肉片，翻炒 1 分钟" },
    { index := 12, instruction := "加入葱姜蒜，料酒，继续翻炒 1 分钟" },
    { index := 13, instruction := "将蒜薹段，放入锅中，翻炒 1 分钟" },
    { index := 14, instruction := "开始调味，加入老抽、生抽、蚝油、盐、鸡精、十三香，翻炒 1 分钟" },
    { index := 15, instruction := "加入 500ML 水，没过蔬菜，炖煮 1 分钟" },
    { index := 16, instruction := "将蒸好的挂面放入，不断搅拌 3 分钟，待挂面全部均匀上色，关火" },
    { index := 17, instruction := "将搅拌好的挂面和菜，全部倒入额外的盆中" },
    { index := 18, instruction := "起锅，加冷水 7 成，放上蒸篦子，将拌好的面条和菜，均匀的铺在上面" },
    { index := 19, instruction := "水开后，大火烧 15 分钟，出锅" },
    { index := 20, instruction := "淋上 10g 的麻油，即可食用" }
  ]
}

theorem recipe_f64edf0ff466_ingredients_nonempty :
    recipe_f64edf0ff466.ingredients.isEmpty = false := by decide

theorem recipe_f64edf0ff466_steps_nonempty :
    recipe_f64edf0ff466.steps.isEmpty = false := by decide

theorem recipe_f64edf0ff466_step_count :
    recipe_f64edf0ff466.steps.length = 20 := by decide

theorem recipe_f64edf0ff466_steps_ordered :
    orderedFrom 1 recipe_f64edf0ff466.steps = true := by decide

theorem recipe_f64edf0ff466_executes_to_terminal :
    executesToTerminal recipe_f64edf0ff466 = true := by decide

theorem recipe_f64edf0ff466_kernel_certificate :
    kernelCertified recipe_f64edf0ff466 = true := by decide

end LeanToCook.SourceCatalog
