import LeanToCook.Core.Execution

namespace LeanToCook.ButterShrimp

structure KitchenState where
  heatOn : Bool := false
  shrimpPrepared : Bool := false
  sauceMixed : Bool := false
  panHot : Bool := false
  oilHot : Bool := false
  shrimpSeared : Bool := false
  shrimpButtered : Bool := false
  seasoned : Bool := false
  sauceReduced : Bool := false
  plated : Bool := false
deriving Repr, DecidableEq

inductive Step where
  | prepareShrimp
  | mixShrimpSauce
  | heatShrimpOil
  | panFryShrimp
  | butterSauceShrimp
  | reduceShrimpSauce
  | plateShrimp
deriving Repr, DecidableEq

def ready (state : KitchenState) : Step → Bool
  | .prepareShrimp => true
  | .mixShrimpSauce => state.shrimpPrepared
  | .heatShrimpOil => !state.heatOn && state.sauceMixed
  | .panFryShrimp => state.heatOn && state.oilHot && state.shrimpPrepared
  | .butterSauceShrimp => state.heatOn && state.shrimpSeared && state.sauceMixed
  | .reduceShrimpSauce => state.heatOn && state.shrimpButtered && state.seasoned
  | .plateShrimp => state.heatOn && state.sauceReduced

def applyStep (state : KitchenState) : Step → KitchenState
  | .prepareShrimp => { state with shrimpPrepared := true }
  | .mixShrimpSauce => { state with sauceMixed := true }
  | .heatShrimpOil => { state with heatOn := true, panHot := true, oilHot := true }
  | .panFryShrimp => { state with shrimpSeared := true }
  | .butterSauceShrimp => { state with shrimpButtered := true, seasoned := true }
  | .reduceShrimpSauce => { state with sauceReduced := true }
  | .plateShrimp => { state with heatOn := false, plated := true }

def run : KitchenState → List Step → Option KitchenState :=
  LeanToCook.Core.run (fun state step =>
    if ready state step then some (applyStep state step) else none)

def initialKitchen : KitchenState := {}

def butterShrimpPlan : List Step := [
  .prepareShrimp,
  .mixShrimpSauce,
  .heatShrimpOil,
  .panFryShrimp,
  .butterSauceShrimp,
  .reduceShrimpSauce,
  .plateShrimp
]

def resultIsPlated : Option KitchenState → Bool
  | some state => state.plated
  | none => false

def resultLeavesHeatOff : Option KitchenState → Bool
  | some state => !state.heatOn
  | none => false

def shrimpGFor (servings : Nat) : Nat := 300 * servings

def butterGFor (servings : Nat) : Nat := 7 * servings

def oilMlFor (servings : Nat) : Nat := 45 * servings

def soyMlFor (servings : Nat) : Nat := 10 * servings

def reduceSeconds : Nat := 15

end LeanToCook.ButterShrimp
