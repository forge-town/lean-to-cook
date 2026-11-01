import LeanToCook.Core.Execution

namespace LeanToCook.ThreeFresh

structure KitchenState where
  vegetablesClean : Bool := false
  vegetablesCut : Bool := false
  sauceMixed : Bool := false
  heatOn : Bool := false
  fryingOilHot : Bool := false
  potatoFried : Bool := false
  potatoReserved : Bool := false
  eggplantFried : Bool := false
  eggplantReserved : Bool := false
  pepperFried : Bool := false
  componentsReserved : Bool := false
  sauceThickened : Bool := false
  dishCombined : Bool := false
  plated : Bool := false
deriving Repr, DecidableEq

inductive Step where
  | washVegetables
  | cutVegetables
  | mixSauce
  | heatFryingOil
  | fryPotato
  | reservePotato
  | fryEggplant
  | reserveEggplant
  | fryPepper
  | thickenSauce
  | combineThreeFresh
  | plateThreeFresh
deriving Repr, DecidableEq

def ready (state : KitchenState) : Step → Bool
  | .washVegetables => true
  | .cutVegetables => state.vegetablesClean
  | .mixSauce => state.vegetablesCut
  | .heatFryingOil => !state.heatOn && state.sauceMixed
  | .fryPotato => state.heatOn && state.fryingOilHot && state.vegetablesCut
  | .reservePotato => state.heatOn && state.potatoFried
  | .fryEggplant => state.heatOn && state.potatoReserved && state.vegetablesCut
  | .reserveEggplant => state.heatOn && state.eggplantFried
  | .fryPepper => state.heatOn && state.eggplantReserved && state.potatoReserved
  | .thickenSauce => state.heatOn && state.sauceMixed && state.componentsReserved
  | .combineThreeFresh =>
      state.heatOn && state.sauceThickened && state.potatoReserved &&
      state.eggplantReserved && state.pepperFried
  | .plateThreeFresh => state.heatOn && state.dishCombined

def applyStep (state : KitchenState) : Step → KitchenState
  | .washVegetables => { state with vegetablesClean := true }
  | .cutVegetables => { state with vegetablesCut := true }
  | .mixSauce => { state with sauceMixed := true }
  | .heatFryingOil => { state with heatOn := true, fryingOilHot := true }
  | .fryPotato => { state with potatoFried := true }
  | .reservePotato => { state with potatoReserved := true }
  | .fryEggplant => { state with eggplantFried := true }
  | .reserveEggplant => { state with eggplantReserved := true }
  | .fryPepper => { state with pepperFried := true, componentsReserved := true }
  | .thickenSauce => { state with sauceThickened := true }
  | .combineThreeFresh => { state with dishCombined := true }
  | .plateThreeFresh => { state with heatOn := false, plated := true }

def run : KitchenState → List Step → Option KitchenState :=
  LeanToCook.Core.run (fun state step =>
    if ready state step then some (applyStep state step) else none)

def initialKitchen : KitchenState := {}

def threeFreshPlan : List Step := [
  .washVegetables,
  .cutVegetables,
  .mixSauce,
  .heatFryingOil,
  .fryPotato,
  .reservePotato,
  .fryEggplant,
  .reserveEggplant,
  .fryPepper,
  .thickenSauce,
  .combineThreeFresh,
  .plateThreeFresh
]

def resultIsPlated : Option KitchenState → Bool
  | some state => state.plated
  | none => false

def resultLeavesHeatOff : Option KitchenState → Bool
  | some state => !state.heatOn
  | none => false

def eggplantGFor (batches : Nat) : Nat := 200 * batches

def potatoGFor (batches : Nat) : Nat := 150 * batches

def pepperMinFor (batches : Nat) : Nat := 3 * batches

def pepperMaxFor (batches : Nat) : Nat := 4 * batches

def fryingOilMlFor (batches : Nat) : Nat := 150 * batches

def finishingOilMlFor (batches : Nat) : Nat := 15 * batches

def sauceWaterMlFor (batches : Nat) : Nat := 80 * batches

def potatoReserveIndex : Nat := 6

def eggplantReserveIndex : Nat := 8

def combineIndex : Nat := 11

end LeanToCook.ThreeFresh
