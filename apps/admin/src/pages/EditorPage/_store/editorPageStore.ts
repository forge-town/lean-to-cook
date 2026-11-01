import { createContext, useContext } from "react";
import { createStore, useStore } from "zustand";
import {
  createEditorPageSlice,
  type EditorPageOptions,
  type EditorPageSlice,
} from "./editorPageSlice";
export const createEditorPageStore = (options: EditorPageOptions) =>
  createStore<EditorPageSlice>()(createEditorPageSlice(options));
export const EditorPageContext = createContext<ReturnType<typeof createEditorPageStore> | null>(
  null,
);
export const useEditorPageStore = <T>(selector: (state: EditorPageSlice) => T): T => {
  const store = useContext(EditorPageContext);
  if (!store) throw new Error("EditorPageStoreProvider is required");

  return useStore(store, selector);
};
