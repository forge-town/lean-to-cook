export class CatalogPersistenceError extends Error {
  constructor(
    readonly code: "CONFLICT" | "DUPLICATE" | "NOT_FOUND" | "IN_USE",
    message: string,
  ) {
    super(message);
    this.name = "CatalogPersistenceError";
  }
}
