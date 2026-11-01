import { appliedTheoryCatalog } from "./appliedTheoryCatalog";

export const getAppliedTheoryById = (applicationId: string) =>
  appliedTheoryCatalog.find(({ id }) => id === applicationId);
