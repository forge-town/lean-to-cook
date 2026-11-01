import LeanToCook.Recipes.ColaWings.Spec

namespace LeanToCook.ColaWings

theorem colaWingsPlan_is_executable : colaWingsPlan_is_executable_spec  := by
  change (run initialKitchen colaWingsPlan).isSome = true
  decide

theorem colaWingsPlan_plates_dish : colaWingsPlan_plates_dish_spec  := by
  change resultIsPlated (run initialKitchen colaWingsPlan) = true
  decide

theorem colaWingsPlan_leaves_heat_off : colaWingsPlan_leaves_heat_off_spec  := by
  change resultLeavesHeatOff (run initialKitchen colaWingsPlan) = true
  decide

theorem cannot_glaze_before_reduction : cannot_glaze_before_reduction_spec  := by
  change run initialKitchen [.glazeWings] = none
  decide

theorem one_platter_amounts : one_platter_amounts_spec  := by
  change wingsMinFor 1 = 10 ∧
    wingsMaxFor 1 = 12 ∧
    colaMlFor 1 = 500 ∧
    sugarGFor 1 = 10 ∧
    soyGFor 1 = 15 ∧
    saltGFor 1 = 2
  decide

theorem colaWingsPlan_correct_for_one : colaWingsPlan_correct_for_one_spec  := by
  change (run initialKitchen colaWingsPlan).isSome = true ∧
    resultIsPlated (run initialKitchen colaWingsPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen colaWingsPlan) = true ∧
    (wingsMinFor 1 = 10 ∧
      wingsMaxFor 1 = 12 ∧
      colaMlFor 1 = 500 ∧
      sugarGFor 1 = 10 ∧
      soyGFor 1 = 15 ∧
      saltGFor 1 = 2)
  exact ⟨
    colaWingsPlan_is_executable,
    colaWingsPlan_plates_dish,
    colaWingsPlan_leaves_heat_off,
    one_platter_amounts
  ⟩

end LeanToCook.ColaWings
