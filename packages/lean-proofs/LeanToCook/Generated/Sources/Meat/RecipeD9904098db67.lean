/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 凉拌鸡丝 · dishes/meat_dish/凉拌鸡丝/凉拌鸡丝.md -/
def recipe_d9904098db67 : Recipe := {
  id := "d9904098db67"
  title := "凉拌鸡丝"
  category := "meat"
  sourcePath := "dishes/meat_dish/凉拌鸡丝/凉拌鸡丝.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡胸肉（常温冷冻均可）",
    "麻油（花椒油）",
    "生抽",
    "香醋",
    "白糖",
    "盐",
    "料酒",
    "姜",
    "凉白开水"
  ]
  steps := [
    { index := 1, instruction := "姜切片，备用" },
    { index := 2, instruction := "锅中倒入 4 升水" },
    { index := 3, instruction := "加入鸡胸肉、姜片" },
    { index := 4, instruction := "倒入 20 毫升料酒" },
    { index := 5, instruction := "开大火不盖盖将水烧开" },
    { index := 6, instruction := "水开后转中火，用勺子将浮沫捞出" },
    { index := 7, instruction := "继续煮 5-7 分钟，如果是非冷冻肉煮 5 分钟，冷冻肉煮 7 分钟" },
    { index := 8, instruction := "鸡胸肉大小会影响成熟时间，用筷子插入鸡胸肉，如果能轻松插入，代表鸡肉熟了。如果不熟需延长煮制时间" },
    { index := 9, instruction := "用凉白开水冲泡鸡胸肉，使鸡胸肉降至室温" },
    { index := 10, instruction := "顺着鸡胸肉纹理将鸡胸肉撕成细丝" },
    { index := 11, instruction := "准备一个碗" },
    { index := 12, instruction := "碗中加入准备好的麻油、生抽、香醋、白糖、盐" },
    { index := 13, instruction := "搅拌料汁，使糖和盐尽量溶化" },
    { index := 14, instruction := "将料汁倒入鸡丝中，搅拌均匀" }
  ]
}

theorem recipe_d9904098db67_ingredients_nonempty :
    recipe_d9904098db67.ingredients.isEmpty = false := by decide

theorem recipe_d9904098db67_steps_nonempty :
    recipe_d9904098db67.steps.isEmpty = false := by decide

theorem recipe_d9904098db67_step_count :
    recipe_d9904098db67.steps.length = 14 := by decide

theorem recipe_d9904098db67_steps_ordered :
    orderedFrom 1 recipe_d9904098db67.steps = true := by decide

theorem recipe_d9904098db67_executes_to_terminal :
    executesToTerminal recipe_d9904098db67 = true := by decide

theorem recipe_d9904098db67_kernel_certificate :
    kernelCertified recipe_d9904098db67 = true := by decide

end LeanToCook.SourceCatalog
