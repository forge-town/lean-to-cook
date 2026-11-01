import { expect, it } from "vitest";
import { readLocation } from "./resources";
it("should read an allowed page size from the URL", () => {
  expect(readLocation("?pageSize=50&page=2")).toMatchObject({ pageSize: 50, page: 2 });
});
it("should fall back for invalid page sizes", () => {
  for (const value of ["0", "-1", "33", "NaN", "1e9"])
    expect(readLocation(`?pageSize=${value}`)).toHaveProperty("pageSize", 25);
});
