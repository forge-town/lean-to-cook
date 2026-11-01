import { useState, type ReactNode } from "react";
import { EditorPageContext, createEditorPageStore } from "../editorPageStore";
import type { EditorPageOptions } from "../editorPageSlice";
export const EditorPageStoreProvider = ({
  options,
  children,
}: {
  options: EditorPageOptions;
  children: ReactNode;
}) => {
  const [store] = useState(() => createEditorPageStore(options));

  return <EditorPageContext.Provider value={store}>{children}</EditorPageContext.Provider>;
};
