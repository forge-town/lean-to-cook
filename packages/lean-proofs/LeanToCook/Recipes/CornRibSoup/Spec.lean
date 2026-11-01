import LeanToCook.Recipes.CornRibSoup.Model

namespace LeanToCook.CornRibSoup

def cornRibSoupPlan_is_executable_spec : Prop :=
  (run initialKitchen cornRibSoupPlan).isSome = true

def cornRibSoupPlan_plates_dish_spec : Prop :=
  resultIsPlated (run initialKitchen cornRibSoupPlan) = true

def cornRibSoupPlan_leaves_heat_off_spec : Prop :=
  resultLeavesHeatOff (run initialKitchen cornRibSoupPlan) = true

def cannot_simmer_carrot_before_corn_spec : Prop :=
  run initialKitchen [.simmerCarrot] = none

def one_pot_amounts_and_time_spec : Prop :=
  ribsMinGFor 1 = 500 ∧
    ribsMaxGFor 1 = 800 ∧
    waterMlFor 1 = 1000 ∧
    saltMinGFor 1 = 10 ∧
    saltMaxGFor 1 = 15 ∧
    totalSimmerSeconds = 3600

def cornRibSoupPlan_correct_for_one_spec : Prop :=
  (run initialKitchen cornRibSoupPlan).isSome = true ∧
    resultIsPlated (run initialKitchen cornRibSoupPlan) = true ∧
    resultLeavesHeatOff (run initialKitchen cornRibSoupPlan) = true ∧
    (ribsMinGFor 1 = 500 ∧
      ribsMaxGFor 1 = 800 ∧
      waterMlFor 1 = 1000 ∧
      saltMinGFor 1 = 10 ∧
      saltMaxGFor 1 = 15 ∧
      totalSimmerSeconds = 3600)

end LeanToCook.CornRibSoup
