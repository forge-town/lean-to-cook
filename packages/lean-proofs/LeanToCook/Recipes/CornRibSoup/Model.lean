import LeanToCook.Core.Execution

namespace LeanToCook.CornRibSoup

structure KitchenState where
  heatOn : Bool := false
  ingredientsCut : Bool := false
  ribsBlanched : Bool := false
  ribsSeared : Bool := false
  brothBoiling : Bool := false
  cornSimmered : Bool := false
  carrotSimmered : Bool := false
  soupSimmered : Bool := false
  seasoned : Bool := false
  plated : Bool := false
deriving Repr, DecidableEq

inductive Step where
  | cutSoupIngredients
  | blanchRibs
  | searRibs
  | addBoilingWater
  | simmerCorn
  | simmerCarrot
  | seasonSoup
  | plateSoup
deriving Repr, DecidableEq

def ready (state : KitchenState) : Step → Bool
  | .cutSoupIngredients => true
  | .blanchRibs => !state.heatOn && state.ingredientsCut
  | .searRibs => state.heatOn && state.ribsBlanched
  | .addBoilingWater => state.heatOn && state.ribsSeared
  | .simmerCorn => state.heatOn && state.brothBoiling
  | .simmerCarrot => state.heatOn && state.cornSimmered
  | .seasonSoup => state.heatOn && state.soupSimmered
  | .plateSoup => state.heatOn && state.seasoned && state.carrotSimmered

def applyStep (state : KitchenState) : Step → KitchenState
  | .cutSoupIngredients => { state with ingredientsCut := true }
  | .blanchRibs => { state with heatOn := true, ribsBlanched := true }
  | .searRibs => { state with ribsSeared := true }
  | .addBoilingWater => { state with brothBoiling := true }
  | .simmerCorn => { state with cornSimmered := true }
  | .simmerCarrot => { state with carrotSimmered := true, soupSimmered := true }
  | .seasonSoup => { state with seasoned := true }
  | .plateSoup => { state with heatOn := false, plated := true }

def run : KitchenState → List Step → Option KitchenState :=
  LeanToCook.Core.run (fun state step =>
    if ready state step then some (applyStep state step) else none)

def initialKitchen : KitchenState := {}

def cornRibSoupPlan : List Step := [
  .cutSoupIngredients,
  .blanchRibs,
  .searRibs,
  .addBoilingWater,
  .simmerCorn,
  .simmerCarrot,
  .seasonSoup,
  .plateSoup
]

def resultIsPlated : Option KitchenState → Bool
  | some state => state.plated
  | none => false

def resultLeavesHeatOff : Option KitchenState → Bool
  | some state => !state.heatOn
  | none => false

def ribsMinGFor (pots : Nat) : Nat := 500 * pots

def ribsMaxGFor (pots : Nat) : Nat := 800 * pots

def waterMlFor (pots : Nat) : Nat := 1000 * pots

def saltMinGFor (pots : Nat) : Nat := 10 * pots

def saltMaxGFor (pots : Nat) : Nat := 15 * pots

def cornSimmerSeconds : Nat := 20 * 60

def carrotSimmerSeconds : Nat := 40 * 60

def totalSimmerSeconds : Nat := cornSimmerSeconds + carrotSimmerSeconds

end LeanToCook.CornRibSoup
