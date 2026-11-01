import { ResultAsync } from "neverthrow";
import { createFormControl } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import type { StateCreator } from "zustand";
import { ListFilterSchema, type ListFilter } from "../_schemas/ListFilter.schema";
import type { AdminLocation } from "../../../lib/resources";
import { catalogHref, navigation } from "../../../lib/navigation";
export interface ListPageSlice {
  assigningImages: boolean;
  imageAssignmentNotice: string;
  imageAssignmentFailed: boolean;
  handleAssignImagesClick: () => Promise<void>;
  formControl: ReturnType<typeof createFormControl<ListFilter>>;
  handlePageSizeValueChange: (value: string | null) => void;
  handleFilterFormSubmit: (value: ListFilter) => void;
}
export const createListPageSlice =
  (location: AdminLocation, assignImages?: () => Promise<number>): StateCreator<ListPageSlice> =>
  (set, get) => ({
    assigningImages: false,
    imageAssignmentNotice: "",
    imageAssignmentFailed: false,
    handleAssignImagesClick: async () => {
      if (get().assigningImages || !assignImages) return;
      set({ assigningImages: true, imageAssignmentNotice: "", imageAssignmentFailed: false });
      const result = await ResultAsync.fromPromise(assignImages(), () => new Error("配图失败"));
      result.match(
        (updated) =>
          set({
            assigningImages: false,
            imageAssignmentNotice: updated === 0 ? "所有食材已配图" : `已为 ${updated} 个食材配图`,
          }),
        () => set({ assigningImages: false, imageAssignmentFailed: true }),
      );
    },
    formControl: createFormControl<ListFilter>({
      resolver: zodResolver(ListFilterSchema),
      defaultValues: { search: location.search, categoryId: location.categoryId },
    }),
    handlePageSizeValueChange: (value) =>
      navigation.go(
        catalogHref(location.resource, {
          pageSize: value ?? "25",
          q: location.search,
          categoryId: location.categoryId,
        }),
      ),
    handleFilterFormSubmit: (value) =>
      navigation.go(
        catalogHref(location.resource, {
          q: value.search,
          categoryId: value.categoryId,
          pageSize: location.pageSize,
        }),
      ),
  });
