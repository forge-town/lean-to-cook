import LeanToCook.Recipes.ButterShrimp.Model

namespace LeanToCook.ButterShrimp

def butterShrimpPlan_is_executable_spec : Prop :=
  (run initialKitchen butterShrimpPlan).isSome = true

def butterShrimpPlan_plates_dish_spec : Prop :=
  resultIsPlated (run initialKitchen butterShrimpPlan) = true

def butterShrimpPlan_leaves_heat_off_spec : Prop :=
  resultLeavesHeatOff (run initialKitchen butterShrimpPlan) = true

def cannot_add_butter_before_searing_spec : Prop :=
  run initialKitchen [.butterSauceShrimp] = none

def one_serving_amounts_spec : Prop :=
  shrimpGFor 1 = 300 ∧
    butterGFor 1 = 7 ∧
    oilMlFor 1 = 45 ∧
    soyMlFor 1 = 10 ∧
    reduceSeconds = 15

def butterShrimpPlan_correct_for_one_spec : Prop :=
  (run initialKitchen butterShrimpPlan).isSome = true ∧
    resultIsPlated (run initialKitchen butterShrimpPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen butterShrimpPlan) = true ∧
    (shrimpGFor 1 = 300 ∧
      butterGFor 1 = 7 ∧
      oilMlFor 1 = 45 ∧
      soyMlFor 1 = 10 ∧
      reduceSeconds = 15)

end LeanToCook.ButterShrimp
