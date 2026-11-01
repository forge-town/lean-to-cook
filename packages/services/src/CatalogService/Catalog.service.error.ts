import { CatalogPersistenceError } from "@repo/models";
export class CatalogServiceError extends Error {
  constructor(
    readonly code: "CONFLICT" | "DUPLICATE" | "NOT_FOUND" | "IN_USE" | "INTERNAL",
    message: string,
    readonly originalCause?: unknown,
  ) {
    super(message);
    this.name = "CatalogServiceError";
  }
}
export const mapCatalogError = (cause: unknown): CatalogServiceError => {
  if (cause instanceof CatalogServiceError) return cause;
  if (cause instanceof CatalogPersistenceError)
    return new CatalogServiceError(cause.code, cause.message, cause);
  const databaseCode = (error: unknown): string | null => {
    if (typeof error !== "object" || error === null) return null;
    if ("code" in error && typeof error.code === "string") return error.code;

    return "cause" in error ? databaseCode(error.cause) : null;
  };
  const code = databaseCode(cause);
  if (code === "23505")
    return new CatalogServiceError("DUPLICATE", "名称或代码已存在，请换一个再保存", cause);
  if (code === "23503")
    return new CatalogServiceError(
      "IN_USE",
      "这个记录仍被使用，或关联记录已经删除，请先检查关联内容",
      cause,
    );

  return new CatalogServiceError("INTERNAL", "暂时无法完成操作，请稍后重试", cause);
};
