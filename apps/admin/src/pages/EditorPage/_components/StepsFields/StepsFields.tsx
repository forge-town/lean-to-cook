import { useWatch } from "react-hook-form";
import { Button } from "@repo/ui/button";
import { Typography } from "../../../../components/ui/Typography";
import { TextField } from "../../../../components/TextField";
import { useEditorPageStore } from "../../_store";
export const StepsFields = () => {
  const formControl = useEditorPageStore((s) => s.formControl);
  const handleAddStepButtonClick = useEditorPageStore((s) => s.handleAddStepButtonClick);
  const handleRemoveStepButtonClick = useEditorPageStore((s) => s.handleRemoveStepButtonClick);
  const handleMoveStepButtonClick = useEditorPageStore((s) => s.handleMoveStepButtonClick);
  const rows = useWatch({ control: formControl.control, name: "steps" });

  return (
    <div className="editor-section">
      <div className="section-heading">
        <Typography as="h2">操作步骤</Typography>
        <Button type="button" variant="outline" onClick={handleAddStepButtonClick}>
          ＋ 添加步骤
        </Button>
      </div>
      {rows.map((row, index) => (
        <div key={row.key} className="step-row">
          <Typography as="span" className="row-number">
            {String(index + 1).padStart(2, "0")}
          </Typography>
          <TextField multiline label={`第 ${index + 1} 步`} name={`steps.${index}.instruction`} />
          <div className="step-actions">
            <Button
              aria-label={`上移第 ${index + 1} 步`}
              disabled={index === 0}
              size="sm"
              type="button"
              variant="ghost"
              onClick={handleMoveStepButtonClick.bind(null, index, -1)}
            >
              ↑
            </Button>
            <Button
              aria-label={`下移第 ${index + 1} 步`}
              disabled={index === rows.length - 1}
              size="sm"
              type="button"
              variant="ghost"
              onClick={handleMoveStepButtonClick.bind(null, index, 1)}
            >
              ↓
            </Button>
            <Button
              aria-label={`删除第 ${index + 1} 步`}
              disabled={rows.length <= 1}
              size="sm"
              type="button"
              variant="ghost"
              onClick={handleRemoveStepButtonClick.bind(null, index)}
            >
              移除
            </Button>
          </div>
        </div>
      ))}
    </div>
  );
};
