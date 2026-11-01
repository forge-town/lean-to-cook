import { useForm } from "react-hook-form";
import { Form } from "@repo/ui/form";
import type { ReactNode } from "react";
import { useEditorPageStore } from "../../pages/EditorPage/_store";
export const EditorStoryForm = ({ children }: { children: ReactNode }) => {
  const formControl = useEditorPageStore((s) => s.formControl);
  const form = useForm({ formControl: formControl.formControl });

  return <Form {...form}>{children}</Form>;
};
