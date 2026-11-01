import type { StateCreator } from "zustand";
import { ResultAsync } from "neverthrow";
import { navigation } from "../../../lib/navigation";
export interface AdminShellSlice {
  headerActionsElement: HTMLDivElement | null;
  handleHeaderActionsRefChange: (node: HTMLDivElement | null) => void;
  handleLogoutButtonClick: () => Promise<void>;
}
export const createAdminShellSlice =
  (logout: () => Promise<{ success: boolean }>): StateCreator<AdminShellSlice> =>
  (set) => ({
    headerActionsElement: null,
    handleHeaderActionsRefChange: (node) => set({ headerActionsElement: node }),
    handleLogoutButtonClick: async () => {
      const result = await ResultAsync.fromPromise(logout(), () => new Error("退出失败，请重试"));
      if (result.isOk() && result.value.success) navigation.reload();
    },
  });
