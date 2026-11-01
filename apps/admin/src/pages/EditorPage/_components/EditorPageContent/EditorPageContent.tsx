import { IngredientImageField } from "../../../../components/IngredientImageField";
import { useForm } from "react-hook-form";
import { Form } from "@repo/ui/form";
import { Button } from "@repo/ui/button";
import type { CatalogDetail, CatalogResource } from "@repo/schemas/catalog";
import { Typography } from "../../../../components/ui/Typography";
import { Anchor } from "../../../../components/ui/Anchor";
import { SurfaceForm } from "../../../../components/ui/SurfaceForm";
import { NumericField } from "../../../../components/NumericField";
import { TextField } from "../../../../components/TextField";
import { ChoiceField } from "../../../../components/ChoiceField";
import { ReferenceField } from "../../../../components/ReferenceField";
import { catalogHref } from "../../../../lib/navigation";
import { resources } from "../../../../lib/resources";
import { useEditorPageStore } from "../../_store";
import { RequirementsFields } from "../RequirementsFields";
import { StepsFields } from "../StepsFields";
export const EditorPageContent = ({
  resource,
  record,
  mutationPending = false,
  inDrawer = false,
}: {
  resource: CatalogResource;
  record?: CatalogDetail;
  mutationPending?: boolean;
  inDrawer?: boolean;
}) => {
  const formControl = useEditorPageStore((s) => s.formControl);
  const handleFormSubmit = useEditorPageStore((s) => s.handleFormSubmit);
  const handleCancelButtonClick = useEditorPageStore((s) => s.handleCancelButtonClick);
  const form = useForm({ formControl: formControl.formControl });
  const label = resources.find((r) => r.name === resource)!.label;
  const busy = mutationPending || form.formState.isSubmitting;

  return (
    <div className="editor-page">
      {!inDrawer && (
        <>
          <Anchor className="back-link" href={catalogHref(resource)}>
            ← 返回{label}
          </Anchor>
          <div className="page-heading">
            <Typography as="h1">新增{label}</Typography>
          </div>
        </>
      )}
      <Form {...form}>
        <SurfaceForm onSubmit={form.handleSubmit(handleFormSubmit)}>
          <div className="editor-section">
            <div className="section-heading">
              <Typography as="h2">基本信息</Typography>
            </div>
            <div className="field-grid">
              {resource === "recipes" ? (
                <TextField label="菜谱名称" name="title" />
              ) : (
                <TextField label="名称" name="name" />
              )}
              {(resource === "recipes" || resource === "ingredients") && (
                <ReferenceField
                  label="分类"
                  name="categoryId"
                  resource={resource === "recipes" ? "recipe-categories" : "ingredient-categories"}
                />
              )}
              {resource === "recipes" && (
                <NumericField
                  label="份数"
                  mode="integer"
                  name="servings"
                  placeholder="未注明可留空"
                />
              )}
              {resource === "units" && (
                <>
                  <TextField
                    disabled={!!record}
                    label="单位代码"
                    name="code"
                    placeholder="如：g、ml、piece"
                  />
                  <ChoiceField
                    disabled={!!record}
                    label="度量类型"
                    name="dimension"
                    options={[
                      { value: "mass", label: "质量" },
                      { value: "volume", label: "体积" },
                      { value: "count", label: "计数" },
                      { value: "other", label: "其他" },
                    ]}
                  />
                </>
              )}
            </div>
            {(resource === "recipes" || resource === "ingredients") && (
              <TextField
                multiline
                label={resource === "recipes" ? "介绍" : "食材说明"}
                name="description"
              />
            )}
            {resource === "ingredients" && (
              <TextField
                multiline
                label="别名（每行一个）"
                name="aliasesText"
                placeholder="如：番茄"
              />
            )}
          </div>
          {resource === "ingredients" && (
            <div className="editor-section">
              <IngredientImageField />
            </div>
          )}
          {resource === "recipes" && (
            <>
              <RequirementsFields />
              <StepsFields />
              <div className="editor-section">
                <TextField multiline label="做法提示" name="notes" />
              </div>
            </>
          )}
          {form.formState.errors.root?.message && (
            <div className="error-banner" role="alert">
              {form.formState.errors.root.message}
            </div>
          )}
          <div className="save-bar">
            {form.formState.isDirty && (
              <Typography as="span" className="helper">
                修改未保存
              </Typography>
            )}
            <div className="button-row">
              {inDrawer ? (
                <Button type="button" variant="outline" onClick={handleCancelButtonClick}>
                  取消
                </Button>
              ) : (
                <Anchor className="quiet-button" href={catalogHref(resource)}>
                  取消
                </Anchor>
              )}
              <Button disabled={busy} type="submit">
                {busy ? "正在保存…" : "保存修改"}
              </Button>
            </div>
          </div>
        </SurfaceForm>
      </Form>
    </div>
  );
};
