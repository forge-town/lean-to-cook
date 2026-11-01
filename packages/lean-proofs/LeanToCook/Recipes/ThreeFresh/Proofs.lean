import LeanToCook.Recipes.ThreeFresh.Spec

namespace LeanToCook.ThreeFresh

theorem threeFreshPlan_is_executable : threeFreshPlan_is_executable_spec  := by
  change (run initialKitchen threeFreshPlan).isSome = true
  decide

theorem threeFreshPlan_plates_dish : threeFreshPlan_plates_dish_spec  := by
  change resultIsPlated (run initialKitchen threeFreshPlan) = true
  decide

theorem threeFreshPlan_leaves_heat_off : threeFreshPlan_leaves_heat_off_spec  := by
  change resultLeavesHeatOff (run initialKitchen threeFreshPlan) = true
  decide

theorem cannot_combine_before_reserving_components : cannot_combine_before_reserving_components_spec  := by
  change run initialKitchen [.combineThreeFresh] = none
  decide

theorem components_are_reserved_before_combine : components_are_reserved_before_combine_spec  := by
  change potatoReserveIndex < combineIndex ∧
    eggplantReserveIndex < combineIndex
  decide

theorem one_batch_amounts : one_batch_amounts_spec  := by
  change eggplantGFor 1 = 200 ∧
    potatoGFor 1 = 150 ∧
    pepperMinFor 1 = 3 ∧
    pepperMaxFor 1 = 4 ∧
    fryingOilMlFor 1 = 150 ∧
    finishingOilMlFor 1 = 15 ∧
    sauceWaterMlFor 1 = 80
  decide

theorem threeFreshPlan_correct_for_one : threeFreshPlan_correct_for_one_spec  := by
  change (run initialKitchen threeFreshPlan).isSome = true ∧
    resultIsPlated (run initialKitchen threeFreshPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen threeFreshPlan) = true ∧
    (potatoReserveIndex < combineIndex ∧ eggplantReserveIndex < combineIndex) ∧
    (eggplantGFor 1 = 200 ∧
      potatoGFor 1 = 150 ∧
      pepperMinFor 1 = 3 ∧
      pepperMaxFor 1 = 4 ∧
      fryingOilMlFor 1 = 150 ∧
      finishingOilMlFor 1 = 15 ∧
      sauceWaterMlFor 1 = 80)
  exact ⟨
    threeFreshPlan_is_executable,
    threeFreshPlan_plates_dish,
    threeFreshPlan_leaves_heat_off,
    components_are_reserved_before_combine,
    one_batch_amounts
  ⟩

end LeanToCook.ThreeFresh
