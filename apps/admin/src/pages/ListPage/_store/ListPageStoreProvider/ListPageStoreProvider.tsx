import { useState, type ReactNode } from "react";
import { ListPageContext, createListPageStore } from "../listPageStore";
import type { AdminLocation } from "../../../../lib/resources";
export const ListPageStoreProvider = ({
  location,
  assignImages,
  children,
}: {
  location: AdminLocation;
  assignImages?: () => Promise<number>;
  children: ReactNode;
}) => {
  const [store] = useState(() => createListPageStore(location, assignImages));

  return <ListPageContext.Provider value={store}>{children}</ListPageContext.Provider>;
};
