import LeanToCook.Recipes.ButterShrimp.Spec

namespace LeanToCook.ButterShrimp

theorem butterShrimpPlan_is_executable : butterShrimpPlan_is_executable_spec  := by
  change (run initialKitchen butterShrimpPlan).isSome = true
  decide

theorem butterShrimpPlan_plates_dish : butterShrimpPlan_plates_dish_spec  := by
  change resultIsPlated (run initialKitchen butterShrimpPlan) = true
  decide

theorem butterShrimpPlan_leaves_heat_off : butterShrimpPlan_leaves_heat_off_spec  := by
  change resultLeavesHeatOff (run initialKitchen butterShrimpPlan) = true
  decide

theorem cannot_add_butter_before_searing : cannot_add_butter_before_searing_spec  := by
  change run initialKitchen [.butterSauceShrimp] = none
  decide

theorem one_serving_amounts : one_serving_amounts_spec  := by
  change shrimpGFor 1 = 300 ∧
    butterGFor 1 = 7 ∧
    oilMlFor 1 = 45 ∧
    soyMlFor 1 = 10 ∧
    reduceSeconds = 15
  decide

theorem butterShrimpPlan_correct_for_one : butterShrimpPlan_correct_for_one_spec  := by
  change (run initialKitchen butterShrimpPlan).isSome = true ∧
    resultIsPlated (run initialKitchen butterShrimpPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen butterShrimpPlan) = true ∧
    (shrimpGFor 1 = 300 ∧
      butterGFor 1 = 7 ∧
      oilMlFor 1 = 45 ∧
      soyMlFor 1 = 10 ∧
      reduceSeconds = 15)
  exact ⟨
    butterShrimpPlan_is_executable,
    butterShrimpPlan_plates_dish,
    butterShrimpPlan_leaves_heat_off,
    one_serving_amounts
  ⟩

end LeanToCook.ButterShrimp
