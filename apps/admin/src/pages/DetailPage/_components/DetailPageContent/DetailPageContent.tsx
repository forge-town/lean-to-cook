import { useFormState } from "react-hook-form";
import { ingredientImagePaths, type CatalogDetail } from "@repo/schemas/catalog";
import { Typography } from "../../../../components/ui/Typography";
import { Anchor } from "../../../../components/ui/Anchor";
import { Disclosure } from "../../../../components/ui/Disclosure";
import { dimensionLabel } from "../../../../lib/resources";
import { catalogHref } from "../../../../lib/navigation";
import { useEditorPageStore } from "../../../EditorPage/_store";
export type DetailPageContentProps = { record: CatalogDetail };
export const DetailPageContent = ({ record }: DetailPageContentProps) => {
  const formControl = useEditorPageStore((s) => s.formControl);
  const confirmDelete = useEditorPageStore((s) => s.confirmDelete);
  const { errors } = useFormState({ control: formControl.control });
  const values = record.values;
  const name = "title" in values ? values.title : values.name;
  const category =
    "categoryId" in values
      ? record.references.find((r) => r.kind === "category" && r.id === values.categoryId)
      : undefined;

  return (
    <div className="detail-page">
      {"imageKey" in values && values.imageKey && (
        <div className="detail-ingredient-image">
          <img alt={name} src={ingredientImagePaths[values.imageKey]} />
        </div>
      )}
      <div className="detail-section">
        <Typography as="h2">基本信息</Typography>
        <dl className="detail-facts">
          <div>
            <dt>名称</dt>
            <dd>{name}</dd>
          </div>
          {"categoryId" in values && (
            <div>
              <dt>分类</dt>
              <dd>
                {category ? (
                  <Anchor
                    href={catalogHref(
                      record.resource === "recipes" ? "recipe-categories" : "ingredient-categories",
                      { id: category.id },
                    )}
                  >
                    {category.name}
                  </Anchor>
                ) : (
                  "未分类"
                )}
              </dd>
            </div>
          )}
          {"servings" in values && (
            <div>
              <dt>份数</dt>
              <dd>{values.servings === null ? "未标注" : `${values.servings} 份`}</dd>
            </div>
          )}
          {"code" in values && (
            <>
              <div>
                <dt>单位代码</dt>
                <dd>{values.code}</dd>
              </div>
              <div>
                <dt>度量类型</dt>
                <dd>{dimensionLabel[values.dimension]}</dd>
              </div>
            </>
          )}
          {"aliases" in values && (
            <div>
              <dt>别名</dt>
              <dd>{values.aliases.length > 0 ? values.aliases.join("、") : "—"}</dd>
            </div>
          )}
          <div>
            <dt>最近修改</dt>
            <dd>{new Date(record.updatedAt).toLocaleString("zh-CN")}</dd>
          </div>
        </dl>
        {"description" in values && values.description && (
          <Typography className="detail-prose">{values.description}</Typography>
        )}
      </div>
      {"requirements" in values && (
        <>
          <div className="detail-section">
            <Typography as="h2">原料与工具</Typography>
            <ul className="detail-requirements">
              {values.requirements.map((item, index) => {
                const ingredient = record.references.find(
                  (r) => r.kind === "ingredient" && r.id === item.ingredientId,
                );
                const unit = record.references.find(
                  (r) => r.kind === "unit" && r.id === item.unitId,
                );

                const sameName = ingredient?.name === item.label;

                return (
                  <li key={index}>
                    <div>
                      {ingredient && sameName ? (
                        <Anchor href={catalogHref("ingredients", { id: ingredient.id })}>
                          {item.label}
                        </Anchor>
                      ) : (
                        <Typography as="span">{item.label}</Typography>
                      )}
                      {item.optional && (
                        <Typography as="span" className="detail-optional">
                          可选
                        </Typography>
                      )}
                    </div>
                    <div className="detail-requirement-meta">
                      {ingredient && !sameName && (
                        <Anchor href={catalogHref("ingredients", { id: ingredient.id })}>
                          {ingredient.name}
                        </Anchor>
                      )}
                      {item.quantityText && <Typography as="span">{item.quantityText}</Typography>}
                      {item.amount !== null && (
                        <Typography as="span">
                          {item.amount} {unit?.name ?? ""}
                        </Typography>
                      )}
                    </div>
                  </li>
                );
              })}
            </ul>
          </div>
          <div className="detail-section">
            <Typography as="h2">操作步骤</Typography>
            <ol className="detail-steps">
              {values.steps.map((step, index) => (
                <li key={index}>{step}</li>
              ))}
            </ol>
          </div>
          {values.notes && (
            <div className="detail-section">
              <Typography as="h2">做法提示</Typography>
              <Typography className="detail-prose">{values.notes}</Typography>
            </div>
          )}
        </>
      )}
      {!confirmDelete && errors.root?.message && (
        <div className="error-banner" role="alert">
          {errors.root.message}
        </div>
      )}
      {record.resource === "ingredients" && (
        <div className="detail-section">
          <Typography as="h2">
            关联菜谱（{record.references.filter((r) => r.kind === "recipe").length}）
          </Typography>
          {record.references.some((r) => r.kind === "recipe") ? (
            <ul className="detail-related-recipes">
              {record.references
                .filter((r) => r.kind === "recipe")
                .map((recipe) => (
                  <li key={recipe.id}>
                    <Anchor href={catalogHref("recipes", { id: recipe.id })}>{recipe.name}</Anchor>
                  </li>
                ))}
            </ul>
          ) : (
            <Typography>暂无关联菜谱</Typography>
          )}
        </div>
      )}
      {record.source && (
        <div className="source-panel">
          <Disclosure title="查看导入时的原文">
            <div className="source-meta">
              <Anchor href={record.source.url} rel="noreferrer" target="_blank">
                HowToCook ↗
              </Anchor>
              <Typography className="mono">
                {record.source.commit.slice(0, 8)} · {record.source.license}
              </Typography>
            </div>
            <Typography className="source-markdown">{record.source.markdown}</Typography>
          </Disclosure>
        </div>
      )}
    </div>
  );
};
