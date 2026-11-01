import LeanToCook.DataContracts.Ingredients
import LeanToCook.Core.Quantities

namespace LeanToCook.CatalogData

inductive RequirementKind where
  | unclassified
  | ingredient
  | tool
  deriving Repr, DecidableEq

-- Exactly one million micro-units represent one selected measurement unit.
abbrev Quantity := LeanToCook.Core.Quantity

structure Requirement where
  label : String
  kind : RequirementKind
  ingredientId : Option String
  quantityText : String
  quantity : Option Quantity
  optional : Bool
  deriving Repr, DecidableEq

structure Step where
  index : Nat
  instruction : String
  deriving Repr, DecidableEq

structure Recipe where
  id : String
  revision : String
  title : String
  category : Option Reference
  description : String
  servings : Option Nat
  notes : String
  ingredients : List Reference
  units : List Reference
  requirements : List Requirement
  steps : List Step
  deriving Repr, DecidableEq

def requirementValid (ingredientIds unitIds : List String) (value : Requirement) : Bool :=
  nonempty value.label &&
  (match value.kind, value.ingredientId with
   | .ingredient, some id => ingredientIds.contains id
   | .unclassified, none => true
   | .tool, none => true
   | _, _ => false) &&
  value.quantity.all (fun amount => amount.microUnits > 0 && unitIds.contains amount.unitId)

def orderedFrom : Nat → List Step → Bool
  | _, [] => true
  | index, step :: rest =>
      step.index == index && nonempty step.instruction && orderedFrom (index + 1) rest

def run : Nat → List Step → Option Nat
  | index, [] => some index
  | index, step :: rest =>
      if step.index == index then run (index + 1) rest else none

def recipeValid (value : Recipe) : Bool :=
  nonempty value.id && nonempty value.revision && nonempty value.title &&
  optionalReferenceValid value.category && value.servings.all (fun n => n > 0) &&
  value.ingredients.all referenceValid && distinct (value.ingredients.map (·.id)) &&
  value.units.all referenceValid && distinct (value.units.map (·.id)) &&
  !value.requirements.isEmpty &&
  value.requirements.all (requirementValid (value.ingredients.map (·.id)) (value.units.map (·.id))) &&
  !value.steps.isEmpty && orderedFrom 1 value.steps &&
  (run 1 value.steps == some (value.steps.length + 1))

end LeanToCook.CatalogData
