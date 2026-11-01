import LeanToCook.Recipes.TomatoEgg.Model

namespace LeanToCook.TomatoEgg

def tomatoEggPlan_is_executable_spec : Prop :=
  (run initialKitchen tomatoEggPlan).isSome = true

def tomatoEggPlan_plates_dish_spec : Prop :=
  resultIsPlated (run initialKitchen tomatoEggPlan) = true

def tomatoEggPlan_leaves_heat_off_spec : Prop :=
  resultLeavesHeatOff (run initialKitchen tomatoEggPlan) = true

def cannot_cut_unwashed_tomato_spec : Prop :=
  run initialKitchen [.cutTomato] = none

def oil_for_two_servings_spec : Prop :=
  oilMlFor 2 = 12

def two_serving_amounts_spec : Prop :=
  tomatoesFor 2 = 2 ∧
    eggsFor 2 = 3 ∧
    oilMlFor 2 = 12 ∧
    saltMinGFor 2 = 3 ∧
    saltMaxGFor 2 = 4 ∧
    sugarMaxGFor 2 = 4 ∧
    scallionMaxGFor 2 = 20

def three_grams_salt_is_suitable_for_two_servings_spec : Prop :=
  SuitableAmount .salt { servings := 2, prefersSweet := false } 3

def egg_is_reserved_before_combine_spec : Prop :=
  reserveEggIndex < combineIndex

def tomatoEggPlan_correct_for_two_spec : Prop :=
  (run initialKitchen tomatoEggPlan).isSome = true ∧
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

end LeanToCook.TomatoEgg
