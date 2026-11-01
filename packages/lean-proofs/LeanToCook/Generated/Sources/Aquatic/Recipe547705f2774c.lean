/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 清蒸鲈鱼 · dishes/aquatic/清蒸鲈鱼/清蒸鲈鱼.md -/
def recipe_547705f2774c : Recipe := {
  id := "547705f2774c"
  title := "清蒸鲈鱼"
  category := "aquatic"
  sourcePath := "dishes/aquatic/清蒸鲈鱼/清蒸鲈鱼.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鲈鱼（害怕杀鱼的同学可以让店家帮忙杀）",
    "香葱",
    "姜",
    "食用油",
    "蒸鱼豉油",
    "料酒",
    "食用盐"
  ]
  steps := [
    { index := 1, instruction := "姜切片切丝、香葱的葱白切段，葱绿切丝，切丝后放入冷水浸泡备用。" },
    { index := 2, instruction := "鲈鱼处理好后洗净，用厨房纸擦干，两面分别划几刀，用盐洗掉鱼身的粘液，并用 10g 盐抹遍鱼身的内外，腌制 10 分钟以上。" },
    { index := 3, instruction := "补充一个鲈鱼改刀和摆盘的方法，改刀后可以让鲈鱼立起来蒸，均匀受热，同时吃起来更加方便，无需翻面。" },
    { index := 4, instruction := "鱼肚内塞上姜和葱白，鱼身也撒上姜和葱白，量为备用的一半。蒸鱼的碟子用筷子将鱼跟碟子隔开蒸" },
    { index := 5, instruction := "水烧热感觉到水温后放进入鱼" },
    { index := 6, instruction := "大火清蒸 10 分钟。" },
    { index := 7, instruction := "蒸好的鱼，用干净的盘子装起来并去除身上姜蒜" },
    { index := 8, instruction := "鱼身浇上 15ml 蒸鱼豉油" },
    { index := 9, instruction := "鱼身重新撒上姜和葱丝，锅内加上 10ml 食用油并烧热，将食用油淋至鱼身即可出菜" }
  ]
}

theorem recipe_547705f2774c_ingredients_nonempty :
    recipe_547705f2774c.ingredients.isEmpty = false := by decide

theorem recipe_547705f2774c_steps_nonempty :
    recipe_547705f2774c.steps.isEmpty = false := by decide

theorem recipe_547705f2774c_step_count :
    recipe_547705f2774c.steps.length = 9 := by decide

theorem recipe_547705f2774c_steps_ordered :
    orderedFrom 1 recipe_547705f2774c.steps = true := by decide

theorem recipe_547705f2774c_executes_to_terminal :
    executesToTerminal recipe_547705f2774c = true := by decide

theorem recipe_547705f2774c_kernel_certificate :
    kernelCertified recipe_547705f2774c = true := by decide

end LeanToCook.SourceCatalog
