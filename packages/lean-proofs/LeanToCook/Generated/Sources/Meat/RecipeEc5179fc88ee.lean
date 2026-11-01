/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 干煸仔鸡 · dishes/meat_dish/干煸仔鸡/干煸仔鸡.md -/
def recipe_ec5179fc88ee : Recipe := {
  id := "ec5179fc88ee"
  title := "干煸仔鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/干煸仔鸡/干煸仔鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "鸡腿",
    "土豆",
    "青椒",
    "大蒜",
    "盐",
    "胡椒粉",
    "生抽",
    "老抽",
    "料酒",
    "淀粉",
    "郫县红油豆瓣酱（注意区分，不是那种棕黄色的豆瓣酱）",
    "白糖",
    "花椒碎"
  ]
  steps := [
    { index := 1, instruction := "鸡腿去骨（如使用鸡腿排可忽略此步骤），鸡腿肉用刀背砸一砸，切成 2cm 的块。" },
    { index := 2, instruction := "鸡腿肉中加入盐、鸡精（可选）、胡椒粉、生抽、老抽、料酒，抓拌至粘手时加入淀粉拌匀，加入食用油防止粘连，腌制 30 分钟。" },
    { index := 3, instruction := "土豆去皮，切成 2cm 的块，沸水煮 5 分钟后捞出，控干水分，防止油炸时爆锅。" },
    { index := 4, instruction := "青椒去籽，切成 2cm 小片，放在笊篱中备用。" },
    { index := 5, instruction := "锅中加入宽油（根据锅的形状，能没过食材即可），油温烧至 180℃ 时，下入土豆块炸 3 分钟后捞出。" },
    { index := 6, instruction := "待油温再次升高到 180℃时，下入鸡块炸 2 分钟后捞出。" },
    { index := 7, instruction := "待油温再次升高到 180℃时，下入鸡块复炸 1 分钟后捞出。" },
    { index := 8, instruction := "待油温再次升高到 180℃时，下入土豆块复炸 1 分钟后，将锅中的油和土豆块经过笊篱过滤倒出，让笊篱上的青椒片断生。" },
    { index := 9, instruction := "锅中加入 5ml 食用油，小火煸炒蒜瓣至发黄，下入红油豆瓣酱煸炒出香，下入白糖炒融化，下入花椒碎，加 40ml 清水，不停搅拌至酱汁粘稠。" },
    { index := 10, instruction := "下入炸好的鸡块、土豆块、青椒片，搅拌均匀后出锅。" }
  ]
}

theorem recipe_ec5179fc88ee_ingredients_nonempty :
    recipe_ec5179fc88ee.ingredients.isEmpty = false := by decide

theorem recipe_ec5179fc88ee_steps_nonempty :
    recipe_ec5179fc88ee.steps.isEmpty = false := by decide

theorem recipe_ec5179fc88ee_step_count :
    recipe_ec5179fc88ee.steps.length = 10 := by decide

theorem recipe_ec5179fc88ee_steps_ordered :
    orderedFrom 1 recipe_ec5179fc88ee.steps = true := by decide

theorem recipe_ec5179fc88ee_executes_to_terminal :
    executesToTerminal recipe_ec5179fc88ee = true := by decide

theorem recipe_ec5179fc88ee_kernel_certificate :
    kernelCertified recipe_ec5179fc88ee = true := by decide

end LeanToCook.SourceCatalog
