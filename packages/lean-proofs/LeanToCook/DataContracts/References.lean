
namespace LeanToCook.CatalogData

structure Reference where
  id : String
  name : String
  deriving Repr, DecidableEq

def nonempty (value : String) : Bool := !value.isEmpty

def distinct (values : List String) : Bool :=
  values.eraseDups.length == values.length

def referenceValid (value : Reference) : Bool :=
  nonempty value.id && nonempty value.name

def optionalReferenceValid (value : Option Reference) : Bool :=
  value.all referenceValid

end LeanToCook.CatalogData
