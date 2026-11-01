import LeanToCook.Recipes.ColaWings.Model

namespace LeanToCook.ColaWings

def colaWingsPlan_is_executable_spec : Prop :=
  (run initialKitchen colaWingsPlan).isSome = true

def colaWingsPlan_plates_dish_spec : Prop :=
  resultIsPlated (run initialKitchen colaWingsPlan) = true

def colaWingsPlan_leaves_heat_off_spec : Prop :=
  resultLeavesHeatOff (run initialKitchen colaWingsPlan) = true

def cannot_glaze_before_reduction_spec : Prop :=
  run initialKitchen [.glazeWings] = none

def one_platter_amounts_spec : Prop :=
  wingsMinFor 1 = 10 ∧
    wingsMaxFor 1 = 12 ∧
    colaMlFor 1 = 500 ∧
    sugarGFor 1 = 10 ∧
    soyGFor 1 = 15 ∧
    saltGFor 1 = 2

def colaWingsPlan_correct_for_one_spec : Prop :=
  (run initialKitchen colaWingsPlan).isSome = true ∧
    resultIsPlated (run initialKitchen colaWingsPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen colaWingsPlan) = true ∧
    (wingsMinFor 1 = 10 ∧
      wingsMaxFor 1 = 12 ∧
      colaMlFor 1 = 500 ∧
      sugarGFor 1 = 10 ∧
      soyGFor 1 = 15 ∧
      saltGFor 1 = 2)

end LeanToCook.ColaWings
