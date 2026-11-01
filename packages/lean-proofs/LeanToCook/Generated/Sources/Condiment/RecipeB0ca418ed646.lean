/- AUTO-GENERATED; structural certificate only. Source license: Unlicense. -/
import LeanToCook.Core.SourceRecipe

namespace LeanToCook.SourceCatalog

/- 简易版炒糖色 · dishes/condiment/简易版炒糖色.md -/
def recipe_b0ca418ed646 : Recipe := {
  id := "b0ca418ed646"
  title := "简易版炒糖色"
  category := "condiment"
  sourcePath := "dishes/condiment/简易版炒糖色.md"
  sourceCommit := "308cc8b7dab1da84b20e7fafdf836a715437f582"
  ingredients := [
    "糖（任选其一）：",
    "冰糖：炒出来的糖色色泽最为鲜艳，红亮，必须水油炒，不加水融化会很慢",
    "白砂糖：必须水油炒，不加水融化会很慢",
    "绵白糖：可以不加水",
    "炒糖色过程火不要太大！！！电磁炉温度不够，火候过了发苦，不够发甜"
  ]
  steps := [
    { index := 1, instruction := "开火，并向锅中倒入 100ml 开水" },
    { index := 2, instruction := "再向锅中倒入 100ml 油，与第一步间隔越短越好，此时锅为大火中火都可以，着急的话可以大火" },
    { index := 3, instruction := "放入冰糖（如果冰糖过于耦合，可以提前敲碎，做到耦合度越低越好）" },
    { index := 4, instruction := "调整火力为中火" },
    { index := 5, instruction := "开始搅拌" }
  ]
}

theorem recipe_b0ca418ed646_ingredients_nonempty :
    recipe_b0ca418ed646.ingredients.isEmpty = false := by decide

theorem recipe_b0ca418ed646_steps_nonempty :
    recipe_b0ca418ed646.steps.isEmpty = false := by decide

theorem recipe_b0ca418ed646_step_count :
    recipe_b0ca418ed646.steps.length = 5 := by decide

theorem recipe_b0ca418ed646_steps_ordered :
    orderedFrom 1 recipe_b0ca418ed646.steps = true := by decide

theorem recipe_b0ca418ed646_executes_to_terminal :
    executesToTerminal recipe_b0ca418ed646 = true := by decide

theorem recipe_b0ca418ed646_kernel_certificate :
    kernelCertified recipe_b0ca418ed646 = true := by decide

end LeanToCook.SourceCatalog
