import LeanToCook.Recipes.TomatoEgg.Spec

namespace LeanToCook.TomatoEgg

theorem tomatoEggPlan_is_executable : tomatoEggPlan_is_executable_spec  := by
  change (run initialKitchen tomatoEggPlan).isSome = true
  decide

theorem tomatoEggPlan_plates_dish : tomatoEggPlan_plates_dish_spec  := by
  change resultIsPlated (run initialKitchen tomatoEggPlan) = true
  decide

theorem tomatoEggPlan_leaves_heat_off : tomatoEggPlan_leaves_heat_off_spec  := by
  change resultLeavesHeatOff (run initialKitchen tomatoEggPlan) = true
  decide

theorem cannot_cut_unwashed_tomato : cannot_cut_unwashed_tomato_spec  := by
  change run initialKitchen [.cutTomato] = none
  decide

theorem oil_for_two_servings : oil_for_two_servings_spec  := by
  change oilMlFor 2 = 12
  decide

theorem two_serving_amounts : two_serving_amounts_spec  := by
  change tomatoesFor 2 = 2 ∧
    eggsFor 2 = 3 ∧
    oilMlFor 2 = 12 ∧
    saltMinGFor 2 = 3 ∧
    saltMaxGFor 2 = 4 ∧
    sugarMaxGFor 2 = 4 ∧
    scallionMaxGFor 2 = 20
  decide

theorem three_grams_salt_is_suitable_for_two_servings : three_grams_salt_is_suitable_for_two_servings_spec  := by
  change SuitableAmount .salt { servings := 2, prefersSweet := false } 3
  simp [SuitableAmount]

theorem egg_is_reserved_before_combine : egg_is_reserved_before_combine_spec  := by
  change reserveEggIndex < combineIndex
  decide

theorem tomatoEggPlan_correct_for_two : tomatoEggPlan_correct_for_two_spec  := by
  change (run initialKitchen tomatoEggPlan).isSome = true ∧
    resultIsPlated (run initialKitchen tomatoEggPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen tomatoEggPlan) = true ∧
    (tomatoesFor 2 = 2 ∧
      eggsFor 2 = 3 ∧
      oilMlFor 2 = 12 ∧
      saltMinGFor 2 = 3 ∧
      saltMaxGFor 2 = 4 ∧
      sugarMaxGFor 2 = 4 ∧
      scallionMaxGFor 2 = 20) ∧
    SuitableAmount .salt { servings := 2, prefersSweet := false } 3
  exact ⟨
    tomatoEggPlan_is_executable,
    tomatoEggPlan_plates_dish,
    tomatoEggPlan_leaves_heat_off,
    two_serving_amounts,
    three_grams_salt_is_suitable_for_two_servings
  ⟩

end LeanToCook.TomatoEgg
