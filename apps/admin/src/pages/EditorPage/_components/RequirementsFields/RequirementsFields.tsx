import { useWatch } from "react-hook-form";
import { Button } from "@repo/ui/button";
import { Typography } from "../../../../components/ui/Typography";
import { NumericField } from "../../../../components/NumericField";
import { TextField } from "../../../../components/TextField";
import { ChoiceField } from "../../../../components/ChoiceField";
import { ReferenceField } from "../../../../components/ReferenceField";
import { useEditorPageStore } from "../../_store";
export const RequirementsFields = () => {
  const formControl = useEditorPageStore((s) => s.formControl);
  const handleAddRequirementButtonClick = useEditorPageStore(
    (s) => s.handleAddRequirementButtonClick,
  );
  const handleRemoveRequirementButtonClick = useEditorPageStore(
    (s) => s.handleRemoveRequirementButtonClick,
  );
  const rows = useWatch({ control: formControl.control, name: "requirements" });

  return (
    <div className="editor-section">
      <div className="section-heading">
        <Typography as="h2">原料与工具</Typography>
        <Button type="button" variant="outline" onClick={handleAddRequirementButtonClick}>
          ＋ 添加条目
        </Button>
      </div>
      {rows.map((row, index) => (
        <div key={row.key} className="requirement-row">
          <div className="row-heading">
            <Typography as="span" className="row-number">
              {String(index + 1).padStart(2, "0")}
            </Typography>
            <Button
              aria-label={`删除清单第 ${index + 1} 项`}
              disabled={rows.length <= 1}
              size="sm"
              type="button"
              variant="ghost"
              onClick={handleRemoveRequirementButtonClick.bind(null, index)}
            >
              移除
            </Button>
          </div>
          <div className="field-grid">
            <TextField label="原文" name={`requirements.${index}.label`} />
            <ChoiceField
              label="类型"
              name={`requirements.${index}.kind`}
              options={[
                { value: "unclassified", label: "待确认" },
                { value: "ingredient", label: "食材" },
                { value: "tool", label: "工具" },
              ]}
            />
            {row.kind === "ingredient" && (
              <ReferenceField
                label="关联食材"
                name={`requirements.${index}.ingredientId`}
                resource="ingredients"
              />
            )}
            <TextField
              label="用量原文"
              name={`requirements.${index}.quantityText`}
              placeholder="如：适量、半勺、100–150 克"
            />
            <NumericField
              label="数量"
              mode="decimal"
              name={`requirements.${index}.amount`}
              placeholder="不确定时留空"
            />
            <ReferenceField
              label="计量单位"
              name={`requirements.${index}.unitId`}
              resource="units"
            />
            <ChoiceField
              label="是否可省略"
              name={`requirements.${index}.optional`}
              options={[
                { value: "required", label: "必需" },
                { value: "optional", label: "可选" },
              ]}
            />
          </div>
        </div>
      ))}
    </div>
  );
};
