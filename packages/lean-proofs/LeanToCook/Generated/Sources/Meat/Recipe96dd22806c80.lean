/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 新疆大盘鸡 · dishes/meat_dish/新疆大盘鸡/新疆大盘鸡.md -/
def recipe_96dd22806c80 : Recipe := {
  id := "96dd22806c80"
  title := "新疆大盘鸡"
  category := "meat"
  sourcePath := "dishes/meat_dish/新疆大盘鸡/新疆大盘鸡.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "花椒，香叶，香果，干线椒，大蒜，大葱",
    "油，盐，生抽，蚝油，料酒（可拿啤酒），白糖",
    "鸡肉（鸡腿肉最好），土豆，菜椒和甜椒（可以不用，加上配色好看）"
  ]
  steps := [
    { index := 1, instruction := "肉先剁好，块状，用清水+盐浸泡 5 分钟，去除血水，去腥，然后空干水" },
    { index := 2, instruction := "葱蒜辣椒土豆等洗干净，土豆削皮" },
    { index := 3, instruction := "葱白切长段，长度 4cm 一段，菜椒和线椒切块状" },
    { index := 4, instruction := "土豆切成滚刀土豆，即切一刀动滚动一下，一块土豆大概有 4cm4cm 大小即可" },
    { index := 5, instruction := "炒糖色：先将油加入锅中，然后将白砂糖放入，用锅铲来回搅拌，将糖炒化，然后炒出焦黄色，此时将空干水的鸡肉倒入锅中翻炒，进行上色" },
    { index := 6, instruction := "放入花椒，香叶，香果，干线椒等进行翻炒" },
    { index := 7, instruction := "放入 5g 盐，生抽 7ml，蚝油 10g ，料酒 100g，倒入 1 升清水，料酒可以用啤酒代替" },
    { index := 8, instruction := "调至中火，将水烧开，调制中小火慢炖入味" },
    { index := 9, instruction := "当水收至鸡肉即将露出时，将土豆放在锅表面：注意不要翻动土豆，就盖在表面，不然翻到下面容易粘锅，继续盖锅盖炖，炖一会后将大葱，菜椒和甜椒放入，继续炖。" },
    { index := 10, instruction := "炖到汁收的差不多时可以进行翻面，将土豆与汤汁相吸，最后关火盛出。" }
  ]
}

theorem recipe_96dd22806c80_ingredients_nonempty :
    recipe_96dd22806c80.ingredients.isEmpty = false := by decide

theorem recipe_96dd22806c80_steps_nonempty :
    recipe_96dd22806c80.steps.isEmpty = false := by decide

theorem recipe_96dd22806c80_step_count :
    recipe_96dd22806c80.steps.length = 10 := by decide

theorem recipe_96dd22806c80_steps_ordered :
    orderedFrom 1 recipe_96dd22806c80.steps = true := by decide

theorem recipe_96dd22806c80_executes_to_terminal :
    executesToTerminal recipe_96dd22806c80 = true := by decide

theorem recipe_96dd22806c80_kernel_certificate :
    kernelCertified recipe_96dd22806c80 = true := by decide

end LeanToCook.SourceCatalog
