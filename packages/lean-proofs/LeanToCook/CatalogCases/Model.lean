import LeanToCook.Core.Execution

namespace LeanToCook.CatalogCases

inductive CatalogCase where
  | simpleBraisedPork
  | seaweedEggSoup
  | microwaveSunnyEgg
  | perfectBoiledEgg
  | eggFriedRice
  | zhajiangNoodles
  | frozenDumplings
  | airFryerWings
  | lemonWater
  | milkTea
  | chiliOil
  | sweetSourSauce
  | bakedEggTarts
  | coffeeCoconutJelly
deriving Repr, DecidableEq

inductive Step where
  | prepare
  | process
  | finish
  | plate
deriving Repr, DecidableEq

structure Kitchen where
  prepared : Bool
  processed : Bool
  finished : Bool
  plated : Bool
  heatOn : Bool
deriving Repr, DecidableEq

def initialKitchen : Kitchen := {
  prepared := false
  processed := false
  finished := false
  plated := false
  heatOn := false
}

def usesHeat : CatalogCase → Bool
  | .lemonWater => false
  | .milkTea => false
  | _ => true

def heatAfterProcessing (recipe : CatalogCase) : Bool :=
  match recipe with
  | .chiliOil => false
  | _ => usesHeat recipe

def ready (recipe : CatalogCase) (kitchen : Kitchen) : Step → Bool
  | .prepare => !kitchen.prepared
  | .process => kitchen.prepared && !kitchen.processed && !kitchen.heatOn
  | .finish =>
      kitchen.processed && !kitchen.finished &&
        if heatAfterProcessing recipe then kitchen.heatOn else !kitchen.heatOn
  | .plate =>
      kitchen.finished && !kitchen.plated &&
        if heatAfterProcessing recipe then kitchen.heatOn else !kitchen.heatOn

def applyStep (recipe : CatalogCase) (kitchen : Kitchen) (step : Step) : Option Kitchen :=
  if ready recipe kitchen step then
    match step with
    | .prepare => some { kitchen with prepared := true }
    | .process => some {
        kitchen with
        processed := true
        heatOn := heatAfterProcessing recipe
      }
    | .finish => some { kitchen with finished := true }
    | .plate => some {
        kitchen with
        plated := true
        heatOn := false
      }
  else
    none

def run (recipe : CatalogCase) : Kitchen → List Step → Option Kitchen :=
  LeanToCook.Core.run (applyStep recipe)

def catalogPlan : List Step := [.prepare, .process, .finish, .plate]

def resultCertified : Option Kitchen → Bool
  | none => false
  | some kitchen => kitchen.plated && !kitchen.heatOn

def certified (recipe : CatalogCase) : Bool :=
  resultCertified (run recipe initialKitchen catalogPlan)

def amountMin : CatalogCase → Nat
  | .simpleBraisedPork => 1500
  | .seaweedEggSoup => 10
  | .microwaveSunnyEgg => 1
  | .perfectBoiledEgg => 1
  | .eggFriedRice => 500
  | .zhajiangNoodles => 150
  | .frozenDumplings => 7
  | .airFryerWings => 6
  | .lemonWater => 40
  | .milkTea => 180
  | .chiliOil => 100
  | .sweetSourSauce => 50
  | .bakedEggTarts => 30
  | .coffeeCoconutJelly => 10

def amountMax : CatalogCase → Nat
  | .simpleBraisedPork => 2000
  | .seaweedEggSoup => 10
  | .microwaveSunnyEgg => 1
  | .perfectBoiledEgg => 1
  | .eggFriedRice => 500
  | .zhajiangNoodles => 250
  | .frozenDumplings => 10
  | .airFryerWings => 6
  | .lemonWater => 45
  | .milkTea => 200
  | .chiliOil => 100
  | .sweetSourSauce => 50
  | .bakedEggTarts => 30
  | .coffeeCoconutJelly => 10

def contractSeconds : CatalogCase → Nat
  | .simpleBraisedPork => 4800
  | .seaweedEggSoup => 230
  | .microwaveSunnyEgg => 180
  | .perfectBoiledEgg => 1980
  | .eggFriedRice => 1500
  | .zhajiangNoodles => 1800
  | .frozenDumplings => 480
  | .airFryerWings => 1020
  | .lemonWater => 300
  | .milkTea => 1200
  | .chiliOil => 600
  | .sweetSourSauce => 300
  | .bakedEggTarts => 1500
  | .coffeeCoconutJelly => 10800

end LeanToCook.CatalogCases
