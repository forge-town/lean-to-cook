import LeanToCook.Recipes.CornRibSoup.Spec

namespace LeanToCook.CornRibSoup

theorem cornRibSoupPlan_is_executable : cornRibSoupPlan_is_executable_spec  := by
  change (run initialKitchen cornRibSoupPlan).isSome = true
  decide

theorem cornRibSoupPlan_plates_dish : cornRibSoupPlan_plates_dish_spec  := by
  change resultIsPlated (run initialKitchen cornRibSoupPlan) = true
  decide

theorem cornRibSoupPlan_leaves_heat_off : cornRibSoupPlan_leaves_heat_off_spec  := by
  change resultLeavesHeatOff (run initialKitchen cornRibSoupPlan) = true
  decide

theorem cannot_simmer_carrot_before_corn : cannot_simmer_carrot_before_corn_spec  := by
  change run initialKitchen [.simmerCarrot] = none
  decide

theorem one_pot_amounts_and_time : one_pot_amounts_and_time_spec  := by
  change ribsMinGFor 1 = 500 ∧
    ribsMaxGFor 1 = 800 ∧
    waterMlFor 1 = 1000 ∧
    saltMinGFor 1 = 10 ∧
    saltMaxGFor 1 = 15 ∧
    totalSimmerSeconds = 3600
  decide

theorem cornRibSoupPlan_correct_for_one : cornRibSoupPlan_correct_for_one_spec  := by
  change (run initialKitchen cornRibSoupPlan).isSome = true ∧
    resultIsPlated (run initialKitchen cornRibSoupPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen cornRibSoupPlan) = true ∧
    (ribsMinGFor 1 = 500 ∧
      ribsMaxGFor 1 = 800 ∧
      waterMlFor 1 = 1000 ∧
      saltMinGFor 1 = 10 ∧
      saltMaxGFor 1 = 15 ∧
      totalSimmerSeconds = 3600)
  exact ⟨
    cornRibSoupPlan_is_executable,
    cornRibSoupPlan_plates_dish,
    cornRibSoupPlan_leaves_heat_off,
    one_pot_amounts_and_time
  ⟩

end LeanToCook.CornRibSoup
