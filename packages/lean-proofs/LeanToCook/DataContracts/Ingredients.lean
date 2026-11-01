import LeanToCook.DataContracts.References

namespace LeanToCook.CatalogData

structure Ingredient where
  id : String
  revision : String
  name : String
  sourceName : String
  category : Option Reference
  description : String
  aliases : List String
  imageKey : Option String
  recipeIds : List String
  deriving Repr, DecidableEq

-- This is a data contract, not a nutritional or food-safety certificate.
def ingredientValid (allowedImages : List String) (value : Ingredient) : Bool :=
  nonempty value.id && nonempty value.revision && nonempty value.name &&
  nonempty value.sourceName && optionalReferenceValid value.category &&
  value.aliases.all nonempty && distinct (value.name :: value.aliases) &&
  value.imageKey.all (fun key => allowedImages.contains key) &&
  value.recipeIds.all nonempty && distinct value.recipeIds

end LeanToCook.CatalogData
