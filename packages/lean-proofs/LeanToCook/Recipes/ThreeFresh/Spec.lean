import LeanToCook.Recipes.ThreeFresh.Model

namespace LeanToCook.ThreeFresh

def threeFreshPlan_is_executable_spec : Prop :=
  (run initialKitchen threeFreshPlan).isSome = true

def threeFreshPlan_plates_dish_spec : Prop :=
  resultIsPlated (run initialKitchen threeFreshPlan) = true

def threeFreshPlan_leaves_heat_off_spec : Prop :=
  resultLeavesHeatOff (run initialKitchen threeFreshPlan) = true

def cannot_combine_before_reserving_components_spec : Prop :=
  run initialKitchen [.combineThreeFresh] = none

def components_are_reserved_before_combine_spec : Prop :=
  potatoReserveIndex < combineIndex ∧
    eggplantReserveIndex < combineIndex

def one_batch_amounts_spec : Prop :=
  eggplantGFor 1 = 200 ∧
    potatoGFor 1 = 150 ∧
    pepperMinFor 1 = 3 ∧
    pepperMaxFor 1 = 4 ∧
    fryingOilMlFor 1 = 150 ∧
    finishingOilMlFor 1 = 15 ∧
    sauceWaterMlFor 1 = 80

def threeFreshPlan_correct_for_one_spec : Prop :=
  (run initialKitchen threeFreshPlan).isSome = true ∧
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

end LeanToCook.ThreeFresh
