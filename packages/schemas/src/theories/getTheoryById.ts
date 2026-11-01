import { kitchenTheoryCatalog } from "./kitchenTheoryCatalog";

export const getTheoryById = (theoryId: string) =>
  kitchenTheoryCatalog.find((document) => document.id === theoryId);
