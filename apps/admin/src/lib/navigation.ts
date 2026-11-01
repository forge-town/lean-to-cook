import type { CatalogResource } from "@repo/schemas/catalog";
import { router } from "../router";
export const catalogHref = (
  resource: CatalogResource,
  params: Record<string, string | number | undefined> = {},
): string => {
  const { id, resource: _resource, ...state } = params;
  const path = `/${resource}${id ? `/${encodeURIComponent(String(id))}` : ""}`;
  const search = new URLSearchParams();
  for (const [key, value] of Object.entries(state))
    if (value !== undefined && value !== "") search.set(key, String(value));

  return `${path}${search.size > 0 ? `?${search}` : ""}`;
};
export const navigation = {
  reload: () => {
    void router.invalidate();
  },
  go: (href: string) => {
    void router.navigate({ href });
  },
};
